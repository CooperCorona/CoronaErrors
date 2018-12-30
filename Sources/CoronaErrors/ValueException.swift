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

    public init(error:Error, message:String?, actualValue:T) {
        self.actualValue = actualValue
        super.init(error: error, message: message)
    }

    ///Constructs a ValueException with a message displaying expected value.
    /// - parameter value: The expected value.
    /// - parameter error: The error the exception represents.
    /// - parameter actualValue: The actual value causing the error. Must not be *value*.
    /// - returns: A ValueException<T> instance.
    public static func expected(value:T, error:Error, actualValue:T) -> ValueException<T> {
        return ValueException(error: error, message: "Expected \(value)", actualValue: actualValue)
    }

    ///Constructs a ValueException with a nil actual value and a message saying
    ///a non-nil value was expected. Note that the return type is `ValueException<T?>`,
    ///so exception handlers must catch the optional type to correctly handle the exception.
    /// - parameter message: The message to display to the exception handler. Default value
    ///is "Expected non-nil value".
    /// - returns: A ValueException<T?> instance.
    public static func `nil`(message:String = "Expected non-nil value") -> ValueException<T?> {
        return ValueException<T?>(error: ValueError.nil, message: message, actualValue: nil)
    }

    open override func descriptionComponents() -> [String] {
        return super.descriptionComponents() + [
            "Value: \(self.actualValue)"
        ]
    }

}
