import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:teman_finansial_app/data/data.dart';
import 'package:teman_finansial_app/ui/widgets/barchart.dart';

class HomeScreen extends StatelessWidget {
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
                onPressed: () {},
                icon: Icon(Icons.settings),
                iconSize: 7.w,
              ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Teman Finansial"),
              ),
              actions: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.add), iconSize: 7.w)
              ],
            ),
            //! APP BAR

            //!LIST
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0,2),
                          blurRadius: 6,
                        )  
                      ],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: BarChart(expenses:weeklySpending),
                    );
              },
              childCount: 1,
              ),
              
            ),
            //!LIST
          ],
        ),
      );
    });
  }
}
