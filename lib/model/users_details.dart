import 'dart:collection';
import 'dart:convert';
import 'package:flutter/services.dart' as rb;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'users_details.g.dart';

@HiveType(typeId: 0)
class UserDetails extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String id;
  @HiveField(2)
  late String aType;
  @HiveField(3)
  bool isactive = false;
  @HiveField(4)
  String? gender;
  @HiveField(5)
  int? age;

  UserDetails(
      {required this.name,
      required this.id,
      required this.aType,
      this.age,
      this.gender,
      this.isactive = false});

  UserDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    aType = json['atype'];
  }

  set setAge(int age) {
    age = age;
  }

  set setGender(String gen) {
    gender = gen;
  }

  void setActive() {
    isactive = true;
  }

  void setInactive() {
    isactive = false;
  }

  @override
  bool operator ==(covariant UserDetails other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class UserProvider extends ChangeNotifier {
  List<UserDetails> _users = [];

  Future<void> get fetchData async {
    final String response =
        await rb.rootBundle.loadString('JsonFile/userList.json');

    final data = json.decode(response);
    _users = await data[0]['users']
        .map<UserDetails>((user) => UserDetails.fromJson(user))
        .toList();

    notifyListeners();
  }

  void dataChange() {
    notifyListeners();
  }

  UnmodifiableListView<UserDetails> get users => UnmodifiableListView(_users);
}
