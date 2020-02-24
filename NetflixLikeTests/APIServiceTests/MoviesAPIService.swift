//
//  MoviesAPIService.swift
//  NetflixLikeTests
//
//  Created by Quentin Eude on 26/01/2020.
//  Copyright © 2020 Quentin Eude. All rights reserved.
//

import XCTest
import Combine

@testable import NetflixLike

class MoviesAPIService: NetflixLikeTests {
    func testFetchPopularMovies() {
        let publisher = APIClient().send(GetPopularMovies())

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

        wait(for: [expectationFinished, expectationReceive], timeout: 5.0)
    }

    func testFetchTopRatedMovies() {
        let publisher = APIClient().send(GetTopRatedMovies())

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

        wait(for: [expectationFinished, expectationReceive], timeout: 5.0)
    }

    func testGetMovie() {
        let movie = anyMovie()
        var newMovie: Movie?

        let publisher = APIClient().send(GetMovie(movieId: 19404))

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
            newMovie = response
            expectationReceive.fulfill()
        })

        wait(for: [expectationFinished, expectationReceive], timeout: 5.0)
        XCTAssertNotNil(newMovie)
        XCTAssertEqual(movie.title, newMovie?.title)
    }

    func testFetchRecommendationsMovies() {
        let movie = anyMovie()

        let publisher = APIClient().send(GetRecommendationsMovies(movieId: movie.id))

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

        wait(for: [expectationFinished, expectationReceive], timeout: 5.0)
    }
}
