import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            floating: true,
            forceElevated: true,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
              iconSize: 30,
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Teman Finansial"),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add), iconSize: 30)
            ],
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 100,
                color:Colors.red
              );
            }),
          )
        ],
      ),
    );
  }
}
