@testable import SwiftJobSearch
import XCTest
import Moya

final class ClientTests: XCTestCase {

    var sut: Client!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Client(provider: MoyaProvider<MultiTarget>(stubClosure: MoyaProvider.immediatelyStub))
    }

    func test_requestWithMuseJob_shouldReturnJob() {
        let expected = Job(
            company: Company(companyName: "Apple"),
            description: "Dev Apps",
            jobTitle: "Swift Dev",
            id: 6325023,
            postDate: "2021-07-17T10:12:08Z")

        var response: Job?
        sut.getJobs { (result) in
            if case let .success(job) = result {
                response = job.results.first
            }
        }

        XCTAssertEqual(response, expected)
    }

    func test_requestWithListenPodcasts_shouldReturnPodcast() {
        let expected = Podcast(
            descriptionOriginal: "Dev Podcast",
            id: "2468",
            image: "https://images.com/image.jpg",
            listennotesURL: "https://www.listennotes.com",
            thumbnail: "https://images.com/thumbnail.jpg",
            titleOriginal: "Podcast Title")

        var response: Podcast?
        sut.getPodcasts { (result) in
            if case let .success(podcast) = result {
                response = podcast.results.first
            }
        }

        XCTAssertEqual(response, expected)
    }

}
