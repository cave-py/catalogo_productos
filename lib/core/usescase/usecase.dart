import 'package:equatable/equatable.dart';
import 'package:graphql/client.dart';


abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}