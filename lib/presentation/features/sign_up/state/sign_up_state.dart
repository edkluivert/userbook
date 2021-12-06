import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpLoading extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String error;

  SignUpFailure({required this.error});

  @override
  List<Object> get props => [error];
}