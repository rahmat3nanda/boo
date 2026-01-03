import 'package:boo/cores/account/models/user/user.visibility.model.dart'
    show UserVisibility;

class User {
  const User({this.visibility, this.useMatricSystem, this.disableVibration});

  final UserVisibility? visibility;
  final bool? useMatricSystem;
  final bool? disableVibration;
}
