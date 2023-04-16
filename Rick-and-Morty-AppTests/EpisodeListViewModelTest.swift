//
//  EpisodeListViewModelTest.swift
//  Rick-and-Morty-AppTests
//
//  Created by William Santoso on 14/04/23.
//

import XCTest
@testable import Rick_and_Morty_App

final class EpisodeListViewModelTest: XCTestCase {
    private var viewModel: EpisodeListViewModel = EpisodeListViewModel()
    
    override func setUp() {
        viewModel = EpisodeListViewModel()
    }
    
    
    func test_EpisodeList_GivenInitialState_ShouldGetListSucceccfully() async {
        await viewModel.fetchList()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
            XCTAssertEqual(self.viewModel.list.count, 20)
        }
    }
    
    func test_EpisodeList_GivenMoreData_ShouldGetListSucceccfully() async {
        let list = [
            Episode(id: 19, name: "Interdimensional Cable 2: Tempting Fate", airDate: "September 20, 2015", episodeSeason: "S02E08", characters: [], url: "https://rickandmortyapi.com/api/episode/19", created: "2017-11-10T12:56:35.669Z"),
            Episode(id: 20, name: "Look Who\'s Purging Now", airDate: "September 27, 2015", episodeSeason: "S02E09", characters: [], url: "https://rickandmortyapi.com/api/episode/20", created: "2017-11-10T12:56:35.772Z")
        ]
        viewModel.setList(list)
        
        let nextUrl = "https://rickandmortyapi.com/api/episode?page=2"
        
        await getMoreData()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
            XCTAssertEqual(self.viewModel.list.count, 40)
        }
    }
    
    func test_EpisodeListSearch_GivenName_ShouldGetListSucceccfully() async {
        viewModel.searchText = "rick"
        await viewModel.fetchList()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_EpisodeListSearch_GivenNameMoreData_ShouldGetListSucceccfully() async {
        let list = [
            Episode(id: 41, name: "Star Mort: Rickturn of the Jerri", airDate: "May 31, 2020", episodeSeason: "S04E10", characters: [], url: "https://rickandmortyapi.com/api/episode/41", created: "2020-08-06T05:51:52.079Z"),
            Episode(id: 42, name: "Mort Dinner Rick Andre", airDate: "June 20, 2021", episodeSeason: "S05E01", characters: [], url: "https://rickandmortyapi.com/api/episode/42", created: "2021-10-15T17:00:24.099Z")
        ]
        viewModel.setList(list)
        
        let nextUrl = "https://rickandmortyapi.com/api/episode?page=2&name=Rick"
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
