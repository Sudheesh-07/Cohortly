import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefernceHelper{
  static String userIdKey = "USERKEY";
  static String userNamekey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userPicKey = "USERPICKEY";
  static String displayname = "USERDISPLAYNAME";
  Future<bool> saverUserId(String getUserId)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userIdKey, getUserId);
  }

  Future<bool> saveUserEmail(String getUserEmail)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userEmailKey, getUserEmail);
  }

  Future<bool> saverUserName(String getUserName)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userNamekey, getUserName);
  }

  Future<bool> saverUserPic(String getUserPic)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(userPicKey, getUserPic);
  }

  Future<bool> saverUserDisplayname(String getUserDisplayName)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString(displayname, getUserDisplayName);
  }

  Future<String?> getUserId()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    return pref.getString(userIdKey);
  }

  Future<String?> getUserName()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    return pref.getString(userNamekey);
  }

  Future<String?> getUserEmail()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    return pref.getString(userEmailKey);
  }

  Future<String?> getUserPic()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    return pref.getString(userPicKey);
  }

  Future<String?> getUserDisplayname()async{
    SharedPreferences pref =await SharedPreferences.getInstance();
    return pref.getString(displayname);
  }
}