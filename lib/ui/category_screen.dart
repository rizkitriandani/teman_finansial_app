import 'package:flutter/material.dart';
import 'package:teman_finansial_app/helpers/color_helper.dart';
import 'package:teman_finansial_app/models/category_model.dart';
import 'package:get/get.dart';
import 'package:teman_finansial_app/models/expense_model.dart';
import 'package:teman_finansial_app/ui/widgets/radial_painter.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  CategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    double totalAmountSpent = 0;
    category.expenses.forEach((Expense expense) {
      totalAmountSpent += expense.cost;
    });

    final double amountLeft = category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / category.maxAmount;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.name),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            iconSize: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 6,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                  bgColor: Colors.grey,
                  lineColor: getColor(context,percent),
                  percent: percent,
                  width: 15,
                ),
                child: Center(
                  child: Text(
                    amountLeft.toStringAsFixed(2) +
                        "/" +
                        category.maxAmount.toStringAsFixed(2),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
