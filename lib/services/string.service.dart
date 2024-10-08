import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StringsService {
  StringsService();

  // Validate email format using RegExp
  bool validateEmail(String email) {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(email);
  }

  // Get only digits from a phone number
  String getOnlyDigits(String phoneNumber) {
    return phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
  }

  // Check if phone number is valid
  bool isPhoneNumberValid(String phoneNumber) {
    String validPhoneNumber = getOnlyDigits(phoneNumber);
    return validPhoneNumber.length >= 10;
  }

  // Capitalize the first letter of each word in a string
  String capitalizeEachFirst(String str) {
    if (str.isEmpty) return '';
    List<String> words = str.toLowerCase().split(' ');
    return words.map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
  }

  // Capitalize all letters in a string
  String capitalizeAllLetters(String str) {
    if (str.isEmpty) return '';
    List<String> words = str.toLowerCase().split(' ');
    return words.map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
  }

  // Function to check if passwords match in a FormGroup
  FormFieldValidator<String> checkIfMatchingPasswords(String passwordKey, String passwordConfirmationKey) {
    return (value) {
      // You need to access the form fields from the FormState in Flutter
      // Assuming that `passwordKey` and `passwordConfirmationKey` are passed dynamically
      return (value != null && value == passwordKey) ? null : 'Passwords do not match';
    };
  }

  // Parse address from user profile fields
  String parseAddressFromProfile({
    String? apartment,
    String? streetAddress,
    String? city,
    String? state,
    String? zipCode,
  }) {
    return '${apartment ?? ''} ${streetAddress ?? ''} ${city ?? ''} ${state ?? ''} ${zipCode ?? ''}'.trim();
  }

  // Parse full name into first, middle, and last names
  Map<String, String> parseName(String input, {bool returnObject = false}) {
    String capitalize(String s) => s.isEmpty ? '' : s[0].toUpperCase() + s.substring(1).toLowerCase();

    Map<String, String> result = {
      'firstName': '',
      'middleName': '',
      'lastName': '',
    };

    List<String> nameTokens = input.split(' ').where((name) => name.isNotEmpty).toList();

    if (nameTokens.isNotEmpty) {
      result['firstName'] = capitalize(nameTokens[0]);
      if (nameTokens.length > 2) {
        result['middleName'] = capitalize(nameTokens[1]);
        result['lastName'] = capitalize(nameTokens.last);
      } else if (nameTokens.length == 2) {
        result['lastName'] = capitalize(nameTokens[1]);
      }
    }

    if (returnObject) {
      return result;
    }

    return {
      'fullName': '${result['lastName']} ${result['firstName']}',
    };
  }

  // Check if last name exists
  bool isLastNameExist(String input) {
    Map<String, String> parsedName = parseName(input, returnObject: true);
    return parsedName['lastName']?.isNotEmpty ?? false;
  }

  // Helper function to calculate number of digits in a number
  int numDigits(int x) {
    if (x == 0) return 1;
    return (x.toString().length);
  }
}
