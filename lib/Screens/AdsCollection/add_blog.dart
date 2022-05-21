import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Card_Swipping_Widgets/cards_stack_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController =
      new TextEditingController();
  final TextEditingController _lastNameController = new TextEditingController();
  final TextEditingController _phoneNoController = new TextEditingController();

  String? firstName;
  String? lastName;
  String? phoneNo;

  bool isAuthenticating = false;
  bool isEnabled = false;

  Future<void> _updateDetails() async {
    setState(() {
      isAuthenticating = true;
    });
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await Provider.of<UserProvider>(context, listen: false)
          .updateUser(firstName, lastName!, phoneNo!)
          .then(
            (value) => setState(() {
              isAuthenticating = false;
            }),
          );
    }
  }

  void _edit() {
    setState(() {
      isEnabled = true;
    });
  }

  @override
  void initState() {
    final provider = Provider.of<UserProvider>(context, listen: false);
    final user = provider.user;
    _firstNameController.text = user.firstName!;
    _lastNameController.text = user.lastName!;
    _phoneNoController.text = user.phoneNo!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      hintText: "Enter First Name",
                      labelText: "First Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.length < 3) {
                        return "First Name is short";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      firstName = newValue;
                    },
                    enabled: isEnabled,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      hintText: "Enter Last Name",
                      labelText: "Last Name",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.length < 3) {
                        return "Last Name is short";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      lastName = newValue;
                    },
                    enabled: isEnabled,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _phoneNoController,
                    decoration: InputDecoration(
                      hintText: "Enter Phone No",
                      labelText: "Phone No",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.length != 10) {
                        return "Phone no is not valid";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      phoneNo = newValue;
                    },
                    enabled: isEnabled,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  isAuthenticating
                      ? CircularProgressIndicator()
                      : Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  isEnabled ? _updateDetails() : _edit();
                                },
                                child: Text(isEnabled ? 'UPDATE' : 'Edit'),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UserProvider with ChangeNotifier {
  late UserData _user;

  UserData get user => _user;

  Future<void> fetchAndSetUser() async {
    UserData user;
    await userRef.doc(currentUser!.uid).get().then((documentSnapshot) {
      user = UserData.fromMap(documentSnapshot.data()!);
    });
    // _user = user;
    notifyListeners();
  }

  Future<void> updateUser(
      String? firstName, String lastName, String phoneNo) async {
    UserData userUpdate = UserData(
      firstName: firstName,
      lastName: lastName,
      email: user.email,
      password: user.password,
      phoneNo: phoneNo,
    );
    await userRef.doc(currentUser!.uid).set(userUpdate.toMap());
    _user = userUpdate;
    notifyListeners();
  }
}

class UserData {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phoneNo;
  UserData({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.password,
    @required this.phoneNo,
  });

  UserData copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? phoneNo,
  }) {
    return UserData(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNo: phoneNo ?? this.phoneNo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'UserLocation': firstName,
      'UserEmail': lastName,
      'UserName': email,
      'UserNumber': password,
      'UserLocation': phoneNo,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      firstName: map['UserLocation'],
      lastName: map['UserEmail'],
      email: map['UserName'],
      password: map['UserNumber'],
      phoneNo: map['UserLocation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserData(firstName: $firstName, lastName: $lastName, email: $email, password: $password, phoneNo: $phoneNo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserData &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.password == password &&
        other.phoneNo == phoneNo;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phoneNo.hashCode;
  }
}

final currentUser = FirebaseAuth.instance.currentUser;
final userRef = FirebaseFirestore.instance.collection('UserRegistration');
final productRef = FirebaseFirestore.instance.collection('UserRegistration');
final brandRef = FirebaseFirestore.instance.collection('UserRegistration');
final favoritesProductRef = FirebaseFirestore.instance
    .collection('UserRegistration')
    .doc(currentUser!.uid);
final cartRef = FirebaseFirestore.instance
    .collection('UserRegistration')
    .doc(currentUser!.uid);
final ordersRef = FirebaseFirestore.instance
    .collection('UserRegistration')
    .doc(currentUser!.uid)
    .collection("UserRegistration");
final addressRef = FirebaseFirestore.instance
    .collection('UserRegistration')
    .doc(currentUser!.uid)
    .collection("UserRegistration");
