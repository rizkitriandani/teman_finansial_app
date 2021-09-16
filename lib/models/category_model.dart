import 'package:teman_finansial_app/models/expense_model.dart';

class Category {
  final String? name;
  final double? maxAmount;
  final List<Expense> expenses;

  Category({this.name, this.maxAmount, required this.expenses});
}
