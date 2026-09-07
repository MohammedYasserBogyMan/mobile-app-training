class TaskDemo {
  const TaskDemo({
    required this.title,
    required this.date,
    required this.priority,
  });

  final String title;
  final String date;
  final String priority;
}

const List<TaskDemo> demoTasks = [
  TaskDemo(
    title: 'Flutter Assignment',
    date: 'Today - 8:00 PM',
    priority: 'High',
  ),
  TaskDemo(
    title: 'Database Project',
    date: 'Tomorrow - 10:00 AM',
    priority: 'Medium',
  ),
  TaskDemo(
    title: 'UI Design Practice',
    date: 'Friday - 9:00 AM',
    priority: 'Low',
  ),
];
