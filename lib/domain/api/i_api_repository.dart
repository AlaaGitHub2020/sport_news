import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sport_news/domain/api/api_failure.dart';

abstract class IAPIRepository {
  Future<Either<APIFailure, Response>> getData(String endpoint,
      {Options? options});
}
