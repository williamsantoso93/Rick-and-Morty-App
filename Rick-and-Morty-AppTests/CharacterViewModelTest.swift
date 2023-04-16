//
//  CharacterViewModelTest.swift
//  Rick-and-Morty-AppTests
//
//  Created by William Santoso on 13/04/23.
//

import XCTest
@testable import Rick_and_Morty_App

final class CharacterListViewModelTest: XCTestCase {
    private var viewModel: CharacterListViewModel = CharacterListViewModel()
    
    override func setUp() {
        viewModel = CharacterListViewModel()
    }
    
    func test_CharacterList_GivenInitialState_ShouldGetListSucceccfully() async {
        await viewModel.fetchList()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
            XCTAssertEqual(self.viewModel.list.count, 20)
        }
    }
    
    func test_CharacterList_GivenMoreData_ShouldGetListSucceccfully() async {
        let list = [
            Character(id: 19, name: "Antenna Rick", status: .unknown, species: "Human", type: "Human with antennae", gender: .male, origin: CharacterLocation(name: "unknown", url: ""), location: CharacterLocation(name: "unknown", url: ""), image: "https://rickandmortyapi.com/api/character/avatar/19.jpeg", episode: ["https://rickandmortyapi.com/api/episode/10"], url: "https://rickandmortyapi.com/api/character/19", created: "2017-11-04T22:28:13.756Z"),
            Character(id: 20, name: "Ants in my Eyes Johnson", status: .unknown, species: "Human", type: "Human with ants in his eyes", gender: .male, origin: CharacterLocation(name: "unknown", url: ""), location: CharacterLocation(name: "Interdimensional Cable", url: "https://rickandmortyapi.com/api/location/6"), image: "https://rickandmortyapi.com/api/character/avatar/20.jpeg", episode: ["https://rickandmortyapi.com/api/episode/8"], url: "https://rickandmortyapi.com/api/character/20", created: "2017-11-04T22:34:53.659Z")
        ]
        viewModel.setList(list)
        
        let nextUrl = "https://rickandmortyapi.com/api/character?page=2"
        viewModel.setNextUrl(nextUrl)
        
        await getMoreData()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_CharacterListFilter_GivenName_ShouldGetListSucceccfully() async {
        viewModel.searchText = "rick"
        await viewModel.fetchList()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_CharacterListFilter_GivenNameMoreData_ShouldGetListSucceccfully() async {
        let list = [
            Character(id: 187, name: "Juggling Rick", status: .unknown, species: "Human", type: "", gender: .male, origin: CharacterLocation(name: "unknown", url: ""), location: CharacterLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/187.jpeg", episode: ["https://rickandmortyapi.com/api/episode/28"], url: "https://rickandmortyapi.com/api/character/187", created: "2017-12-29T18:59:47.440Z"),
            Character(id: 215, name: "Maximums Rickimus", status: .dead, species: "Human", type: "", gender: .male, origin: CharacterLocation(name: "unknown", url: ""), location: CharacterLocation(name: "Rick\'s Memories", url: "https://rickandmortyapi.com/api/location/126"), image: "https://rickandmortyapi.com/api/character/avatar/215.jpeg", episode: ["https://rickandmortyapi.com/api/episode/10", "https://rickandmortyapi.com/api/episode/22", "https://rickandmortyapi.com/api/episode/51"], url: "https://rickandmortyapi.com/api/character/215", created: "2017-12-30T14:27:55.489Z")
        ]
        viewModel.setList(list)
        
        let nextUrl = "https://rickandmortyapi.com/api/character?page=2&name=rick"
        viewModel.setNextUrl(nextUrl)
        
        await getMoreData()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_CharacterListFilter_GivenStatus_ShouldGetListSucceccfully() async {
        let filter = CharacterFilter(status: .alive)
        
        await getFilterList(by: filter)
    }
    
    func test_CharacterListFilter_GivenStatusMoreData_ShouldGetListSucceccfully() async {
        let list = [
            Character(id: 38, name: "Beth Smith", status: .alive, species: "Human", type: "", gender: .female, origin: CharacterLocation(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"), location: CharacterLocation(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"), image: "https://rickandmortyapi.com/api/character/avatar/38.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1", "https://rickandmortyapi.com/api/episode/2", "https://rickandmortyapi.com/api/episode/3", "https://rickandmortyapi.com/api/episode/4", "https://rickandmortyapi.com/api/episode/5", "https://rickandmortyapi.com/api/episode/6", "https://rickandmortyapi.com/api/episode/22", "https://rickandmortyapi.com/api/episode/51"], url: "https://rickandmortyapi.com/api/character/38", created: "2017-11-05T09:48:44.230Z"),
            Character(id: 39, name: "Beth Smith", status: .alive, species: "Human", type: "", gender: .female, origin: CharacterLocation(name: "Earth (Evil Rick\'s Target Dimension)", url: "https://rickandmortyapi.com/api/location/34"), location: CharacterLocation(name: "Earth (Evil Rick\'s Target Dimension)", url: "https://rickandmortyapi.com/api/location/34"), image: "https://rickandmortyapi.com/api/character/avatar/39.jpeg", episode: ["https://rickandmortyapi.com/api/episode/10"], url: "https://rickandmortyapi.com/api/character/39", created: "2017-11-05T09:52:31.777Z")
        ]
        viewModel.setList(list)
        
        let nextUrl = "https://rickandmortyapi.com/api/character?page=2&status=alive"
        viewModel.setNextUrl(nextUrl)
        
        await getMoreData()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_CharacterListFilter_GivenSpecies_ShouldGetListSucceccfully() async {
        let filter = CharacterFilter(species: "human")
        
        await getFilterList(by: filter)
    }
    
    func test_CharacterListFilter_GivenSpeciesMoreData_ShouldGetListSucceccfully() async {
        let list = [
            Character(id: 28, name: "Attila Starwar", status: .alive, species: "Human", type: "", gender: .male, origin: CharacterLocation(name: "unknown", url: ""), location: CharacterLocation(name: "Interdimensional Cable", url: "https://rickandmortyapi.com/api/location/6"), image: "https://rickandmortyapi.com/api/character/avatar/28.jpeg", episode: ["https://rickandmortyapi.com/api/episode/8", "https://rickandmortyapi.com/api/episode/13", "https://rickandmortyapi.com/api/episode/17"], url: "https://rickandmortyapi.com/api/character/28", created: "2017-11-05T09:02:16.595Z"),
            Character(id: 29, name: "Baby Legs", status: .alive, species: "Human", type: "Human with baby legs", gender: .male, origin: CharacterLocation(name: "unknown", url: ""), location: CharacterLocation(name: "Interdimensional Cable", url: "https://rickandmortyapi.com/api/location/6"), image: "https://rickandmortyapi.com/api/character/avatar/29.jpeg", episode: ["https://rickandmortyapi.com/api/episode/8"], url: "https://rickandmortyapi.com/api/character/29", created: "2017-11-05T09:06:19.644Z")
        ]
        viewModel.setList(list)
        
        let nextUrl = "https://rickandmortyapi.com/api/character?page=2&species=human"
        viewModel.setNextUrl(nextUrl)
        
        await getMoreData()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_CharacterListFilter_GivenGender_ShouldGetListSucceccfully() async {
        let filter = CharacterFilter(gender: .male)
        
        await getFilterList(by: filter)
    }
    
    func test_CharacterListFilter_GivenGenderMoreData_ShouldGetListSucceccfully() async {
        let list = [
            Character(id: 24, name: "Armagheadon", status: .alive, species: "Alien", type: "Cromulon", gender: .male, origin: CharacterLocation(name: "Signus 5 Expanse", url: "https://rickandmortyapi.com/api/location/22"), location: CharacterLocation(name: "Signus 5 Expanse", url: "https://rickandmortyapi.com/api/location/22"), image: "https://rickandmortyapi.com/api/character/avatar/24.jpeg", episode: ["https://rickandmortyapi.com/api/episode/16"], url: "https://rickandmortyapi.com/api/character/24", created: "2017-11-05T08:48:30.776Z"),
            Character(id: 25, name: "Armothy", status: .dead, species: "unknown", type: "Self-aware arm", gender: .male, origin: CharacterLocation(name: "Post-Apocalyptic Earth", url: "https://rickandmortyapi.com/api/location/8"), location: CharacterLocation(name: "Post-Apocalyptic Earth", url: "https://rickandmortyapi.com/api/location/8"), image: "https://rickandmortyapi.com/api/character/avatar/25.jpeg", episode: ["https://rickandmortyapi.com/api/episode/23"], url: "https://rickandmortyapi.com/api/character/25", created: "2017-11-05T08:54:29.343Z")
        ]
        viewModel.setList(list)
        
        let nextUrl = "https://rickandmortyapi.com/api/character?page=2&gender=male"
        viewModel.setNextUrl(nextUrl)
        
        await getMoreData()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    private func getMoreData() async {
        guard let id = viewModel.list.last?.id else {
            return XCTFail("no last id")
        }
        
        await self.viewModel.getMore(id: id)
    }
    
    private func getFilterList(by filter: CharacterFilter) async {
        await viewModel.fetchList(filter: filter)
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
}
