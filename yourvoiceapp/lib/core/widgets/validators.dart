class Validators {
  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  static bool isPhonenumbber(String pn) {
    String p = r'^(\+\d{1,3}[- ]?)?\d{11,13}$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(pn);
  }
}
