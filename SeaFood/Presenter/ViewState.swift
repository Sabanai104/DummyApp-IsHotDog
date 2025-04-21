//
//  ViewState.swift
//  SeaFood
//
//  Created by Gabriel Sabanai on 21/04/25.
//

import Foundation
import SwiftUICore

public protocol ViewStateProtocol: ObservableObject {
    var title: String { get set }
    var headerColor: Color { get set }
}

final class ViewState: ViewStateProtocol {
    @Published var title = "Is this Hot Dog?"
    @Published var headerColor: Color = .yellow
}
