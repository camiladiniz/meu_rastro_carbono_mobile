class AppException implements Exception {
  final _message;
  final _prefix;
  
AppException([this._message, this._prefix]);
  
String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Erro ao conectar com o servidor: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Sessão expirada, por favor faça login novamente.");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Campo inválido: ");
}