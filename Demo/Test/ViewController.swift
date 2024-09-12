//
//  ViewController.swift
//  Test
//
//  Created by Hello on 2024/09/11.
//

import UIKit
import CXKMVAPIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func allBtnClick(_ sender: UIButton) {
        CXKMVNetworkAPI.fetchAll(page: 1, type:CXKMVFilmType.all.value , genre: "", country: "", release: "", orderby: "") { value in
            debugPrint("all result: \(value)")
        } fails: { error in
            debugPrint("all error: \(String(describing: error))")
        }
    }
    
    @IBAction func searchBtnClick(_ sender: UIButton) {
        CXKMVNetworkAPI.search(page: 1, keyword: "reacher") { value in
            debugPrint("search result: \(value)")
        } fails: { error in
            debugPrint("search error: \(String(describing: error))")
        }
    }
    
    @IBAction func movieBtnClick(_ sender: UIButton) {
        CXKMVNetworkAPI.movieDetail(id: "12592") { value in
            debugPrint("movie info: \(value)")
        } fails: { error in
            debugPrint("movie info error: \(String(describing: error))")
        }
    }
    
    @IBAction func tvBtnClick(_ sender: UIButton) {
        CXKMVNetworkAPI.tvDetail(id: "1010343") { value in
            debugPrint("tv info: \(value)")
        } fails: { error in
            debugPrint("tv info error: \(String(describing: error))")
        }
    }
    
    @IBAction func tvSeassonBtnClick(_ sender: UIButton) {
        CXKMVNetworkAPI.tvSeasonInfo(id: "13469") { value in
            debugPrint("tv season info: \(value)")
        } fails: { error in
            debugPrint("tv season error: \(String(describing: error))")
        }
    }
    
    @IBAction func tvEpisBtnClick(_ sender: UIButton) {
        CXKMVNetworkAPI.tvEpisodeUrl(id: "178668") { value in
            debugPrint("tv episode play info: \(value)")
        } fails: { error in
            debugPrint("tv episode play error: \(String(describing: error))")
        }
    }
    
    @IBAction func subtitleBtnClick(_ sender: UIButton) {
        CXKMVNetworkAPI.subtitle(id: "12592", type: .movie) { value in
            debugPrint("subtitles info: \(value)")
        } fails: { error in
            debugPrint("subtitles error: \(String(describing: error))")
        }
    }
    
    @IBAction func downloadSubtitleBtnClick(_ sender: UIButton) {
        let value = CXKMVSubtitleModel()
        value.short_id = "en"
        value.name = "1646400723.43.movie_v1.12592.English.srt"
        value.lang = "English"
        value.sub = "https://autoeq.top/sub_movie_v1/1646400723.43.movie_v1.12592.English.srt.zip"
        CXKMVNetworkAPI.downloadSubtitle(value) { url in
            debugPrint("subtitle saved local path: \(url.path)")
        } fails: { error in
            debugPrint("subtitle download error: \(String(describing: error))")
        }
    }
    
    @IBAction func configBtnClick(_ sender: UIButton) {
        CXKMVNetworkAPI.fetchConfig("https://movienote.web.app/configs.txt") { value in
            debugPrint("config result: \(String(describing: value))")
        }
    }

}

