//
//  NetworkingTest.swift
//  Rick-and-Morty-AppTests
//
//  Created by William Santoso on 10/04/23.
//

import XCTest
@testable import Rick_and_Morty_App

final class NetworkingTest: XCTestCase {
    func test_Character_GivenCorrectUrl_ShouldGetCharacterListSucceccfully() async throws {
        let data = try await Fetcher.getCharacterList()
        
        XCTAssertTrue(!data.results.isEmpty)
    }
    func test_Character_GivenIcorrectUrl_ShouldGetError() async {
        do {
            let data = try await Fetcher.getCharacterList(url: "")
            XCTAssertTrue(data.results.isEmpty)
        } catch {
            XCTAssertNotNil(error)
        }
    }
    func test_Character_GivenNextCorrectUrl_ShouldGetCharacterListSucceccfully() async throws {
        let data = try await Fetcher.getCharacterList()
        guard let nextUrl = data.info?.next else {
            return XCTFail()
        }
        let nextData = try await Fetcher.getCharacterList(url: nextUrl)
        
        XCTAssertTrue(!nextData.results.isEmpty)
    }
    
    func test_Location_GivenCorrectUrl_ShouldGetLocationListSucceccfully() async throws {
        let data = try await Fetcher.getLocationList()
        
        XCTAssertTrue(!data.results.isEmpty)
    }
    func test_Location_GivenIcorrectUrl_ShouldGetError() async {
        do {
            let data = try await Fetcher.getLocationList(url: "")
            XCTAssertTrue(data.results.isEmpty)
        } catch {
            XCTAssertNotNil(error)
        }
    }
    
    func test_Episode_GivenCorrectUrl_ShouldGetEpisodeListSucceccfully() async throws {
        let data = try await Fetcher.getEpisodeList()
        
        XCTAssertTrue(!data.results.isEmpty)
    }
    func test_Episode_GivenIcorrectUrl_ShouldGetError() async {
        do {
            let data = try await Fetcher.getEpisodeList(url: "")
            XCTAssertTrue(data.results.isEmpty)
        } catch {
            XCTAssertNotNil(error)
        }
    }
}

// test pagination
