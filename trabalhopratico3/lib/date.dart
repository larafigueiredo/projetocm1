class Date{
  int day;
  int month;
  int year;

  Date({required this.day, required this.month, required this.year});

  int age() {
    int age = 0;
    if (DateTime.now().month > month || (DateTime.now().month == month && DateTime.now().day > day)) {
      age = DateTime.now().year - year - 1;
    } else {
      age = DateTime.now().year - year;
    }
    return age;
  }

  @override
  String toString() {
    return '$day/$month/$year';
  }
  
}