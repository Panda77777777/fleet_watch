enum UserRole { seafarer, crewing }

class SeafarerDocument {
  final String id;
  final String title;
  final String expiryDate;
  final bool isExpired;

  const SeafarerDocument({
    required this.id,
    required this.title,
    required this.expiryDate,
    this.isExpired = false,
  });
}

class UserProfile {
  final String id;
  final String email;
  final UserRole role;
  final String name;
  final String? rank;
  final String? companyName;
  final double rating;
  final List<SeafarerDocument> documents;

  const UserProfile({
    required this.id,
    required this.email,
    required this.role,
    required this.name,
    this.rank,
    this.companyName,
    this.rating = 0.0,
    this.documents = const [],
  });
}

class Vacancy {
  final String id;
  final String title;
  final String companyName;
  final String rank;
  final String salary;
  final String vesselType;
  final String contractDuration;

  const Vacancy({
    required this.id,
    required this.title,
    required this.companyName,
    required this.rank,
    required this.salary,
    required this.vesselType,
    required this.contractDuration,
  });
}

class JobApplication {
  final String id;
  final String vacancyTitle;
  final String companyName;
  final String seafarerName;
  final String status; // 'Applied', 'Under Review', 'Accepted'

  const JobApplication({
    required this.id,
    required this.vacancyTitle,
    required this.companyName,
    required this.seafarerName,
    required this.status,
  });
}

class Review {
  final String id;
  final String companyName;
  final String seafarerName;
  final double rating;
  final String comment;

  const Review({
    required this.id,
    required this.companyName,
    required this.seafarerName,
    required this.rating,
    required this.comment,
  });
}
