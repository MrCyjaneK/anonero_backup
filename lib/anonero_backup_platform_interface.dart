import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'anonero_backup_method_channel.dart';

abstract class AnoneroBackupPlatform extends PlatformInterface {
  /// Constructs a AnoneroBackupPlatform.
  AnoneroBackupPlatform() : super(token: _token);

  static final Object _token = Object();

  static AnoneroBackupPlatform _instance = MethodChannelAnoneroBackup();

  /// The default instance of [AnoneroBackupPlatform] to use.
  ///
  /// Defaults to [MethodChannelAnoneroBackup].
  static AnoneroBackupPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AnoneroBackupPlatform] when
  /// they register themselves.
  static set instance(AnoneroBackupPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> encryptFile({
    required String seedPassphrase,
    required String inFileName,
    required String outFileName,
  }) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> decryptFile({
    required String seedPassphrase,
    required String inFileName,
    required String outFileName,
  }) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
