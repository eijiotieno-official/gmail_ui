String generateSubject(int numberOfSubjects) {
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
    // Add more patterns as needed
  ];

  List<String> generatedSubjects = [];

  if (numberOfSubjects <= 0) {
    throw ArgumentError("Number of subjects should be greater than 0");
  }

  for (int i = 0; i < numberOfSubjects; i++) {
    String pattern = subjectPatterns[i % subjectPatterns.length];
    generatedSubjects.add('$pattern ${i + 1}');
  }

  return generatedSubjects.join(', ');
}

