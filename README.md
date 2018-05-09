# CoronaErrors

Collectiin of convenience types and methods for error handling.

## Types
### CoronaError
Contains commonly defined errors.
* `invalidArgument(T)`: An argument given to a function (or any variable) is invalid. The given value which is invalid is the associated argument.
* `nil`: An optional is `nil` when it should not be.

## Functions
### unwrap(_:)
Unwraps a given optional, throwing an exception if the optional is nil.
