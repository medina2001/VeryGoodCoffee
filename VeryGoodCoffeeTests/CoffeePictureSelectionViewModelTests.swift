//
//  CoffeePictureSelectionViewModelTests.swift
//  VeryGoodCoffee
//
//  Created by Gabriel Maciel on 20/11/25.
//

import XCTest
@testable import VeryGoodCoffee

final class MockCoffeeAPIService: CoffeeAPIServiceProtocol {
    var shouldThrowError = false
    var errorToThrow: Error = VGError.invalidResponse
    var dataToReturn = Data()
    var fetchCalled = false
    
    func fetchRandomCoffeePicture() async throws -> Data {
        fetchCalled = true
        if shouldThrowError {
            throw errorToThrow
        }
        return dataToReturn
    }
}

@MainActor
final class CoffeePictureSelectionViewModelTests: XCTestCase {
    
    var sut: CoffeePictureSelectionViewModel!
    var mockService: MockCoffeeAPIService!
    
    override func setUp() {
        super.setUp()
        mockService = MockCoffeeAPIService()
        sut = CoffeePictureSelectionViewModel(coffeeAPIService: mockService)
    }
    
    override func tearDown() {
        sut = nil
        mockService = nil
        super.tearDown()
    }
    
    func testGetCoffeePicture_Success_UpdatesCoffee() async {
        mockService.dataToReturn = UIImage(systemName: "cup.and.heat.waves.fill")!.pngData()!
        
        await sut.getCoffeePicture()
        
        XCTAssertNotNil(sut.coffee)
        XCTAssertNil(sut.currentError)
        XCTAssertFalse(sut.displayEmptyState)
        XCTAssertFalse(sut.isLoading)
    }
    
    func testGetCoffeePicture_Failure_SetsError() async {
        mockService.shouldThrowError = true
        mockService.errorToThrow = VGError.invalidResponse
        
        await sut.getCoffeePicture()
        
        XCTAssertNil(sut.coffee)
        XCTAssertNotNil(sut.currentError)
        XCTAssertTrue(sut.displayEmptyState)
        XCTAssertFalse(sut.isLoading)
    }
    
    func testGetCoffeePicture_ClearsErrorOnSuccess() async {
        mockService.shouldThrowError = true
        await sut.getCoffeePicture()
        XCTAssertNotNil(sut.currentError)
        
        mockService.shouldThrowError = false
        mockService.dataToReturn = UIImage(systemName: "cup.and.heat.waves.fill")!.pngData()!
        await sut.getCoffeePicture()
        
        XCTAssertNil(sut.currentError)
        XCTAssertFalse(sut.displayEmptyState)
    }
    
    func testGetCoffeePicture_CallsAPIService() async {
        mockService.dataToReturn = UIImage(systemName: "cup.and.heat.waves.fill")!.pngData()!
        
        await sut.getCoffeePicture()
        
        XCTAssertTrue(mockService.fetchCalled)
    }
}
