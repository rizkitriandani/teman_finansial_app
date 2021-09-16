import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
                    margin: EdgeInsets.all(10),
                    height: 100,
                    color: Colors.white);
              }),
            ),
            //!LIST
          ],
        ),
      );
    });
  }
}
