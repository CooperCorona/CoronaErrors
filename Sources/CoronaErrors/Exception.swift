//
//  Exception.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 12/30/18.
//

import Foundation

///An error that can be thrown. Encapsulates the type of
///error, the description, and any additional metadata.
open class Exception: Error, CustomStringConvertible {

    ///The error that caused the exception.
    public let error:Error
    ///A description of the exception, or *nil* if none exists.
    public let message:String?
    ///The call stack at the time the exception was thrown.
    public let stackTrace:[String]
    public var description:String { return self.descriptionComponents().joined(separator: " | ")}

    ///Initializes an Exception instance.
    /// - parameter error: The error causing the exception.
    /// - parameter message: A human-readable message explaining the error.
    /// - parameter stackTrace: The stack trace at the time the exception was thrown.
    ///Defaults to `Thread.callStackSymbols`.
    public init(error:Error, message:String?, stackTrace:[String]? = nil) {
        self.error = error
        self.message = message
        self.stackTrace = stackTrace ?? Thread.callStackSymbols
    }

    ///The components of the description of this exception. Subclasses
    ///should override this method to return custom information in the
    ///description. Subclasses should prepend the superclass' implementation
    ///to their return value.
    open func descriptionComponents() -> [String] {
        return [
            "\(String(describing: type(of: self)))(\(self.error))",
            self.message
        ].compactMap() { $0 }
    }

}
