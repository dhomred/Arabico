rootProject.name = "Arabico"

// قائمة بجميع المزودين المتاحين
include(
    "Cima4uProvider",
    "ArabLionzProvider",
    "SagaProvider",
    "TvLive",
    "3isk",
    "Braflix",
    "365_SHOW",
    "AkwamProvider",
    "FaselHDProvider",
    "EgyBestProvider",
    "MyCimaProvider",
    "CimaNowProvider",
    "CimaClubProvider",
    "CimaFlixProvider",
    "Shahid4uProvider",
    "ArblionzProvider",
    "CimalekProvider",
    "CimaBuzzProvider",
    "CimaStreamProvider",
    "CimaProProvider",
    "CimaBoxProvider",
    "CimaMaxProvider",
    "CimaStarProvider",
    "CimaTimeProvider",
    "CimaWantedProvider",
    "Anime4upPack",
    "AnimeSaturnPack",
    "AnimeSlayerPack",
    "AnimeStarPack",
    "AnimuPack",
    "LacasaPack",
    "ArabSeedPack",
    "EgyDeadPack",
    "EgyBestPack"
)

// إعدادات مشتركة لجميع المشاريع الفرعية
gradle.beforeProject {
    group = "com.arabico"
    version = "2.0.0"
}