# CoronaErrors
Collection of convenience types, methods, and an exception hierarchy to make error handling easier.

See [https://coopercorona.github.io/CoronaErrors/](https://coopercorona.github.io/CoronaErrors/) for API documentation.

## Errors
All `Error` types are enums conforming to the `Error` protocol. Each type logically groups together similar types of errors. All `Error` types have a corresponding `Exception` type.

### IOError
Occurs when an input/output operation cannot be completed.
* `fileNotFound`: A file or directory does not exist at a given path.
* `permissionDenied`: The program does not have permission to access the file or directory at a given path.

### OperationError
Occurs when an operation cannot be completed.
* `alreadyExists`: The target of an operation already exists.
* `missing`: The target of an operation does not exist.

### ParseError
Occurs when parsing some object into a different kind of object.
* `incorrectFormat`: The format of the original object is incorrect and cannot be converted to the new object.
* `notEnoughComponents`: The format of the original object requires a specific number of logical components to convert, but not enough components were provided.
* `tooManyComponents`: The format of the original object requires a specific number of logical components to convert, too many  components were provided.

### ValueError
Occurs when the value of a variable is incorrect in some way.
* `invalidArgument`: An argument to a function has an incorrect value.
* `nil`: A value is `nil` when a value should exist.
* `invalidState`: A variable has an incorrect value. Similar to `invalidArgument` except it doesn't assume the variable in question is a function's argument.

## Exceptions
Exceptions encapsulate an `Error` and additional metadata, including a explanatory message and stack trace. `Exception` conforms to `Error`, so it can be thrown and caught like any other `Error`. Subclasses are used to provide additional contextual information and allow more specific catch statements.

Exceptions can be caught as follows:
```
func throwException() { throw Exception(error: ValueError.nil, message: "nil")
do {
  try throwException()
} catch let error as Exception {
  // Do something with the error...
}
```

Specific underlying errors can be caught using a `where` clause:

```
func throwException() { throw Exception(error: ValueError.nil, message: "nil")
do {
  try throwException()
} catch let error as Exception where error.error == ValueError.nil {
  // Do something with the error...
}
```

Subclasses of `Exception` can override `descriptionComponents` to include additional information in the string representation of the Exception. Subclasses must call the super implementation and prepend it to their custom components.

### IOException
An exception caused by an `IOError`.

#### FileNotFoundException
An `IOException` caused by an `IOError.fileNotFound` error.

### NilException
An exception caused by a `ValueError.nil` error. Parameterized based on the type of variable that is `nil`. To catch any type of `NilException` irrespective of type, catch `AnyNilException`. This is required because `NilException<T>` cannot be cast to `NilException<U>`, regardless of whether `T` can be cast to `U`, so trying to catch `NilException<Any>` will fail.

### OperationError
An exception caused by an `OperationError`.

### ParseException
An exception caused by a `ParseError`.

### ValueError
An exception caused by a `ValueError`. Exposes the value whose incorrectness caused the exception. `ValueError<T>.expected` constructs a `ValueError` instance by passing in an expected value along with an actual value, automatically setting the `message` property to explain what value was expected.
