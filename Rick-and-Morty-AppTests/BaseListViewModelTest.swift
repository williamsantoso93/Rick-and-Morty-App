//
//  BaseListViewModelTest.swift
//  Rick-and-Morty-AppTests
//
//  Created by William Santoso on 13/04/23.
//

import XCTest
@testable import Rick_and_Morty_App

class ModelSUT: BaseModel {
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
}

final class BaseListViewModelSUT: BaseListViewModel<ModelSUT> {
    override func fetchList(url: String = "") async {
        if url == "testUrl" {
            setNextUrl("nextUrl")
            
            let list: [ModelSUT] = [
                .init(id: 1),
                .init(id: 2),
                .init(id: 3),
                .init(id: 4),
                .init(id: 5),
            ]
            
            setList(list)
        } else if url == "nextUrl" {
            setNextUrl(nil)
            
            let list: [ModelSUT] = [
                .init(id: 6),
                .init(id: 7),
                .init(id: 8),
                .init(id: 9),
                .init(id: 10),
            ]
            
            setList(list)
        }
    }
}

final class BaseListViewModelTest: XCTestCase {
    private var viewModel: BaseListViewModelSUT = BaseListViewModelSUT()
    let url = "testUrl"
    
    override func setUp() {
        super.setUp()
        
        viewModel = BaseListViewModelSUT()
    }
    
    func test_ListBase_GivenUrl_ShouldReturnList() async {
        await viewModel.fetchList(url: url)
        
        XCTAssertEqual(viewModel.list.count, 5)
    }
    
    func test_ListBase_GivenNextUrl_ShouldReturnList() async {
        await viewModel.fetchList(url: url)
        XCTAssertEqual(viewModel.list.count, 5)
        XCTAssertEqual(viewModel.list.last?.id, 5)
        
        await viewModel.getMore(id: 5)
        XCTAssertEqual(viewModel.list.count, 10)
        XCTAssertEqual(viewModel.list.last?.id, 10)
    }
}
