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
        await viewModel.fetchList()
        
        await getMoreData()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
            XCTAssertEqual(self.viewModel.list.count, 40)
        }
    }
    
    func test_EpisodeListSearch_GivenName_ShouldGetListSucceccfully() async {
        viewModel.searchText = "pilot"
        await viewModel.fetchList()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_EpisodeListSearch_GivenNameMoreData_ShouldGetListSucceccfully() async {
        viewModel.searchText = "pilot"
        await viewModel.fetchList()
        
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
