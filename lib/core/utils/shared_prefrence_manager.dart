import 'dart:convert';

import 'package:online_exam/domain/entity/get_profile_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  // Singleton instance
  static final SharedPreferencesManager _instance =
      SharedPreferencesManager._internal();
  factory SharedPreferencesManager() => _instance;
  SharedPreferencesManager._internal();

  static late SharedPreferences _sharedPreferences;

  // Initialize SharedPreferences
  static Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Save any model with user-specific key
  static void saveModelForUser<T>({
    required String userId,
    required String key,
    required T model,
    required Map<String, dynamic> Function(T) toJson,
  }) {
    try {
      String userSpecificKey = _getUserSpecificKey(userId, key);
      String modelJson = jsonEncode(toJson(model));
      _sharedPreferences.setString(userSpecificKey, modelJson);
    } catch (e) {
      print('Error saving model for user: $e');
    }
  }

  // Delete any model with user-specific key
  static void deleteModelForUser({
    required String userId,
    required String key,
  }) {
    String userSpecificKey = _getUserSpecificKey(userId, key);
    _sharedPreferences.remove(userSpecificKey);
  }

  // Generate a user-specific key
  static String _getUserSpecificKey(String userId, String key) {
    return '${userId}_$key'; // Combine user ID and key
  }

  // Retrieve any model with user-specific key
  static T? getModelForUser<T>({
    required String userId,
    required String key,
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    try {
      String userSpecificKey = _getUserSpecificKey(userId, key);
      String? modelJson = _sharedPreferences.getString(userSpecificKey);
      if (modelJson != null && modelJson.isNotEmpty) {
        Map<String, dynamic> modelMap = jsonDecode(modelJson);
        return fromJson(modelMap);
      }
    } catch (e) {
      print('Error retrieving model for user: $e');
    }
    return null; // Return null if no model found
  }

  // Update any model with user-specific key
  static void updateModelForUser<T>({
    required String userId,
    required String key,
    required T model,
    required Map<String, dynamic> Function(T) toJson,
  }) {
    saveModelForUser(
      userId: userId,
      key: key,
      model: model,
      toJson: toJson,
    ); // Reuse saveModelForUser to update
  }

  // Save user data
  static void saveUser({required String key, required UserEntity user}) {
    try {
      String userJson = jsonEncode(user.toJson());
      _sharedPreferences.setString(key, userJson);
    } catch (e) {
      print('Error saving user: $e');
    }
  }

  // Get user data
  static UserEntity? getUser(String key) {
    try {
      String? userJson = _sharedPreferences.getString(key);
      if (userJson != null && userJson.isNotEmpty) {
        Map<String, dynamic> userMap = jsonDecode(userJson);
        return UserEntity.fromJson(userMap);
      }
    } catch (e) {
      print('Error retrieving user: $e');
    }
    return null; // Return null if no user found
  }

  // Update user data
  static void updateUser({required String key, required UserEntity user}) {
    saveUser(key: key, user: user); // Reuse saveUser to update
  }

  // Delete user data
  static void deleteUser(String key) {
    _sharedPreferences.remove(key);
  }

  // Save generic data
  static void saveData({required String key, required dynamic value}) {
    try {
      if (value is String) {
        _sharedPreferences.setString(key, value);
      } else if (value is int) {
        _sharedPreferences.setInt(key, value);
      } else if (value is bool) {
        _sharedPreferences.setBool(key, value);
      } else if (value is double) {
        _sharedPreferences.setDouble(key, value);
      } else if (value is List<String>) {
        _sharedPreferences.setStringList(key, value);
      }
    } catch (e) {
      print('Error saving data: $e');
    }
  }

  // Get generic data
  static dynamic getData(String key) {
    return _sharedPreferences.get(key);
  }

  // Remove specific data
  static void removeData(String key) {
    _sharedPreferences.remove(key);
  }

  // Clear all data
  static void clearData() {
    _sharedPreferences.clear();
  }
}
