import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    print('DioException type: ${e.type}');
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with api server');
      case DioExceptionType.badResponse:
        if (e.response != null) {
          return ServerFailure.fromResponse(
              e.response!.statusCode!, e.response!.data);
        } else {
          return ServerFailure('Received invalid status code: ${e.message}');
        }
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure('Oops, there was an error. Please try again');
      default:
        return ServerFailure('Unexpected error occurred');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    print('Response status code: $statusCode');
    print('Response data: $response');
    if (statusCode == 404) {
      return ServerFailure('Your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure(
          'There is a problem with the server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (response is Map<String, dynamic> && response.containsKey('error')) {
        return ServerFailure(response['error']['message']);
      } else {
        return ServerFailure('Invalid request data');
      }
    } else {
      return ServerFailure('There was an error, please try again');
    }
  }
}
