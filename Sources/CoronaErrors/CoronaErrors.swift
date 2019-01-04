///Unwraps the given optional, and throws an exception
///if the optional is nil.
public func unwrap<T>(_ optional:T?) throws -> T {
    guard let value = optional else {
        throw NilException<T>()
    }
    return value
}

///Compares two error objects. Allows the comparison of different Error enums
///or an Error protocol and a specific Error enum.
///
///This is useful when catching exceptions of a specific Exception subclass *and*
///a specific underlying Error.
///
///```
///catch let error as Exception where error.error == ValueError.invalidArgument
///```
/// - parameter lhs: An error to compare with.
/// - parameter rhs: An error to compare to. Must be equatable.
/// - returns: `true` if the errors are equal, `false` otherwise.
public func ==<T>(lhs:Error, rhs:T) -> Bool where T: Error & Equatable {
    guard let lhs = lhs as? T else {
        return false
    }
    return lhs == rhs
}
