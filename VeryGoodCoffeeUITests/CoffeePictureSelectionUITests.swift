//
//  CoffeePictureSelectionUITests.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 20/11/25.
//

import XCTest

final class CoffeePictureSelectionUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testApp_LaunchesSuccessfully() {
        XCTAssertTrue(app.tabBars.buttons["New Coffee"].exists)
        XCTAssertTrue(app.tabBars.buttons["Favorites"].exists)
    }
    
    func testNewCoffeeTab_LoadsImage() {
        let timeout: TimeInterval = 10
        
        let imageExists = app.images.element(boundBy: 0).waitForExistence(timeout: timeout)
        XCTAssertTrue(imageExists)
    }
    
    func testNewCoffeeTab_TapLoadsNextImage() {
        let timeout: TimeInterval = 10
        
        let firstImage = app.images.element(boundBy: 0)
        XCTAssertTrue(firstImage.waitForExistence(timeout: timeout))
        
        firstImage.tap()
        
        sleep(2)
        XCTAssertTrue(firstImage.exists)
    }
    
    func testNewCoffeeTab_FavoriteButtonExists() {
        let timeout: TimeInterval = 10
        
        let imageExists = app.images.element(boundBy: 0).waitForExistence(timeout: timeout)
        XCTAssertTrue(imageExists)
        
        let favoriteButton = app.buttons.matching(identifier: "star").element
        XCTAssertTrue(favoriteButton.exists || app.buttons.matching(identifier: "star.fill").element.exists)
    }
    
    func testFavoritesTab_IsAccessible() {
        app.tabBars.buttons["Favorites"].tap()
        
        let favoritesTitle = app.staticTexts["My Favorite Pictures"]
        XCTAssertTrue(favoritesTitle.exists)
    }
    
    func testFavoritePicture_AppearsInFavoritesTab() {
        let timeout: TimeInterval = 10
        
        let firstImage = app.images.element(boundBy: 0)
        XCTAssertTrue(firstImage.waitForExistence(timeout: timeout))
        
        let favoriteButton = app.buttons.element(boundBy: 0)
        favoriteButton.tap()
        
        app.tabBars.buttons["Favorites"].tap()
        
        let favoriteImage = app.images.element(boundBy: 0)
        XCTAssertTrue(favoriteImage.waitForExistence(timeout: 5))
    }
    
    func testNavigationBetweenTabs() {
        app.tabBars.buttons["Favorites"].tap()
        XCTAssertTrue(app.staticTexts["My Favorite Pictures"].exists)
        
        app.tabBars.buttons["New Coffee"].tap()
        let imageExists = app.images.element(boundBy: 0).waitForExistence(timeout: 10)
        XCTAssertTrue(imageExists)
    }
}
