//
//  ContentView.swift
//  SeaFood
//
//  Created by Gabriel Sabanai on 20/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var image: UIImage? = nil
    @State private var showCamera = false
    @State private var navigate = false
    @ObservedObject
    private var viewState: ViewState
    private let interactor: Interactor

    init(viewState: ViewState, interactor: Interactor) {
        self.viewState = viewState
        self.interactor = interactor
    }

    var body: some View {
        NavigationStack {
            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } else {
                    Text("Aperte no botão de camera para tirar uma foto!")
                }
            }
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(viewState.headerColor, for: .navigationBar)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "camera.fill")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            showCamera = true
                        }
                }
            })
            .navigationTitle("\(viewState.title)")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showCamera, onDismiss: {
                Task {
                    try await interactor.processImage(image: image)
                }
            }, content: {
                CameraView(image: $image)
            })
            .padding()
        }
    }
}

#Preview {
    ContentView(viewState: ViewState(), interactor: Interactor(presenter: Presenter(viewState: ViewState())))
}
