import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;

  BarChart({required this.expenses});

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if(price > mostExpensive){
        mostExpensive = price;
      }
    });

    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            'Weekly Spending',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30,
                ),
              ),
              Text(
                'Sep 12, 2021 - Sep 18, 2021',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward),
                  iconSize: 30,
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                label: 'Su',
                amountSpent: expenses[0],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Mo',
                amountSpent: expenses[1],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Tu',
                amountSpent: expenses[2],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'We',
                amountSpent: expenses[3],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Th',
                amountSpent: expenses[4],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Fr',
                amountSpent: expenses[5],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Sa',
                amountSpent: expenses[6],
                mostExpensive: mostExpensive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150;

  Bar(
      {required this.label,
      required this.amountSpent,
      required this.mostExpensive});

  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;

    return Column(
      children: [
        Text(
          '${amountSpent.toStringAsFixed(2)}',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 6),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
