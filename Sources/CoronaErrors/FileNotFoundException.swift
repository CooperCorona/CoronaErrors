//
//  FileNotFoundException.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 1/3/19.
//

import Foundation

///An exception thrown when a file or directory on the file system
///cannot be found.
open class FileNotFoundException: IOException {

    ///The path of the file attempted to be accessed.
    public let filePath:String

    ///Initializes a FileNotFoundException instance.
    /// - parameter filePath: The file path attempting to be accessed.
    /// - parameter message: A human-readable message explaining the error. Defaults to
    ///"No file could be found at the given path.".
    /// - parameter stackTrace: The stack trace at the time the exception was thrown.
    ///Defaults to `Thread.callStackSymbols`.
    public init(filePath:String, message:String? = nil, stackTrace:[String]? = nil) {
        self.filePath = filePath
        let message = message ?? "No file could be found at the given path."
        super.init(error: IOError.fileNotFound, message: message, stackTrace: stackTrace)
    }

    open override func descriptionComponents() -> [String] {
        return super.descriptionComponents() + ["File Path: '\(self.filePath)'"]
    }

}
