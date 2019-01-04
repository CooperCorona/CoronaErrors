//
//  OperationException.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 1/3/19.
//

import Foundation

///An exception thrown when an operation cannot be completed.
open class OperationException: Exception {

    ///Initializes an Exception instance.
    /// - parameter error: The error causing the exception.
    /// - parameter message: A human-readable message explaining the error.
    /// - parameter stackTrace: The stack trace at the time the exception was thrown.
    ///Defaults to `Thread.callStackSymbols`.
    public init(error: OperationError, message: String?, stackTrace: [String]?) {
        super.init(error: error, message: message, stackTrace: stackTrace)
    }

}
