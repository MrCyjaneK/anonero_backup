import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'anonero_backup_platform_interface.dart';

/// An implementation of [AnoneroBackupPlatform] that uses method channels.
class MethodChannelAnoneroBackup extends AnoneroBackupPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('anonero_backup');

  @override
  Future<bool> encryptFile({
    required String seedPassphrase,
    required String inFileName,
    required String outFileName,
  }) async {
    await methodChannel.invokeMethod('encryptFile', {
      "seedPassphrase": seedPassphrase,
      "inFileName": inFileName,
      "outFileName": outFileName,
    });
    return true;
  }

  @override
  Future<bool> decryptFile({
    required String seedPassphrase,
    required String inFileName,
    required String outFileName,
  }) async {
    await methodChannel.invokeMethod('decryptFile', {
      "seedPassphrase": seedPassphrase,
      "inFileName": inFileName,
      "outFileName": outFileName,
    });
    return true;
  }
}
