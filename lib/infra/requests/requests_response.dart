class ApiResponse<T> {
  Status status;
  T? data;
  String message;

  ApiResponse.loading(this.message) : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED, message = '';

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status\nMessage: $message\nData: $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
