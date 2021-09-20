import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teman_finansial_app/data/data.dart';
import 'package:teman_finansial_app/helpers/color_helper.dart';
import 'package:teman_finansial_app/models/category_model.dart';
import 'package:teman_finansial_app/models/expense_model.dart';
import 'package:teman_finansial_app/ui/category_screen.dart';
import 'package:teman_finansial_app/ui/widgets/barchart.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  _buildCategory(
      Category category, double totalAmountSpent, BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (_) => CategoryScreen(category: category))),
      onTap: () => Get.to(
        CategoryScreen(
          category: category,
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(20),
        height: 100,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(category.name,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Text(
                    (category.maxAmount - totalAmountSpent).toStringAsFixed(2) +
                        "/" +
                        (category.maxAmount).toStringAsFixed(2),
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              final double maxBarWidth = constraints.maxWidth;
              final double percent =
                  (category.maxAmount - totalAmountSpent) / category.maxAmount;
              double barWidth = percent * maxBarWidth;

              if (barWidth < 0) {
                barWidth = 0;
              }

              return Stack(
                children: [
                  Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      )),
                  Container(
                      height: 20,
                      width: barWidth,
                      decoration: BoxDecoration(
                        color: getColor(context, percent),
                        borderRadius: BorderRadius.circular(15),
                      )),
                ],
              );
            })
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            //! APP BAR
            SliverAppBar(
              expandedHeight: 10.h,
              floating: true,
              forceElevated: true,
              leading: IconButton(
                onPressed: () {
                  Get.snackbar("Setting", "Coming Soon");
                },
                icon: Icon(Icons.settings),
                iconSize: 7.w,
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Teman Finansial"),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Get.snackbar("Add Spending", "Coming Soon");
                    },
                    icon: Icon(Icons.add),
                    iconSize: 7.w)
              ],
            ),
            //! APP BAR

            //!LIST
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index == 0) {
                    return Container(
                      margin: EdgeInsets.all(20),
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
                      child: BarChart(expenses: weeklySpending),
                    );
                  } else {
                    final Category category = categories[index - 1];
                    double totalAmountSpent = 0;
                    category.expenses.forEach((Expense expense) {
                      totalAmountSpent += expense.cost;
                    });
                    return _buildCategory(category, totalAmountSpent, context);
                  }
                },
                childCount: 1 + categories.length,
              ),
            ),
            //!LIST
          ],
        ),
      );
    });
  }
}
