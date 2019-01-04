//
//  IOError.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 1/3/19.
//

import Foundation

///Errors caused by program input or output.
public enum IOError: Error {
    ///A file or directory at a given path cannot be found.
    case fileNotFound
    ///The program does not have permissions to access the given resource.
    case permissionDenied
}
