import 'anonero_backup_platform_interface.dart';

class AnoneroBackup {
  Future<void> encryptFile({
    required String seedPassphrase,
    required String inFileName,
    required String outFileName,
  }) {
    return AnoneroBackupPlatform.instance.encryptFile(
      seedPassphrase: seedPassphrase,
      inFileName: inFileName,
      outFileName: outFileName,
    );
  }

  Future<void> decryptFile({
    required String seedPassphrase,
    required String inFileName,
    required String outFileName,
  }) {
    return AnoneroBackupPlatform.instance.decryptFile(
      seedPassphrase: seedPassphrase,
      inFileName: inFileName,
      outFileName: outFileName,
    );
  }
}
