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
        
        XCTAssertTrue(!viewModel.list.isEmpty)
        XCTAssertEqual(viewModel.list.count, 20)
    }
    
    func test_CharacterList_GivenMoreData_ShouldGetListSucceccfully() async {
        await viewModel.fetchList()
        
        guard let id = viewModel.list.last?.id else {
            return XCTFail("no last id")
        }
        
        await viewModel.getMore(id: id)
        
        XCTAssertTrue(!viewModel.list.isEmpty)
        XCTAssertEqual(viewModel.list.count, 40)
    }
    
    func test_CharacterListFilter_GivenName_ShouldGetListSucceccfully() async {
        await viewModel.fetchList(name: "rick")
        
        XCTAssertTrue(!viewModel.list.isEmpty)
    }
    
    func test_CharacterListFilter_GivenStatus_ShouldGetListSucceccfully() async {
        await viewModel.fetchList(status: .alive)
        
        XCTAssertTrue(!viewModel.list.isEmpty)
    }
    
    func test_CharacterListFilter_GivenSpecies_ShouldGetListSucceccfully() async {
        await viewModel.fetchList(species: "human")
        
        XCTAssertTrue(!viewModel.list.isEmpty)
    }
    
    func test_CharacterListFilter_GivenGender_ShouldGetListSucceccfully() async {
        await viewModel.fetchList(gender: .male)
        
        XCTAssertTrue(!viewModel.list.isEmpty)
    }
}
