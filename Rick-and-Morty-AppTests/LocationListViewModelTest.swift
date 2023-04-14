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
        await viewModel.fetchList()
        
        await getMoreData()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
            XCTAssertEqual(self.viewModel.list.count, 40)
        }
    }
    
    func test_LocationListSearch_GivenName_ShouldGetListSucceccfully() async {
        viewModel.searchText = "citadel"
        await viewModel.fetchList()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_LocationListSearch_GivenNameMoreData_ShouldGetListSucceccfully() async {
        viewModel.searchText = "citadel"
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
