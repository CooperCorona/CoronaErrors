//
//  ParseError.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 1/3/19.
//

import Foundation

///Errors occurring when parsing something (for example, parsing a string into an int).
public enum ParseError: Error {
    ///The object being parsed does not have the correct format.
    case incorrectFormat
    ///The object does not contain enough logical components to be parsed.
    case notEnoughComponents
    ///The object contaisn too many logical components to be parsed.
    case tooManyComponents
}
