package com.arabico.providers

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*
import org.jsoup.Jsoup

class TvLiveProvider : MainAPI() {
    override var mainUrl = "https://tvlive.app"
    override var name = "TvLive"
    override val hasMainPage = true
    override var lang = "ar"
    override val hasDownloadSupport = true
    override val supportedTypes = setOf(TvType.Live)

    override suspend fun getMainPage(page: Int, request: MainPageRequest): HomePageResponse {
        val items = ArrayList<HomePageList>()
        
        // قنوات رياضية
        val sportsChannels = Jsoup.connect("$mainUrl/sports").get()
            .select(".channel-item").map { element ->
                val title = element.select(".title").text()
                val poster = element.select("img").attr("src")
                val url = element.select("a").attr("href")
                
                newTvSeriesSearchResponse(title, url, TvType.Live) {
                    this.posterUrl = poster
                }
            }
        
        items.add(HomePageList("القنوات الرياضية", sportsChannels))
        
        // قنوات إخبارية
        val newsChannels = Jsoup.connect("$mainUrl/news").get()
            .select(".channel-item").map { element ->
                val title = element.select(".title").text()
                val poster = element.select("img").attr("src")
                val url = element.select("a").attr("href")
                
                newTvSeriesSearchResponse(title, url, TvType.Live) {
                    this.posterUrl = poster
                }
            }
        
        items.add(HomePageList("القنوات الإخبارية", newsChannels))
        
        return HomePageResponse(items)
    }

    override suspend fun search(query: String): List<SearchResponse> {
        val doc = Jsoup.connect("$mainUrl/search?q=$query").get()
        
        return doc.select(".search-result").map { element ->
            val title = element.select(".title").text()
            val url = element.select("a").attr("href")
            val poster = element.select("img").attr("src")
            
            newTvSeriesSearchResponse(title, url, TvType.Live) {
                this.posterUrl = poster
            }
        }
    }

    override suspend fun load(url: String): LoadResponse {
        val doc = Jsoup.connect(url).get()
        
        val title = doc.select("h1").text()
        val poster = doc.select(".poster img").attr("src")
        val description = doc.select(".description").text()
        
        // روابط البث
        val streams = doc.select(".stream-link").map { element ->
            val quality = element.select(".quality").text()
            val streamUrl = element.select("a").attr("href")
            
            streamUrl to quality
        }
        
        return newTvSeriesLoadResponse(title, url, TvType.Live, streams.map { it.first }) {
            this.posterUrl = poster
            this.plot = description
        }
    }

    override suspend fun loadLinks(
        data: String,
        isCasting: Boolean,
        subtitleCallback: (SubtitleFile) -> Unit,
        callback: (ExtractorLink) -> Unit
    ): Boolean {
        callback(
            ExtractorLink(
                "TvLive",
                "TvLive",
                data,
                "",
                Qualities.Unknown.value,
                false
            )
        )
        return true
    }
}