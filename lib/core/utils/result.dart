sealed class Result<T> {}

class Success<T> extends Result<T> {
  T? data;
  Success(
    this.data,
  );
}

class Err<T> extends Result<T> {
  final Exception ex;

  Err({required this.ex});
}
