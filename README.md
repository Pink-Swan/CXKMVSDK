# Overseas Movie & TV Network Request SDK

## Overview

The **Overseas Movie & TV Network Request SDK** provides an easy-to-use network request solution designed for accessing **movie and TV content from overseas servers**. This SDK is optimized for speed, efficiency, and secure data transmission.

### Features

- **High Performance**: Engineered for fast and efficient network requests, ensuring seamless movie and TV content streaming.
- **Flexible Integration**: Easily integrates with iOS applications, offering customizable network request options.
- **Secure Data Transmission**: Utilizes built-in encryption mechanisms to guarantee secure communication and prevent data leaks.
- **Robust Error Handling**: Comprehensive error management framework, providing clear and actionable error responses for improved user experiences.
- **Pagination Support**: Efficiently handles large datasets with support for pagination and filtering options.

### Requirements

- iOS 13.0+
- Xcode 14.0+
- Swift 5.0+

### Cocopods

Add the following line to your Podfile:

```
pod 'CXKMVAPIKit', :git => 'https://github.com/Pink-Swan/CXKMVSDK.git'
pod 'HandyJSON', :git => 'https://github.com/Pink-Swan/HandyJSON.git'
```

Then, run the following command:

```$ pod install```

### [TG Group](https://t.me/cxkmvsdk)

## 1. Classification and Movie List

> This interface returns all supported query conditions and recommended movie lists. You can also query the movie data in pages according to the conditions.

### 1.1 Parameters
#### Condition (optional)
- **type**: `all | movie | tv`
- **genre**
- **country**
- **release**
- **orderby**
- **page**

### 1.2 Example
```swift
CXKMVNetworkAPI.fetchAll(page: 1, type:CXKMVFilmType.all.value, genre: "", country: "", release: "", orderby: "") { value in
    debugPrint("all result: \(value)")
} fails: { error in
    debugPrint("all error: \(String(describing: error))")
}
```

<details>
  <summary>Results</summary>

    @objcMembers
    public class CXKMVAPIAllDatas: CXKBaseModel {
        public var recommends: [CXKMVRecommendModel] = []
        public var filters: CXKMVFiltersModel = CXKMVFiltersModel()
        
        public var data_type = ""
    }

    @objcMembers
    public class CXKMVFiltersModel: CXKBaseModel {
        public var orderbys: [CXKMVFilterModel] = []
        public var genres: [CXKMVFilterModel] = []
        public var pubs: [CXKMVFilterModel] = []
        public var types: [CXKMVFilterModel] = []
        public var countrys: [CXKMVFilterModel] = []
    }

    @objcMembers
    public class CXKMVFilterModel: CXKBaseModel {
        public var title: String = ""
        public var id: String = ""
    }
</details>

## 2. Search

> This interface allows you to search for related film and television content based on keywords and supports paging.

### 2.1 Parameters (optional)
- **page**: paging page number (default value: 1)
- **keyword**: search keyword (optional)

### 2.2 Examples

```swift
CXKMVNetworkAPI.search(page: 1, keyword: "reacher") { value in
    debugPrint("search result: \(value)")
} fails: { error in
    debugPrint("search error: \(String(describing: error))")
}
```
<details>
  <summary>Results</summary>

    @objcMembers
    public class CXKMVAPISearchDatas: CXKBaseModel {
        public var contents: [CXKMVFilmModel] = []
        
        public var keywords: [String] = [] // Recommended search terms
    }
</details>

## 3. Movie Details

> Get detailed information of a movie based on the movie ID.

### 3.1 Parameters
- **id**: unique identifier of the movie

### 3.2 Example

```swift
CXKMVNetworkAPI.movieDetail(id: "12592") { value in
    debugPrint("movie info: \(value)")
} fails: { error in
    debugPrint("movie info error: \(String(describing: error))")
}
```

<details>
  <summary>Results</summary>

    @objcMembers
    public class CXKMVBaseContentModel: CXKBaseModel {
        public var id: String = ""
        public var title: String = ""
        public var cover: String = ""
        public var rate: String = ""
        public var time: String = "" // 168 2018-01-22
        public var genres:[String] = [] // 356 categories
        public var country: String = "" // country
        public var des: String = "" // Details
        public var type: CXKMVFilmType = .movie
        public var source: String = ""
        public var quality = "" // HD SD empty
        public var like = 0 // Number of likes
        public var unlike = 0 // Number of likes
        public var stars: [CXKMVStarModel] = []
        public var relations = [CXKMVContentRelatedModel]()        
    }

    @objcMembers
    public class CXKMVMovieContentModel: CXKMVBaseContentModel {
        public var qualitys: [CXKMVSourceQualityModel] = []
        
        public override func mapping(mapper: HelpingMapper) {
            super.mapping(mapper: mapper)
        }
    }
