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
        await viewModel.fetchList()
        
        await getMoreData()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
            XCTAssertEqual(self.viewModel.list.count, 40)
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
        viewModel.searchText = "rick"
        await viewModel.fetchList()
        
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
        let filter = CharacterFilter(status: .alive)
        
        await getFilterList(by: filter)
        
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
        let filter = CharacterFilter(species: "human")
        
        await getFilterList(by: filter)
        
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
        let filter = CharacterFilter(gender: .male)
        
        await getFilterList(by: filter)
        
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
