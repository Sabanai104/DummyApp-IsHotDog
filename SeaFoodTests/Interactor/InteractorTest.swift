//
//  InteractorTest.swift
//  SeaFood
//
//  Created by Gabriel Sabanai on 21/04/25.
//
import XCTest
import SwiftUI
@testable import SeaFood

final class InteractorTest: XCTestCase {
 
    func testInteractor_whenThereIsNoImage_shouldReturnFalse() async throws {
        let presenter = PresenterSpy()
        let sut = Interactor(presenter: presenter)

        let response = try await sut.processImage(image: nil)

        XCTAssertEqual(response, false)
    }

    func testInteractor_whenImageIsNotHotDog_shouldReturnTrueAndCallIsNotHotDog() async throws {
        let presenter = PresenterSpy()
        let sut = Interactor(presenter: presenter)
        
        let response = try await sut.processImage(image: generateMockImage())

        XCTAssertEqual(response, true)
        XCTAssertTrue(presenter.presentIsNotHotDogCalled.wasCalled)
        XCTAssertEqual(presenter.presentIsNotHotDogCalled.callCount, 1)
    }

    func testInteractor_whenImageIstHotDog_shouldReturnTrueAndCallIsHotDog() async throws {
        let presenter = PresenterSpy()
        let sut = Interactor(presenter: presenter)
        
        let response = try await sut.processImage(image: UIImage(named: "hotdog"))

        XCTAssertEqual(response, true)
        XCTAssertTrue(presenter.presentIsHotDogCalled.wasCalled)
        XCTAssertEqual(presenter.presentIsHotDogCalled.callCount, 1)
    }
}

func generateMockImage() -> UIImage {
    let renderer = UIGraphicsImageRenderer(size: CGSize(width: 100, height: 100))
    return renderer.image { context in
        UIColor.red.setFill()
        context.fill(CGRect(x: 0, y: 0, width: 100, height: 100))
    }
}

