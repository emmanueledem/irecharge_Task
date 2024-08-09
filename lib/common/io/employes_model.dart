class Employees {
  int id;
  String firstName;
  String lastName;
  String designation;
  int level;
  double productivityScore;
  String currentSalary;
  int employmentStatus;

  Employees({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.designation,
    required this.level,
    required this.productivityScore,
    required this.currentSalary,
    required this.employmentStatus,
  });

  factory Employees.fromJson(Map<String, dynamic> json) => Employees(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        designation: json["designation"],
        level: json["level"],
        productivityScore: json["productivity_score"],
        currentSalary: json["current_salary"],
        employmentStatus: json["employment_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "designation": designation,
        "level": level,
        "productivity_score": productivityScore,
        "current_salary": currentSalary,
        "employment_status": employmentStatus,
      };
}
