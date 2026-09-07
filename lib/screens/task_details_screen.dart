import 'package:flutter/material.dart';
import 'package:task_flow/models/task.dart';
import 'package:task_flow/widgets/task_actions.dart';
import 'package:task_flow/widgets/task_details_header.dart';
import 'package:task_flow/widgets/task_info_card.dart';
import 'package:task_flow/widgets/task_summary.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          children: [
            const TaskDetailsHeader(),
            const SizedBox(height: 18),
            TaskSummary(task: task),
            const SizedBox(height: 20),
            TaskInfoCard(task: task),
            const SizedBox(height: 22),
            const TaskActions(),
          ],
        ),
      ),
    );
  }
}
