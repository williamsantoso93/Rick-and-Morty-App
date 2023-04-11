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
    func test_Character_GivenCorrectUrlSecondPage_ShouldGetCharacterListSucceccfully() async throws {
        let data = try await Fetcher.getCharacterList(url: "https://rickandmortyapi.com/api/character?page=2")
        
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
        var data = try await Fetcher.getCharacterList()
        
        for _ in 1...10 {
            guard let nextUrl = data.info?.next else {
                return XCTFail()
            }
            print(nextUrl)
            data = try await Fetcher.getCharacterList(url: nextUrl)
            
            XCTAssertTrue(!data.results.isEmpty)
        }
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
    func test_Location_GivenNextCorrectUrl_ShouldGetCharacterListSucceccfully() async throws {
        var data = try await Fetcher.getLocationList()
        
        for _ in 1...10 {
            guard let nextUrl = data.info?.next else {
                return XCTFail()
            }
            print(nextUrl)
            data = try await Fetcher.getLocationList(url: nextUrl)
            
            XCTAssertTrue(!data.results.isEmpty)
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
    func test_Episode_GivenNextCorrectUrl_ShouldGetCharacterListSucceccfully() async throws {
        var data = try await Fetcher.getEpisodeList()
        
        for _ in 1...10 {
            guard let nextUrl = data.info?.next else {
                return XCTFail()
            }
            print(nextUrl)
            data = try await Fetcher.getEpisodeList(url: nextUrl)
            
            XCTAssertTrue(!data.results.isEmpty)
        }
    }
}
