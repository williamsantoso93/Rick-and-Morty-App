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
    func test_CharacterDetail_GivenCorrectUrl_ShouldGetDetailSucceccfully() async throws {
        let data = try await Fetcher.getCharacterDetail(url: "https://rickandmortyapi.com/api/character/2")
        
        XCTAssertEqual(data.id, 2)
        XCTAssertEqual(data.name, "Morty Smith")
        XCTAssertEqual(data.image, "https://rickandmortyapi.com/api/character/avatar/2.jpeg")
        XCTAssertEqual(data.status, .alive)
        XCTAssertEqual(data.gender, .male)
        XCTAssertEqual(data.species, "Human")
        XCTAssertEqual(data.created, "2017-11-04T18:50:21.651Z")
        XCTAssertEqual(data.origin.name, "unknown")
        XCTAssertEqual(data.location.name, "Citadel of Ricks")
        XCTAssertTrue(!data.episode.isEmpty)
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
    func test_LocationDetail_GivenCorrectUrl_ShouldGetDetailSucceccfully() async throws {
        let data = try await Fetcher.getLocationDetail(url: "https://rickandmortyapi.com/api/location/3")
        
        XCTAssertEqual(data.id, 3)
        XCTAssertEqual(data.name, "Citadel of Ricks")
        XCTAssertEqual(data.type, "Space station")
        XCTAssertEqual(data.dimension, "unknown")
        XCTAssertEqual(data.created, "2017-11-10T13:08:13.191Z")
        XCTAssertTrue(!data.residents.isEmpty)
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
    func test_EpisodeDetail_GivenCorrectUrl_ShouldGetDetailSucceccfully() async throws {
        let data = try await Fetcher.getEpisodeDetail(url: "https://rickandmortyapi.com/api/episode/28")
        
        XCTAssertEqual(data.id, 28)
        XCTAssertEqual(data.name, "The Ricklantis Mixup")
        XCTAssertEqual(data.airDate, "September 10, 2017")
        XCTAssertEqual(data.episodeSeason, "S03E07")
        XCTAssertEqual(data.season, "3")
        XCTAssertEqual(data.episode, "7")
        XCTAssertEqual(data.created, "2017-11-10T12:56:36.618Z")
        XCTAssertTrue(!data.characters.isEmpty)
    }
}
