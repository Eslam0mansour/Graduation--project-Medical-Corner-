import 'package:shared_preferences/shared_preferences.dart';

class CachHelper{
  static late SharedPreferences shard;
  

  static inti ()async{
    shard=await SharedPreferences.getInstance();
  }

  static Future<bool> setMood({required String key, required bool value})async{
    return await shard.setBool(key, value);
  }

  static dynamic  getMood({required String key}){
    return shard.getBool(key);
  }

  static Future<bool> setLan({required String key, required bool value})async{
    return await shard.setBool(key, value);
  }

  static dynamic  getLan({required String key}){
    return shard.getBool(key);
  }

  static Future<bool> setColor({required String key, required var colorValue })async{
    
    return await shard.setInt(key, colorValue);
  }

  static dynamic  getColor({required String key}){
    return shard.getInt(key);
  }
}