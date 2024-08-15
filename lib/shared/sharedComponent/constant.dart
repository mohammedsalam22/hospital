enum RequestState {
  initial,
  loading,
  success,
  error;

  bool get isError => this == RequestState.error;

  bool get isInitial => this == RequestState.initial;

  bool get isLoading => this == RequestState.loading;

  bool get isSuccess => this == RequestState.success;
}
