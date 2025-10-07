package com.arabico.providers

import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*
import org.jsoup.Jsoup

class IskProvider : MainAPI() {
    override var mainUrl = "https://3isk.live"
    override var name = "3isk"
    override val hasMainPage = true
    override var lang = "ar"
    override val hasDownloadSupport = true
    override val supportedTypes = setOf(TvType.Live)

    override suspend fun getMainPage(page: Int, request: MainPageRequest): HomePageResponse {
        val items = ArrayList<HomePageList>()
        
        // قنوات رياضية
        val sportsChannels = Jsoup.connect("$mainUrl/sports-channels").get()
            .select(".channel-card").map { element ->
                val title = element.select(".channel-name").text()
                val poster = element.select("img").attr("src")
                val url = element.select("a").attr("href")
                
                newTvSeriesSearchResponse(title, url, TvType.Live) {
                    this.posterUrl = poster
                }
            }
        
        items.add(HomePageList("القنوات الرياضية", sportsChannels))
        
        // قنوات عربية
        val arabicChannels = Jsoup.connect("$mainUrl/arabic-channels").get()
            .select(".channel-card").map { element ->
                val title = element.select(".channel-name").text()
                val poster = element.select("img").attr("src")
                val url = element.select("a").attr("href")
                
                newTvSeriesSearchResponse(title, url, TvType.Live) {
                    this.posterUrl = poster
                }
            }
        
        items.add(HomePageList("القنوات العربية", arabicChannels))
        
        return HomePageResponse(items)
    }

    override suspend fun search(query: String): List<SearchResponse> {
        val doc = Jsoup.connect("$mainUrl/search?channel=$query").get()
        
        return doc.select(".search-item").map { element ->
            val title = element.select(".channel-title").text()
            val url = element.select("a").attr("href")
            val poster = element.select("img").attr("src")
            
            newTvSeriesSearchResponse(title, url, TvType.Live) {
                this.posterUrl = poster
            }
        }
    }

    override suspend fun load(url: String): LoadResponse {
        val doc = Jsoup.connect(url).get()
        
        val title = doc.select("h1.channel-title").text()
        val poster = doc.select(".channel-logo img").attr("src")
        val description = doc.select(".channel-description").text()
        
        // روابط البث
        val streamLinks = doc.select(".stream-link").map { element ->
            element.attr("href")
        }
        
        return newTvSeriesLoadResponse(title, url, TvType.Live, streamLinks) {
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
                "3isk",
                "3isk",
                data,
                "",
                Qualities.Unknown.value,
                false
            )
        )
        return true
    }
}