//
//  NilException.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 1/3/19.
//

import Foundation

///An exception thrown when a nil value of any type is accessed.
///Catch this exception when you only care about a nil value and
///not what type the value should have been.
open class AnyNilException: Exception {
    fileprivate override init(error:Error, message:String?, stackTrace:[String]? = nil) {
        super.init(error: error, message: message, stackTrace: stackTrace)
    }
}

///An exception thrown when an unexpected nil value of a specific type
///is accessed. Catch this exception when you care about the specific
///type a nil value should have been.
open class NilException<T>: AnyNilException {

    ///Initializes a NilException.
    /// - parameter stackTrace: The stack trace when the exception is thrown. Defaults to `Thread.callStackSymbols`.
    public init(stackTrace: [String]? = nil) {
        super.init(error: ValueError.nil, message: "Expected non-nil value of type \(String(describing: type(of: T.self))).", stackTrace: stackTrace)
    }

}
