// import 'dart:async';
// import 'dart:developer';

// import 'package:beam_tv_1/main.dart';
// import 'package:beam_tv_1/repo/login_repo.dart';
// import 'package:beam_tv_1/resources/local_data.dart';
// import 'package:beam_tv_1/resources/utils.dart';
// import 'package:beam_tv_1/view/nav_bar.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class LoginViewModel with ChangeNotifier {
//   final loginRepo = LoginRepo();
//   bool _loading = false;
//   bool get loading => _loading;

//   setLoading(bool value) {
//     _loading = value;
//     print(_loading);
//     notifyListeners();
//   }

//   Future<void> fetchLoginReponse(BuildContext context, dynamic data) async {
//     setLoading(true);

//     loginRepo.fetchLoginReponse(data).then((value) async {
//       print(value);
//       setLoading(false);
//       LocalData ld = LocalData();
//       await ld.saveTokenLocally(
//           value.data!.id.toString(),
//           value.data!.token.toString(),
//           value.data!.fullName.toString(),
//           value.data!.addressRelation!.address.toString(),
//           value.data!.addressRelation!.id.toString(),
//           value.data!.tenantCnic.toString() == ""
//               ? value.data!.ownerCnic.toString()
//               : value.data!.tenantCnic.toString(),
//           value.data!.contact.toString(),
//           value.data!.addressRelation!.societyDetail!.first.projectTitle
//               .toString(),
//           value.data!.addressRelation!.societyDetail!.first.id.toString(),
//           value.data!.userProfileBase64 ?? "",
//           value.data!.qrCode ?? "null",
//           false);
//       //  final userPreference = Provider.of<UserViewModel>(context, listen: false);
//       // userPreference.saveUser(UserModel(token: value['token'].toString()));
// // saveLoginDataToSharedPreferences(value);
//       await ld.getTokenLocally();
//       log(LocalData.logout.toString(), name: "logout");
//       Utils.snackBar('Login Successfully', context);
//       Timer(const Duration(seconds: 2), () {
//         Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => NavBarScreen()),
//             (route) => false);
//         // navigate(context, NavBarScreen());
//       });
//       // await ld.getTokenLocally();
//       print("${LocalData.name} local name");
// // print("${uu} localll");
//       // var yy = LocalData().getDataLocally();
//       // print("${yy.id} local");
//       // LoginDataModel? storedLoginData = await getLoginDataFromSharedPreferences();
// // if (storedLoginData != null) {
// //   print(storedLoginData.data?.address.toString());
// //   // Use the storedLoginData as needed
// // } else {
// //   print("else");
// //   // No data was found in shared preferences
// // }
//       if (kDebugMode) {
//         print(value.toString());
//       }
//     }).onError((error, stackTrace) {
//       setLoading(false);
//       Utils.snackBar(error.toString(), context);
//       if (kDebugMode) {
//         print(error.toString());
//       }
//     });
//   }
//   // set loading(bool value){
//   //   _loading = value;

//   // }
// }

// // Future<void> fetchLoginReponse() async {
// //   setTankerList(ApiResponse.loading());
// //   _tankerRepo.fetchTankerList().then((value) {
// //     print(value);
// //     setTankerList(ApiResponse.completed(value));
// //   }).onError((error, stackTrace) {
// //     setTankerList(ApiResponse.error(error.toString()));
// //   });
// // }

// // }

// // class Person {
// //   late String name; // Public member variable

// // late  int _age; // Private member variable

// //  late String _address; // Private member variable

// //   String get address => _address; // Getter for the private member variable _address

// //   set address(String value) {
// //     _address = value; // Setter for the private member variable _address
// //   }

// //   void displayInfo() {
// //     print("Name: $name, Age: $_age, Address: $_address");
// //   }

// //   void _privateMethod() {
// //     print("This is a private method.");
// //   }
// // }

// // class Employee extends Person {
// // late  String employeeId; // Public member variable

// //   void displayEmployeeInfo() {
// //     print("Employee ID: $employeeId");
// //   }
// // }

// // void main() {
// //   var person = Person();
// //   person.name = "John"; // Accessing the public member variable name
// //   person._age = 25; // Accessing the private member variable _age directly within the class
// //   person.address = "123 Main St"; // Accessing the private member variable _address through the setter
// //   person.displayInfo(); // Accessing the information through the displayInfo method

// //   print(person.name); // Accessing the public member variable name
// //   print(person.address); // Accessing the private member variable _address through the getter

// //   // Uncommenting the code below will result in an error due to accessing a private member variable outside the class
// //   // print(person._age);

// //   var employee = Employee();
// //   employee.name = "Jane"; // Accessing the public member variable name inherited from Person class
// //   employee.employeeId = "1234"; // Accessing the public member variable employeeId in the Employee class
// //   employee.address = "456 Broad St"; // Accessing the private member variable _address inherited from Person class through the setter
// //   employee.displayInfo(); // Accessing the displayInfo method inherited from Person class
// //   employee.displayEmployeeInfo(); // Accessing the displayEmployeeInfo method in the Employee class
// // }
