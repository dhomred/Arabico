package com.arabico.providers

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*
import org.jsoup.Jsoup

class BraflixProvider : MainAPI() {
    override var mainUrl = "https://braflix.ru"
    override var name = "Braflix"
    override val hasMainPage = true
    override var lang = "ar"
    override val hasDownloadSupport = true
    override val supportedTypes = setOf(TvType.Movie, TvType.TvSeries)

    override suspend fun getMainPage(page: Int, request: MainPageRequest): HomePageResponse {
        val items = ArrayList<HomePageList>()
        
        // أفلام عربية
        val arabicMovies = Jsoup.connect("$mainUrl/ar/movies").get()
            .select(".movie-card").map { element ->
                val title = element.select(".title").text()
                val poster = element.select("img").attr("src")
                val url = element.select("a").attr("href")
                val year = element.select(".year").text().toIntOrNull()
                
                newMovieSearchResponse(title, url, TvType.Movie) {
                    this.posterUrl = poster
                    this.year = year
                }
            }
        
        items.add(HomePageList("أفلام عربية", arabicMovies))
        
        // مسلسلات عربية
        val arabicSeries = Jsoup.connect("$mainUrl/ar/series").get()
            .select(".series-card").map { element ->
                val title = element.select(".title").text()
                val poster = element.select("img").attr("src")
                val url = element.select("a").attr("href")
                val year = element.select(".year").text().toIntOrNull()
                
                newTvSeriesSearchResponse(title, url, TvType.TvSeries) {
                    this.posterUrl = poster
                    this.year = year
                }
            }
        
        items.add(HomePageList("مسلسلات عربية", arabicSeries))
        
        return HomePageResponse(items)
    }

    override suspend fun search(query: String): List<SearchResponse> {
        val doc = Jsoup.connect("$mainUrl/search?q=$query").get()
        
        return doc.select(".search-result").map { element ->
            val title = element.select(".title").text()
            val url = element.select("a").attr("href")
            val poster = element.select("img").attr("src")
            val type = if (url.contains("/series/")) TvType.TvSeries else TvType.Movie
            
            if (type == TvType.Movie) {
                newMovieSearchResponse(title, url, TvType.Movie) {
                    this.posterUrl = poster
                }
            } else {
                newTvSeriesSearchResponse(title, url, TvType.TvSeries) {
                    this.posterUrl = poster
                }
            }
        }
    }

    override suspend fun load(url: String): LoadResponse {
        val doc = Jsoup.connect(url).get()
        
        val title = doc.select("h1.title").text()
        val poster = doc.select(".poster img").attr("src")
        val description = doc.select(".description").text()
        val year = doc.select(".year").text().toIntOrNull()
        
        // إذا كان رابط مسلسل
        if (url.contains("/series/")) {
            val episodes = doc.select(".episode-item").map { element ->
                val episodeTitle = element.select(".episode-title").text()
                val episodeUrl = element.select("a").attr("href")
                val episodeNumber = element.select(".episode-number").text().toIntOrNull() ?: 0
                val seasonNumber = element.select(".season-number").text().toIntOrNull() ?: 1
                
                Episode(episodeUrl, episodeTitle, seasonNumber, episodeNumber)
            }
            
            return newTvSeriesLoadResponse(title, url, TvType.TvSeries, episodes) {
                this.posterUrl = poster
                this.plot = description
                this.year = year
            }
        } else {
            // إذا كان رابط فيلم
            return newMovieLoadResponse(title, url, TvType.Movie, url) {
                this.posterUrl = poster
                this.plot = description
                this.year = year
            }
        }
    }

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit
    ): Boolean {
        val doc = Jsoup.connect(data).get()
        
        doc.select(".stream-link").forEach { element ->
            val quality = element.select(".quality").text()
            val streamUrl = element.select("a").attr("href")
            val qualityValue = when (quality) {
                "1080p" -> Qualities.P1080.value
                "720p" -> Qualities.P720.value
                "480p" -> Qualities.P480.value
                else -> Qualities.Unknown.value
            }
            
            callback(
                ExtractorLink(
                    "Braflix",
                    "Braflix - $quality",
                    streamUrl,
                    "",
                    qualityValue,
                    false
                )
            )
        }
        return true
    }
}