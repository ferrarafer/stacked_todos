class FormValidators {
  static String? title(String? value) {
    if (value == null || value.isEmpty) {
      return 'Title is required';
    }

    if (value.length < 3) {
      return 'Please enter a title that\'s 3 characters or longer';
    }

    return null;
  }

  static String? description(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (value.length < 6) {
      return 'Please enter a description that\'s 6 characters or longer';
    }

    return null;
  }
}
