//
//  ValueException.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 12/30/18.
//

import Foundation

///An exception caused by an incorrect value.
open class ValueException<T>: Exception {

    ///The value that caused the exception.
    public let actualValue:T

    ///Initializes an Exception instance.
    /// - parameter error: The error causing the exception.
    /// - parameter message: A human-readable message explaining the error.
    /// - parameter actualValue: The (incorrect) value causing the exception.
    /// - parameter stackTrace: The stack trace at the time the exception was thrown.
    ///Defaults to `Thread.callStackSymbols`.
    public init(error:Error, message:String?, actualValue:T, stackTrace:[String]? = nil) {
        self.actualValue = actualValue
        super.init(error: error, message: message, stackTrace: stackTrace)
    }

    ///Constructs a ValueException with a message displaying expected value.
    /// - parameter value: The expected value.
    /// - parameter error: The error the exception represents.
    /// - parameter actualValue: The actual value causing the error. Must not be *value*.
    /// - returns: A ValueException<T> instance.
    public static func expected(value:T, error:Error, actualValue:T) -> ValueException<T> {
        return ValueException(error: error, message: "Expected \(value)", actualValue: actualValue)
    }

    open override func descriptionComponents() -> [String] {
        return super.descriptionComponents() + [
            "Value: \(self.actualValue)"
        ]
    }

}
