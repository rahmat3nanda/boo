import 'package:boo/cores/account/models/profile/profile.model.dart'
    show Profile;
import 'package:boo/cores/account/models/user/user.model.dart' show User;

class Account {
  const Account({this.user, this.email, this.deactivated, this.profile});

  final User? user;
  final String? email;
  final bool? deactivated;
  final Profile? profile;
}
