//
//  PodcastViewModel.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/15/22.
//

import Moya

protocol PodcastsViewModelProtocol: AnyObject {
    func onUpdatedPodcasts()
}

class PodcastsViewModel {
    var podcasts: [Podcast] = []
    weak var delegate: PodcastsViewModelProtocol?
    private let client: Client

    init(client: Client = Client()) {
        self.client = client
    }

    func loadPodcasts() {
        client.getPodcasts { [weak self] result in
            switch result {
            case .success(let response):
                self?.podcasts = response.results
                self?.delegate?.onUpdatedPodcasts()
            case .failure(let error):
                print(error)
            }
        }
    }

//    func loadPodcasts2(){
//        // For command line apps, set synchronousRequest to true
//        // For GUI apps (e.g., iOS/macOS), set synchronousRequest to false
//        let client2 = PodcastAPI.Client(
//            apiKey: Secrets.ListenPodcasts.apiKey,
//            synchronousRequest: false)
//        var parameters: [String: String] = [:]
//        parameters["q"] = "Swift Development"
//        parameters["sort_by_date"] = "0"
//        parameters["type"] = "episode"
//        parameters["offset"] = "0"
//        parameters["len_min"] = "10"
//        parameters["len_max"] = "30"
//        parameters["genre_ids"] = "68,82"
//        parameters["published_before"] = "1580172454000"
//        parameters["published_after"] = "0"
//        parameters["only_in"] = "title,description"
//        parameters["language"] = "English"
//        parameters["safe_mode"] = "0"
//        client2.search(parameters: parameters) { response in
//            if let error = response.error {
//                switch(error) {
//                case PodcastApiError.authenticationError:
//                    print("wrong api key")
//                default:
//                    print("error: \(error)")
//                }
//            } else {
//                // It's a SwiftyJSON object
//                if let json = response.toJson() {
//                    //print(json)
//                }
//            }
//        }
//    }

}
