///Unwraps the given optional, and throws an exception
///if the optional is nil.
public func unwrap<T>(_ optional:T?) throws -> T {
    guard let value = optional else {
        throw ValueException<T>.nil()
    }
    return value
}
