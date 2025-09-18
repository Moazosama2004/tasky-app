import 'dart:math';

import 'package:flutter/material.dart';

class ArchievedTasks extends StatelessWidget {
  const ArchievedTasks({
    super.key,
    required this.doneTasks,
    required this.totalTasks,
    required this.percentage,
  });

  final int doneTasks;
  final int totalTasks;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(16),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Achieved Tasks',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '$doneTasks Out of $totalTasks Done',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                '${(percentage * 100).toInt()}%',
                style: TextStyle(
                  color: Color(0xffFFFCFC),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Transform.rotate(
                angle: -pi / 2,
                child: SizedBox(
                  height: 48,
                  width: 48,
                  child: CircularProgressIndicator(
                    value: percentage,
                    strokeWidth: 4,
                    strokeCap: StrokeCap.round,
                    // strokeAlign: 4,
                    backgroundColor: Color(0xff6d6d6d),
                    semanticsValue: '2',
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xff15B86C),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
