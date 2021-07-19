import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

/// Abstract class of failure
abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class NoInternetFailure extends Failure {}

class RequestFailure extends Failure {
  /// code from server
  final Object code;

  /// message from server
  final Object message;

  /// data from server
  final Object data;

  RequestFailure({required this.code, required this.message, required this.data});

  @override
  List<Object> get props => [code, message, data];
}

class CacheFailure extends Failure {}
