import 'package:flutter/material.dart';
import 'package:teman_finansial_app/models/category_model.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  CategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
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
            ),
          ],
        ),
      ),
    );
  }
}
