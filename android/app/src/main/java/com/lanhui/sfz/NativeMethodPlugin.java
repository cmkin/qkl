package com.lanhui.sfz;

import android.app.Activity;
import android.content.Intent;

import java.io.File;
import java.util.Map;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class NativeMethodPlugin implements FlutterPlugin {

    public MethodChannel channel;
    private Activity mActivity;
    public static MethodChannel.Result mResult;
    public NativeMethodPlugin(Activity activity) {
        this.mActivity = activity;
    }

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        NativeMethodPlugin plugin = new NativeMethodPlugin(registrar.activity());
        plugin.setupMethodChannel(registrar.messenger());
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        setupMethodChannel(binding.getBinaryMessenger());
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        tearDownChannel();
    }

    private void setupMethodChannel(BinaryMessenger messenger) {
        channel = new MethodChannel(messenger, "nativeMethod");
        channel.setMethodCallHandler((methodCall, result) -> {
            mResult = result;
            if ("install".equals(methodCall.method)) {
                String path = methodCall.argument("path");
                openFile(path);
            } else {
                result.notImplemented();
            }
        });
    }

    /**
     * 安装 文件（APK）
     */
    private void openFile(String path) {
        Intent intents = new Intent();
        intents.setAction(Intent.ACTION_VIEW);
        intents.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        FileProvider7.setIntentDataAndType(mActivity, intents, "application/vnd.android.package-archive", new File(path), false);
        mActivity.startActivity(intents);
    }

    private void tearDownChannel() {
        channel.setMethodCallHandler(null);
        channel = null;
    }
}