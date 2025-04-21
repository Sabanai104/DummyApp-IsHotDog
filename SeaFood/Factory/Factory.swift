//
//  Factory.swift
//  SeaFood
//
//  Created by Gabriel Sabanai on 21/04/25.
//

final class Factory {
    @MainActor
    func make() -> ContentView {
        let viewState = ViewState()
        let presenter = Presenter(viewState: viewState)
        let interactor = Interactor(presenter: presenter)
        
        return ContentView(viewState: viewState, interactor: interactor)
    }
}
