import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // ============================================================
  // STORAGE KEYS
  // ============================================================

  static const String _loggedInKey =
      'style_ai_logged_in';

  static const String _nameKey =
      'style_ai_user_name';

  static const String _emailKey =
      'style_ai_user_email';

  static const String _passwordKey =
      'style_ai_user_password';

  // ============================================================
  // SIGN UP
  // ============================================================

  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final prefs =
    await SharedPreferences.getInstance();

    final cleanName = name.trim();
    final cleanEmail = email.trim().toLowerCase();

    if (cleanName.isEmpty ||
        cleanEmail.isEmpty ||
        password.isEmpty) {
      return false;
    }

    // Basic email validation.
    if (!cleanEmail.contains('@') ||
        !cleanEmail.contains('.')) {
      return false;
    }

    // Password validation.
    if (password.length < 6) {
      return false;
    }

    final existingEmail =
    prefs.getString(_emailKey);

    // Prevent creating another account with
    // the same email.
    if (existingEmail != null &&
        existingEmail.trim().toLowerCase() ==
            cleanEmail) {
      return false;
    }

    await prefs.setString(
      _nameKey,
      cleanName,
    );

    await prefs.setString(
      _emailKey,
      cleanEmail,
    );

    await prefs.setString(
      _passwordKey,
      password,
    );

    // Automatically log the user in after signup.
    await prefs.setBool(
      _loggedInKey,
      true,
    );

    return true;
  }

  // ============================================================
  // SIGN IN
  // ============================================================

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    final prefs =
    await SharedPreferences.getInstance();

    final savedEmail =
    prefs.getString(_emailKey);

    final savedPassword =
    prefs.getString(_passwordKey);

    // No registered account exists.
    if (savedEmail == null ||
        savedPassword == null) {
      return false;
    }

    final enteredEmail =
    email.trim().toLowerCase();

    final emailMatches =
        savedEmail.trim().toLowerCase() ==
            enteredEmail;

    final passwordMatches =
        savedPassword == password;

    if (!emailMatches ||
        !passwordMatches) {
      return false;
    }

    await prefs.setBool(
      _loggedInKey,
      true,
    );

    return true;
  }

  // ============================================================
  // LOGIN ALIAS
  // ============================================================
  //
  // Kept as an alias so screens can call login() instead of
  // signIn() without breaking the service.
  //
  // ============================================================

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    return signIn(
      email: email,
      password: password,
    );
  }

  // ============================================================
  // REGISTER ALIAS
  // ============================================================

  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    return signUp(
      name: name,
      email: email,
      password: password,
    );
  }

  // ============================================================
  // LOGOUT
  // ============================================================

  Future<void> logout() async {
    final prefs =
    await SharedPreferences.getInstance();

    await prefs.setBool(
      _loggedInKey,
      false,
    );
  }

  // ============================================================
  // CHECK LOGIN STATUS
  // ============================================================

  Future<bool> isLoggedIn() async {
    final prefs =
    await SharedPreferences.getInstance();

    return prefs.getBool(
      _loggedInKey,
    ) ??
        false;
  }

  // ============================================================
  // GET USER NAME
  // ============================================================

  Future<String?> getUserName() async {
    final prefs =
    await SharedPreferences.getInstance();

    return prefs.getString(
      _nameKey,
    );
  }

  // ============================================================
  // GET USER EMAIL
  // ============================================================

  Future<String?> getUserEmail() async {
    final prefs =
    await SharedPreferences.getInstance();

    return prefs.getString(
      _emailKey,
    );
  }

  // ============================================================
  // GET CURRENT USER
  // ============================================================

  Future<Map<String, String>?> getCurrentUser() async {
    final prefs =
    await SharedPreferences.getInstance();

    final name =
    prefs.getString(_nameKey);

    final email =
    prefs.getString(_emailKey);

    if (name == null &&
        email == null) {
      return null;
    }

    return {
      'name': name ?? '',
      'email': email ?? '',
    };
  }

  // ============================================================
  // CHECK WHETHER AN ACCOUNT EXISTS
  // ============================================================

  Future<bool> hasAccount() async {
    final prefs =
    await SharedPreferences.getInstance();

    final email =
    prefs.getString(_emailKey);

    return email != null &&
        email.trim().isNotEmpty;
  }

  // ============================================================
  // CLEAR ACCOUNT
  // ============================================================
  //
  // This completely deletes the locally stored account.
  // Normal logout should use logout(), not this method.
  //
  // ============================================================

  Future<void> clearAccount() async {
    final prefs =
    await SharedPreferences.getInstance();

    await prefs.remove(
      _loggedInKey,
    );

    await prefs.remove(
      _nameKey,
    );

    await prefs.remove(
      _emailKey,
    );

    await prefs.remove(
      _passwordKey,
    );
  }
}