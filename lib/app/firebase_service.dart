import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class FirebaseAppDistributionHelper {
  static const MethodChannel _channel = MethodChannel('app_distribution');

  static Future<void> triggerFeedback() async {
    try {
      await _channel.invokeMethod('triggerFeedback');
    } on PlatformException catch (e) {
      debugPrint("Failed to launch feedback: ${e.message}");
    }
  }
}
