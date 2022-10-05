import 'package:flutter/material.dart';

class GlobalValidationMapFunction {
  static bool checkMap({
    required List<String> keys,
    required Map map,
    required String className,
  }) {
    for (var currentKey in keys) {
      if (map.containsKey(currentKey)) {
        if (map[currentKey] != null) {
          if (map[currentKey].toString() == '') {
            debugPrint('object');
          }
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
    return true;
  }
}
