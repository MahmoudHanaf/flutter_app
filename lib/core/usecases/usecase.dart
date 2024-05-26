
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

abstract class UseCase <Type , Prams>{
  Future<Either<Failure , Type>>call(Prams prams) ;
}
class NoParams  extends Equatable{
  @override
  List<Object?> get props => [];

}
class Param extends Equatable {
  List<dynamic> params;

  Param({
    required this.params,
  });

  @override
  List<Object?> get props => [params];

}