</details>

---

## 4. TV series details

> Get detailed information of a TV series based on the TV series ID.

### 4.1 Parameters
- **id**: unique identifier of the TV series

### 4.2 Examples

```swift
CXKMVNetworkAPI.tvDetail(id: "1010343") { value in
    debugPrint("tv info: \(value)")
} fails: { error in
    debugPrint("tv info error: \(String(describing: error))")
}
```

<details>
  <summary>Results</summary>

    @objcMembers
    public class CXKMVBaseContentModel: CXKBaseModel {
        public var id: String = ""
        public var title: String = ""
        public var cover: String = ""
        public var rate: String = ""
        public var time: String = "" // 168 2018-01-22
        public var genres:[String] = [] // 356 categories
        public var country: String = "" // country
        public var des: String = "" // Details
        public var type: CXKMVFilmType = .movie
        public var source: String = ""
        public var quality = "" // HD SD empty
        public var like = 0 // Number of likes
        public var unlike = 0 // Number of likes
        public var stars: [CXKMVStarModel] = []
        public var relations = [CXKMVContentRelatedModel]()        
    }

    @objcMembers
    public class CXKMVTVContentModel: CXKMVBaseContentModel {
        public var seasons: [CXKMVTVSeasonModel] = []
        
        public override func mapping(mapper: HelpingMapper) {
            super.mapping(mapper: mapper)
            mapper.specify(property: &seasons, name: "155")
            mapper.specify(property: &stars, name: "263")
        }
    }
</details>

---

## 5. TV Season Information

> Get detailed information about a specified season based on a TV series ID.

### 5.1 Parameters
- **id**: unique identifier of a TV series

### 5.2 Examples

```swift
CXKMVNetworkAPI.tvSeasonInfo(id: "13469") { value in
    debugPrint("tv season info: \(value)")
} fails: { error in
    debugPrint("tv season error: \(String(describing: error))")
}
```

<details>
  <summary>Results</summary>

    @objcMembers
    public class CXKMVTVSeasonModel: CXKBaseModel {
        public var title: String = ""
        public var id: String = ""
        
        public var episodes: [CXKMVTVEpisodeModel] = []
    }

    @objcMembers
    public class CXKMVTVEpisodeModel: CXKBaseModel {
        public var title: String = ""
        public var id: String = ""
        public var order: Int = -1
    }
</details>

---

## 6. TV Series Playback Link

> Get the available playback link based on the TV series ID.

### 6.1 Parameters
- **id**: Unique identifier of the TV series

### 6.2 Example

```swift
CXKMVNetworkAPI.tvEpisodeUrl(id: "178668") { value in
    debugPrint("tv episode play info: \(value)")
} fails: { error in
    debugPrint("tv episode play error: \(String(describing: error))")
}
```

<details>
  <summary>Results</summary>

    @objcMembers
    public class CXKMVSourceQualityModel: CXKBaseModel {
        public var title: String = ""
        public var playUrl: String = ""
    }
</details>

---

## 7. Subtitle Information

> Get available subtitle information based on the movie ID and type.

### 7.1 Parameters
- **id**: unique identifier of the movie
- **type**: movie type (movie or TV series)

### 7.2 Examples

```swift
CXKMVNetworkAPI.subtitle(id: "12592", type: .movie) { value in
    debugPrint("subtitles info: \(value)")
} fails: { error in
    debugPrint("subtitles error: \(String(describing: error))")
}
```

<details>
  <summary>Results</summary>

    @objcMembers
    public class CXKMVSubtitleModel: CXKBaseModel {
        public var short_id: String = ""
        public var name: String = ""
        public var lang: String = ""
        public var sub: String = ""
    }
</details>

---

## 8. Download subtitle file

> Download the specified subtitle file.

### 8.1 Parameters
- **model**: subtitle model

### 8.2 Example

```swift
CXKMVNetworkAPI.downloadSubtitle(subtitleModel) { url in
    debugPrint("subtitle saved local path: \(url.path)")
} fails: { error in
    debugPrint("subtitle download error: \(String(describing: error))")
}
```
- **Results**: The path where the downloaded characters are saved
