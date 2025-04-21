//
//  PresenterSpy.swift
//  SeaFood
//
//  Created by Gabriel Sabanai on 21/04/25.
//
import SeaFood

final class PresenterSpy: Presenting {
    private(set) var presentIsHotDogCalled = (wasCalled: false, callCount: 0)
    private(set) var presentIsNotHotDogCalled = (wasCalled: false, callCount: 0)

    func presentIsHotDog() async {
        presentIsHotDogCalled.wasCalled = true
        presentIsHotDogCalled.callCount += 1
    }
    
    func presentIsNotHotDog() async {
        presentIsNotHotDogCalled.wasCalled = true
        presentIsNotHotDogCalled.callCount += 1
    }
}
