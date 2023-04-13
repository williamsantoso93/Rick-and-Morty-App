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
    
    func test_CharacterList_GivenInitialState_ShouldGetListSucceccfully() async {
        await viewModel.fetchList()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
            XCTAssertEqual(self.viewModel.list.count, 20)
            print(self.viewModel.list.first)
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
        await viewModel.fetchList(name: "rick")
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_CharacterListFilter_GivenNameMoreData_ShouldGetListSucceccfully() async {
        await viewModel.fetchList(name: "rick")
        
        await getMoreData()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_CharacterListFilter_GivenStatus_ShouldGetListSucceccfully() async {
        await viewModel.fetchList(status: .alive)
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_CharacterListFilter_GivenStatusMoreData_ShouldGetListSucceccfully() async {
        await viewModel.fetchList(status: .alive)
        
        await getMoreData()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_CharacterListFilter_GivenSpecies_ShouldGetListSucceccfully() async {
        await viewModel.fetchList(species: "human")
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_CharacterListFilter_GivenSpeciesMoreData_ShouldGetListSucceccfully() async {
        await viewModel.fetchList(species: "human")
        
        await getMoreData()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_CharacterListFilter_GivenGender_ShouldGetListSucceccfully() async {
        await viewModel.fetchList(gender: .male)
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    func test_CharacterListFilter_GivenGenderMoreData_ShouldGetListSucceccfully() async {
        await viewModel.fetchList(gender: .male)
        
        await getMoreData()
        
        DispatchQueue.main.async {
            XCTAssertTrue(!self.viewModel.list.isEmpty)
        }
    }
    
    private func getMoreData() async {
        guard let id = viewModel.list.last?.id else {
            return XCTFail("no last id")
        }
        
        await viewModel.getMore(id: id)
    }
}
