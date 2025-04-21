//
//  Presenter.swift
//  SeaFood
//
//  Created by Gabriel Sabanai on 21/04/25.
//

public protocol Presenting {
    func presentIsHotDog() async
    func presentIsNotHotDog() async
}

@MainActor
final class Presenter: Presenting {
    private let viewState: any ViewStateProtocol
    
    init(viewState: any ViewStateProtocol) {
        self.viewState = viewState
    }

    func presentIsHotDog() async {
        viewState.title = "Hot Dog!"
        viewState.headerColor = .green
    }

    func presentIsNotHotDog() async {
        viewState.title = "Not a Hot Dog!"
        viewState.headerColor = .red
    }
}
