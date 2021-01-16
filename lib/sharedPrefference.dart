
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPreferencesHelper {

  addStringToSF(String keyValue, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyValue, value);
  }

  addIntToSF(String keyValue, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(keyValue, value);
  }

  addDoubleToSF(String keyValue, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(keyValue, value);
  }

  static addBoolToSF(String keyValue, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyValue, value);
  }

  static Future<bool> getBoolValuesSF(String keyValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool(keyValue) ?? false;
    return boolValue;
  }

  static Future<String> getStringValuesSF(String keyValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString(keyValue);
    return stringValue;
  }

  static Future<int> getIntValuesSF(String keyValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int intValue = prefs.getInt(keyValue);
    return intValue;
  }
  static Future<double> getDoubleValuesSF(String keyValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double doubleValue = prefs.getDouble(keyValue);
    return doubleValue;
  }

  static removeValues(String keyValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove value in pref
    prefs.remove(keyValue);
  }

  static Future<bool> isPrefValuePresent(String keyValue) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(keyValue);
  }
}
