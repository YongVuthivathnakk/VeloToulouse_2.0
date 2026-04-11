enum AsyncValueState { loading, success, error }

class AsyncValue<T> {
  final T? data;
  final Object? error;
  final AsyncValueState state;

  AsyncValue({this.data, this.error, required this.state});

  factory AsyncValue.loading() => AsyncValue(state: AsyncValueState.loading);

  factory AsyncValue.success(T data) =>
      AsyncValue(state: AsyncValueState.success, data: data);

  factory AsyncValue.error(Object error) =>
      AsyncValue(state: AsyncValueState.error, error: error);
}
