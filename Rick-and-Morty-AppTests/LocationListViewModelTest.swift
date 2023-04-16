//
//  LocationListViewModelTest.swift
//  Rick-and-Morty-AppTests
//
//  Created by William Santoso on 14/04/23.
//

import XCTest
@testable import Rick_and_Morty_App

final class LocationListViewModelTest: XCTestCase {
    private var viewModel: LocationListViewModel = LocationListViewModel()
    
    override func setUp() {
        viewModel = LocationListViewModel()
    }

    func test_LocationList_GivenInitialState_ShouldGetListSucceccfully() async {
        await viewModel.fetchList()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
            XCTAssertEqual(self.viewModel.list.count, 20)
        }
    }
    
    func test_LocationList_GivenMoreData_ShouldGetListSucceccfully() async {
        let list = [
            Location(id: 19, name: "Gromflom Prime", type: "Planet", dimension: "Replacement Dimension", residents: [], url: "https://rickandmortyapi.com/api/location/19", created: "2017-11-18T11:39:52.165Z"),
            Location(id: 20, name: "Earth (Replacement Dimension)", type: "Planet", dimension: "Replacement Dimension", residents: [], url: "https://rickandmortyapi.com/api/location/20", created: "2017-11-18T19:33:01.173Z")
        ]
        viewModel.setList(list)
        
        let nextUrl = "https://rickandmortyapi.com/api/location?page=2"
        viewModel.setNextUrl(nextUrl)
        
        await getMoreData()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_LocationListSearch_GivenName_ShouldGetListSucceccfully() async {
        viewModel.searchText = "earth"
        await viewModel.fetchList()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_LocationListSearch_GivenNameMoreData_ShouldGetListSucceccfully() async {
        let list = [
            Location(id: 69, name: "Earth (C-35)", type: "Planet", dimension: "Dimension C-35", residents: [], url: "https://rickandmortyapi.com/api/location/69", created: "2018-04-15T16:55:56.212Z"),
            Location(id: 71, name: "Earth (Pizza Dimension)", type: "Planet", dimension: "Pizza Dimension", residents: ["https://rickandmortyapi.com/api/character/424", "https://rickandmortyapi.com/api/character/425"], url: "https://rickandmortyapi.com/api/location/71", created: "2018-04-15T17:55:04.478Z")
        ]
        viewModel.setList(list)
        
        let nextUrl = "https://rickandmortyapi.com/api/location?page=2&name=earth"
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
}
