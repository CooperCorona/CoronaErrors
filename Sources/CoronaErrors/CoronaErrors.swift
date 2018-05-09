///A central definition of common types of errors.
public enum CoronaError<T>: Error {
    ///An argument to a method does not have a valid value.
    case invalidArgument(T)
    ///An optional is nil when it should not be.
    case `nil`
}

///Unwraps the given optional, and throws an exception
///if the optional is nil.
public func unwrap<T>(_ optional:T?) throws -> T {
    guard let value = optional else {
        throw CoronaError<T>.nil
    }
    return value
}
