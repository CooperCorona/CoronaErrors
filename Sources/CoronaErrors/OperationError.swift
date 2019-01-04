//
//  OperationError.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 12/30/18.
//

import Foundation

///Errors caused by failing operations.
public enum OperationError: Error {
    ///An operation to create something was performed when
    ///that something already existed.
    case alreadyExists
    ///An operation to remove something was performed when
    ///that something didn't exist. Similar to nil.
    case missing
}
