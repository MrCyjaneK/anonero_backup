package com.example.anonero_backup

import androidx.annotation.NonNull
import com.example.anonero_backup.EncryptUtil

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.io.File

/** AnoneroBackupPlugin */
class AnoneroBackupPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "anonero_backup")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "encryptFile") {
      val seedPassphrase = call.argument<String>("seedPassphrase");
      val inFileName = File(call.argument<String>("inFileName"))
      val outFileName = File(call.argument<String>("outFileName"))
      EncryptUtil.encryptFile(seedPassphrase!!, inFileName, outFileName)
      result.success("success");
    } else if (call.method == "decryptFile") {
      val seedPassphrase = call.argument<String>("seedPassphrase")
      val inFileName = File(call.argument<String>("inFileName"))
      val outFileName = File(call.argument<String>("outFileName"))
      EncryptUtil.decryptFile(seedPassphrase!!, inFileName, outFileName)
      result.success("success");
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
