String userEmail = "";
//String userPhonenumber = "";

extension MonthNameExtension on int {
  /// Converts a month number to its corresponding name.
  String toMonthName() {
    switch (this) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return 'Invalid month';
    }
  }
}


extension RemoveFirstZero on String {
  String removeFirstZero() {
    if (this.isNotEmpty && this[0] == '0') {
      return this.substring(1);
    } else {
      return this;
    }
  }
}
