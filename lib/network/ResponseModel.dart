class Responsemodel<T> {
  late Status status;
  late T data;
  late String message;

  Responsemodel.loading(this.message) : status = Status.LOADING;
  Responsemodel.completed(this.data) : status = Status.COMPLETED;
  Responsemodel.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
