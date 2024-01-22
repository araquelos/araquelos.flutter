package com.example.mobile_pj

import android.os.Build
import android.os.Bundle
import io.flutter.plugin.common.MethodChannel
import android.provider.Settings
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine;

class MainActivity : FlutterFragmentActivity() {
    private val CHANNEL = "com.example.device_name"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getDeviceName") {
                val deviceName = getDeviceName()
                result.success(deviceName)
            } else {
                result.notImplemented()
            }
        }
    }
    private fun getDeviceName(): String {

        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N_MR1) {
            Settings.Global.getString(contentResolver, Settings.Global.DEVICE_NAME)
        } else {
            Build.MODEL
        }
    }
}
