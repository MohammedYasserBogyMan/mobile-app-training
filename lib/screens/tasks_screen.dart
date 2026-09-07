import 'package:flutter/material.dart';
import 'package:task_flow/models/task.dart';
import 'package:task_flow/screens/task_details_screen.dart';
import 'package:task_flow/widgets/custom_filter_chip.dart';
import 'package:task_flow/widgets/task_card.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TaskFlow',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2474D6),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'مهامك',
                style: TextStyle(
                  fontSize: 26,
                  height: 1.2,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF172435),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  CustomFilterChip(label: 'الكل', isSelected: true),
                  SizedBox(width: 8),
                  CustomFilterChip(label: 'النشطه', isSelected: false),
                  SizedBox(width: 8),
                  CustomFilterChip(label: 'المكتمله', isSelected: false),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 16),

                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final Task task = tasks[index];

                    return TaskCard(
                      task: task,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskDetailsScreen(task: task),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
