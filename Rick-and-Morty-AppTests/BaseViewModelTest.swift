//
//  BaseViewModelTest.swift
//  Rick-and-Morty-AppTests
//
//  Created by William Santoso on 13/04/23.
//

import XCTest
@testable import Rick_and_Morty_App

final class BaseViewModelTest: XCTestCase {
    let viewModel: BaseViewModel = BaseViewModel()
    
    func test_BaseViewModel_LoadingTrue_ShouldGetTrue() {
        viewModel.loading(true)
        
        DispatchQueue.main.async {
            XCTAssertTrue(self.viewModel.isLoading)
        }
    }
    func test_BaseViewModel_LoadingFalse_ShouldGetFalse() {
        viewModel.loading(false)
        
        DispatchQueue.main.async {
            XCTAssertFalse(self.viewModel.isLoading)
        }
    }
}
