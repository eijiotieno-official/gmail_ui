import 'dart:math';

String generateSubject() {
  List<String> subjectPatterns = [
    'Important Meeting',
    'Project Update',
    'Daily Report',
    'Team Discussion',
    'Client Presentation',
    'Task Deadline',
    'Feedback Session',
    'Training Session',
    'Status Review',
    'Release Announcement',
    'Bug Fix',
    'Feature Implementation',
    'Product Demo',
    'Market Analysis',
    'Financial Report',
    'Strategic Planning',
    'Customer Feedback',
    'Security Update',
    'Holiday Celebration',
  ];

  Random random = Random();

  int index = random.nextInt(subjectPatterns.length);

  return subjectPatterns[index];
}
