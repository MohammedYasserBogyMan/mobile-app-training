class Task {
  const Task({
    required this.title,
    required this.description,
    required this.date,
    required this.priority,
    required this.status,
    this.isCompleted = false,
  });

  final String title;
  final String description;
  final String date;
  final String priority;
  final String status;
  final bool isCompleted;
}

const List<Task> tasks = [
  Task(
    title: 'واجب فلاتر',
    description:
        'ابن أول شاشة في TaskFlow باستخدام Widgets قابلة لإعادة الاستخدام وتنسيق واضح.',
    date: 'اليوم - ٨:٠٠ م',
    priority: 'عالية',
    status: 'نشطة',
  ),
  Task(
    title: 'مشروع قواعد البيانات',
    description: 'صمم جداول المهام والتصنيفات الخاصة بها.',
    date: 'غدا - ١٠:٠٠ ص',
    priority: 'متوسطة',
    status: 'نشطة',
  ),
  Task(
    title: 'تدريب تصميم الواجهة',
    description: 'أعد رسم بطاقة المهمة في فيجما وقارنها بالكود.',
    date: 'الجمعة - ٩:٠٠ ص',
    priority: 'منخفضة',
    status: 'نشطة',
  ),
  Task(
    title: 'قراءة عن API',
    description: 'اقرأ عن طلبات REST قبل الجلسة الرابعة.',
    date: 'السبت - ١:٠٠ م',
    priority: 'متوسطة',
    status: 'نشطة',
  ),
  Task(
    title: 'تدريب إدارة الحالة',
    description:
        'جهز أسئلتك عن جعل التطبيق يتفاعل مع المستخدم في الجلسة القادمة.',
    date: 'الأحد - ٥:٠٠ م',
    priority: 'عالية',
    status: 'نشطة',
  ),
  Task(
    title: 'مراجعة الوايرفريم',
    description: 'راجع الوايرفريم الخاص بشاشة إضافة مهمة.',
    date: 'الاثنين - ١١:٠٠ ص',
    priority: 'منخفضة',
    status: 'مكتملة',
    isCompleted: true,
  ),
];
