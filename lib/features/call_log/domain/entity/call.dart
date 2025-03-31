import 'package:equatable/equatable.dart';

class CallEntity extends Equatable {
  const CallEntity({
    required this.name,
    required this.number,
    required this.date,
    required this.type,
  });

  final String? name;
  final String number;
  final DateTime date;
  final CallType type;

  @override
  List<Object?> get props => [name, number, date, type];
}

enum CallType { income, outcome, missed, rejected, blocked }
