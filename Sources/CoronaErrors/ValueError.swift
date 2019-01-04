//
//  ValueError.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 12/30/18.
//

import Foundation

///Errors caused by values of variables.
public enum ValueError: Error {
    ///An argument to a method does not have a valid value.
    case invalidArgument
    ///An optional is nil when it should not be.
    case `nil`
    ///A variable (not necessarily an argument to a method)
    ///has an invalid value.
    case invalidState
}
