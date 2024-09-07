import '../headers.dart';

class Prefs {
  Prefs._();
  static final pref = SharedPreferences.getInstance();
  static const _isSignedIn = 'isSignedIn';

  static Future<void> removeUser() async {
    final prefs = await pref;
    prefs.remove(_isSignedIn);
  }

  static Future<void> saveUser(bool isSignedIn) async {
    final prefs = await pref;
    await prefs.setBool(_isSignedIn, isSignedIn);
  }

  // static Future<void> saveProfile(ProfileModel profile) async {
  //   final prefs = await pref;
  //   // Convert the profile map to a JSON string
  //   String jsonString = json.encode(profile.toJson());
  //   await prefs.setString(_profile, jsonString);
  // }

  // static Future<ProfileModel?> getProfile() async {
  //   try {
  //     final prefs = await pref;
  //     final profile = prefs.getString(_profile);
  //     if (profile != null && profile.isNotEmpty) {
  //       // Decode the JSON string back to a map
  //       var profileMap = json.decode(profile);
  //       // log('ProfileMap: $profileMap');
  //       return ProfileModel.fromJson(profileMap);
  //     }
  //   } catch (e) {
  //     log('Error: ${e.toString()}');
  //   }
  //   return null;
  // }

  // static Future<void> removeProfile() async {
  //   final prefs = await pref;
  //   prefs.remove(_profile);
  // }
}
