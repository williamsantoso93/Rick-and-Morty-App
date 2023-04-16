//
//  NetworkingTest.swift
//  Rick-and-Morty-AppTests
//
//  Created by William Santoso on 10/04/23.
//

import XCTest
@testable import Rick_and_Morty_App

final class NetworkingTest: XCTestCase {
    //MARK: - Character
    func test_CharacterList_GivenCorrectUrl_ShouldGetCharacterListSucceccfully() async throws {
        let data = try await Fetcher.getCharacterList()
        
        XCTAssertTrue(!data.results.isEmpty)
    }
    func test_CharacterList_GivenIcorrectUrl_ShouldGetError() async {
        do {
            let data = try await Fetcher.getCharacterList(url: "https://123.com")
            XCTAssertTrue(data.results.isEmpty)
        } catch {
            XCTAssertNotNil(error)
        }
    }
    func test_CharacterList_GivenNextCorrectUrl_ShouldGetCharacterListSucceccfully() async throws {
        var data = try await Fetcher.getCharacterList()
        
        guard let nextUrl = data.info?.next else {
            return XCTFail()
        }
        
        data = try await Fetcher.getCharacterList(url: nextUrl)
        
        XCTAssertTrue(!data.results.isEmpty)
    }
    func test_CharacterList_GivenUrlFilterName_ShouldGetCharacterListSucceccfully() async throws {
        let name = "rick"
        let data = try await Fetcher.getCharacterList(name: name)
        
        XCTAssertTrue(!data.results.isEmpty)
        XCTAssertTrue(data.results[0].name.lowercased().contains(name))
    }
    func test_CharacterList_GivenUrlFilterStatus_ShouldGetCharacterListSucceccfully() async throws {
        let status = Status.alive
        let data = try await Fetcher.getCharacterList(status: .alive)
        
        XCTAssertTrue(!data.results.isEmpty)
        XCTAssertEqual(data.results[0].status, status)
    }
    func test_CharacterList_GivenUrlFilterSpecies_ShouldGetCharacterListSucceccfully() async throws {
        let species = "human"
        let data = try await Fetcher.getCharacterList(species: species)
        
        XCTAssertTrue(!data.results.isEmpty)
        XCTAssertTrue(data.results[0].species.lowercased().contains(species))
    }
    func test_CharacterList_GivenUrlFilterGender_ShouldGetCharacterListSucceccfully() async throws {
        let gender = Gender.male
        let data = try await Fetcher.getCharacterList(gender: gender)
        
        XCTAssertTrue(!data.results.isEmpty)
        XCTAssertEqual(data.results[0].gender, gender)
    }
    
    //MARK: - Location
    func test_LocationList_GivenCorrectUrl_ShouldGetLocationListSucceccfully() async throws {
        let data = try await Fetcher.getLocationList()
        
        XCTAssertTrue(!data.results.isEmpty)
    }
    func test_LocationList_GivenIcorrectUrl_ShouldGetError() async {
        do {
            let data = try await Fetcher.getLocationList(url: "https://123.com")
            XCTAssertTrue(data.results.isEmpty)
        } catch {
            XCTAssertNotNil(error)
        }
    }
    func test_LocationList_GivenNextCorrectUrl_ShouldGetLocationListSucceccfully() async throws {
        var data = try await Fetcher.getLocationList()
        
        guard let nextUrl = data.info?.next else {
            return XCTFail()
        }
        
        data = try await Fetcher.getLocationList(url: nextUrl)
        
        XCTAssertTrue(!data.results.isEmpty)
    }
    func test_LocationList_GivenUrlFilterName_ShouldGetCharacterListSucceccfully() async throws {
        let name = "citadel"
        let data = try await Fetcher.getLocationList(name: name)
        
        XCTAssertTrue(!data.results.isEmpty)
        XCTAssertTrue(data.results[0].name.lowercased().contains(name))
    }
    
    //MARK: - Episode
    func test_EpisodeList_GivenCorrectUrl_ShouldGetEpisodeListSucceccfully() async throws {
        let data = try await Fetcher.getEpisodeList()
        
        XCTAssertTrue(!data.results.isEmpty)
    }
    func test_EpisodeList_GivenIcorrectUrl_ShouldGetError() async {
        do {
            let data = try await Fetcher.getEpisodeList(url: "https://123.com")
            XCTAssertTrue(data.results.isEmpty)
        } catch {
            XCTAssertNotNil(error)
        }
    }
    func test_EpisodeList_GivenNextCorrectUrl_ShouldGetEpisodeListSucceccfully() async throws {
        var data = try await Fetcher.getEpisodeList()
        
        guard let nextUrl = data.info?.next else {
            return XCTFail()
        }
        
        data = try await Fetcher.getEpisodeList(url: nextUrl)
        
        XCTAssertTrue(!data.results.isEmpty)
    }
    func test_EpisodeList_GivenUrlFilterName_ShouldGetCharacterListSucceccfully() async throws {
        let name = "pilot"
        let data = try await Fetcher.getEpisodeList(name: name)
        
        XCTAssertTrue(!data.results.isEmpty)
        XCTAssertTrue(data.results[0].name.lowercased().contains(name))
    }
}
