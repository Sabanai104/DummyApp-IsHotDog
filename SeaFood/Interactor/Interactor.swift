//
//  Interactor.swift
//  SeaFood
//
//  Created by Gabriel Sabanai on 21/04/25.
//
import SwiftUI
import CoreML
import Vision

protocol InteractorProtocol {
    func processImage(image: UIImage?) async throws -> Bool
}

final class Interactor: InteractorProtocol {
    private let presenter: Presenting

    init(presenter: Presenting) {
        self.presenter = presenter
    }
    
    func processImage(image: UIImage?) async throws -> Bool {
        guard let image else { return false }

        let ciimage = CIImage(cgImage: image.cgImage!)

        try self.detect(image: ciimage)
        return true
    }

    private func detect(image: CIImage) throws {
        let config = MLModelConfiguration()
        let inceptionModel = try Inceptionv3(configuration: config)
        let model = try VNCoreMLModel(for: inceptionModel.model)

        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
            guard let results = request.results as? [VNClassificationObservation] else {
                return
            }

            Task {
                if let firstResult = results.first {
                    if firstResult.identifier.contains("hotdog") {
                        await self?.presenter.presentIsHotDog()
                    } else {
                        await self?.presenter.presentIsNotHotDog()
                    }
                }
            }
        }

        let handler = VNImageRequestHandler(ciImage: image)

        try? handler.perform([request])
    }
}
