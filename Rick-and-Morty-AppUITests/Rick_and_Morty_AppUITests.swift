//
//  Rick_and_Morty_AppUITests.swift
//  Rick-and-Morty-AppUITests
//
//  Created by William Santoso on 10/04/23.
//

import XCTest

final class Rick_and_Morty_AppUITests: XCTestCase {
    func test_tabbar() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tabBar = app.tabBars["Tab Bar"]
        let locationButton = tabBar.buttons["Location"]
        locationButton.tap()
        
        let episodeButton = tabBar.buttons["Episode"]
        episodeButton.tap()
        
        let characterButton = tabBar.buttons["Character"]
        characterButton.tap()
    }
    
    func test_characterList() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tabBar = app.tabBars["Tab Bar"]
        let characterButton = tabBar.buttons["Character"]
        characterButton.tap()
        
        app.navigationBars["Character"].buttons["Edit"].tap()
        app.windows.children(matching: .other).element(boundBy: 1).otherElements["PopoverDismissRegion"].tap()
        app.buttons["Alive"].tap()
        app.buttons["Male"].tap()
        app.buttons["Apply"].tap()
    }
    
    func test_characterDetail() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tabBar = app.tabBars["Tab Bar"]
        let characterButton = tabBar.buttons["Character"]
        characterButton.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons["Rick Sanchez, Human"].tap()
        app.navigationBars["Rick Sanchez"].buttons["Character"].tap()
    }
    
    func test_LocationList() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tabBar = app.tabBars["Tab Bar"]
        let locationButton = tabBar.buttons["Location"]
        locationButton.tap()
    }
    
    func test_LocationDetail() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tabBar = app.tabBars["Tab Bar"]
        let locationButton = tabBar.buttons["Location"]
        locationButton.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons.containing(.staticText, identifier:"Earth (C-137)").element.tap()
        app.navigationBars["Earth (C-137)"].buttons["Location"].tap()
    }
    
    func test_EpisodeList() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tabBar = app.tabBars["Tab Bar"]
        let episodeButton = tabBar.buttons["Episode"]
        episodeButton.tap()
    }
    
    func test_EpisodeDetail() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let tabBar = app.tabBars["Tab Bar"]
        let episodeButton = tabBar.buttons["Episode"]
        episodeButton.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.buttons["Pilot, season: 1\nepisode: 1, Air Date:\nDecember 2, 2013"].tap()
        app.navigationBars["Pilot"].buttons["Episode"].tap()
    }
}
