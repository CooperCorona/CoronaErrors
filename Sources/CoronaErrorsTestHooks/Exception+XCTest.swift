//
//  Exception+XCTest.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 12/30/18.
//

import Foundation
import CoronaErrors
import XCTest

///Asserts that a given closure throws a specific type of exception. Fails the test
///if no exception is thrown or if the wrong type of exception is thrown.
/// - parameter type: The type of error to be thrown. Must be a subclass of Exception.
/// - parameter closure: A closure that can throw an exception.
public func XCTAssertThrowsException<T>(type:T.Type, closure:() throws -> Void) where T: Exception {
    do {
        try closure()
        XCTFail("No exception thrown. Expected \(T.self) to be thrown.")
    } catch is T {
        //Do nothing, test passes.
    } catch {
        XCTFail("Expected \(T.self) to be thrown. Actual: \(error)")
    }
}

