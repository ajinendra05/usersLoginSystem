import 'package:hive/hive.dart';

import '../model/users_details.dart';

class Boxes {
  static Box<UserDetails> getUser() => Hive.box<UserDetails>('CurrentUser');
}
