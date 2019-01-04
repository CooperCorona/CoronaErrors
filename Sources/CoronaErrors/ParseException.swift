//
//  ParseException.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 1/3/19.
//

import Foundation

///An exception thrown when failing to parse an object.
open class ParseException: Exception {

    ///Initializes an Exception instance.
    /// - parameter error: The error causing the exception.
    /// - parameter message: A human-readable message explaining the error.
    /// - parameter stackTrace: The stack trace at the time the exception was thrown.
    ///Defaults to `Thread.callStackSymbols`.
    public init(error: ParseError, message: String, stackTrace: [String]?) {
        super.init(error: error, message: message, stackTrace: stackTrace)
    }

}
