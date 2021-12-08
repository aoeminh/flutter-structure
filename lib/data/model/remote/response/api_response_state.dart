enum ViewState { idle, busy, error }

class ApiResponseState<T> {
  ViewState? status;
  T? data;
  String? message;

  ApiResponseState.loading(this.message) : status = ViewState.busy;
  ApiResponseState.completed(this.data) : status = ViewState.idle;
  ApiResponseState.error(this.message) : status = ViewState.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
