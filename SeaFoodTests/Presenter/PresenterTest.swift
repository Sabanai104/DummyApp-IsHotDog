//
//  PresenterTest.swift
//  SeaFood
//
//  Created by Gabriel Sabanai on 21/04/25.
//

import XCTest
@testable import SeaFood

@MainActor
final class PresenterTest: XCTestCase {
    
    func testPresenter_whenCallPresentIsHotDog_shouldChangeHeaderAndTitle() async {
        let viewState = ViewStateSpy()
        let sut = Presenter(viewState: viewState)

        XCTAssertEqual(viewState.title, "")
        XCTAssertEqual(viewState.headerColor, .clear)
        await sut.presentIsHotDog()
        
        XCTAssertEqual(viewState.title, "Hot Dog!")
        XCTAssertEqual(viewState.headerColor, .green)
    }

    func testPresenter_whenCallPresentIsNotHotDog_shouldChangeHeaderAndTitle() async {
        let viewState = ViewStateSpy()
        let sut = Presenter(viewState: viewState)
        
        XCTAssertEqual(viewState.title, "")
        XCTAssertEqual(viewState.headerColor, .clear)
        await sut.presentIsNotHotDog()

        XCTAssertEqual(viewState.title, "Not a Hot Dog!")
        XCTAssertEqual(viewState.headerColor, .red)
    }
}
