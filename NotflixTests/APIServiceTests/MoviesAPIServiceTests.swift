//
//  TVShowsAPIServiceTests.swift
//  NotflixTests
//
//  Created by Quentin Eude on 26/01/2020.
//  Copyright © 2020 Quentin Eude. All rights reserved.
//

import XCTest
import Combine

@testable import Notflix

class MoviesAPIServiceTests: NotflixTests {
    func testFetchPopularMovies() {
        let publisher = APIClient().send(APIEndpoints.popularMovies)

        XCTAssertNotNil(publisher)

        let expectationFinished = XCTestExpectation(description: "finished")
        let expectationReceive = XCTestExpectation(description: "receiveValue")
        let expectationFailure = XCTestExpectation(description: "failure")
        expectationFailure.isInverted = true

        let cancellable = publisher.sink (receiveCompletion: { (completion) in
            switch completion {
            case .failure:
                expectationFailure.fulfill()
            case .finished:
                expectationFinished.fulfill()
            }
        }, receiveValue: { response in
            XCTAssertNotNil(response)
            XCTAssertGreaterThan(response.results.count, 0)
            expectationReceive.fulfill()
        })
        // Disable never used warning
        _ = cancellable

        wait(for: [expectationFinished, expectationReceive], timeout: 5.0)
    }

    func testFetchTopRatedMovies() {
        let publisher = APIClient().send(APIEndpoints.topRatedMovies)

        XCTAssertNotNil(publisher)

        let expectationFinished = XCTestExpectation(description: "finished")
        let expectationReceive = XCTestExpectation(description: "receiveValue")
        let expectationFailure = XCTestExpectation(description: "failure")
        expectationFailure.isInverted = true

        let cancellable = publisher.sink (receiveCompletion: { (completion) in
           switch completion {
           case .failure:
               expectationFailure.fulfill()
           case .finished:
               expectationFinished.fulfill()
           }
        }, receiveValue: { response in
           XCTAssertNotNil(response)
            XCTAssertGreaterThan(response.results.count, 0)
           expectationReceive.fulfill()
        })
        // Disable never used warning
        _ = cancellable

        wait(for: [expectationFinished, expectationReceive], timeout: 5.0)
    }

    func testGetMovie() {
        var movie: Movie?

        let publisher = APIClient().send(APIEndpoints.movie(movieId: 424))

        XCTAssertNotNil(publisher)

        let expectationFinished = XCTestExpectation(description: "finished")
        let expectationReceive = XCTestExpectation(description: "receiveValue")
        let expectationFailure = XCTestExpectation(description: "failure")
        expectationFailure.isInverted = true

        let cancellable = publisher.sink (receiveCompletion: { (completion) in
            switch completion {
            case .failure:
                expectationFailure.fulfill()
            case .finished:
                expectationFinished.fulfill()
            }
        }, receiveValue: { response in
            XCTAssertNotNil(response)
            movie = response
            expectationReceive.fulfill()
        })
        // Disable never used warning
        _ = cancellable

        wait(for: [expectationFinished, expectationReceive], timeout: 5.0)
        XCTAssertNotNil(movie)
        XCTAssertEqual(movie?.title, "Schindler's List")
    }

    func testFetchRecommendationsMovies() {
        let movie = anyMovie()

        let publisher = APIClient().send(APIEndpoints.recommendationsMovies(movieId: movie.id))

        XCTAssertNotNil(publisher)

        let expectationFinished = XCTestExpectation(description: "finished")
        let expectationReceive = XCTestExpectation(description: "receiveValue")
        let expectationFailure = XCTestExpectation(description: "failure")
        expectationFailure.isInverted = true

        let cancellable = publisher.sink (receiveCompletion: { (completion) in
            switch completion {
            case .failure:
                expectationFailure.fulfill()
            case .finished:
                expectationFinished.fulfill()
            }
        }, receiveValue: { response in
            XCTAssertNotNil(response)
            XCTAssertGreaterThan(response.results.count, 0)
            expectationReceive.fulfill()
        })
        // Disable never used warning
        _ = cancellable

        wait(for: [expectationFinished, expectationReceive], timeout: 5.0)
    }
}