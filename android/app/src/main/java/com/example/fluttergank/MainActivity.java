package com.example.fluttergank;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "com.example.fluttergank/hall";

    //回调列表
    private static final String METHOD_OPEN_URL = "OpenUrl";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
//        new MethodChannel(getFlutterView(), CHANNEL)
//                .setMethodCallHandler(new MethodChannel.MethodCallHandler() {
//                    @Override
//                    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
//                        switch (methodCall.method) {
//                            case METHOD_OPEN_URL:
//                                String url = (String) methodCall.arguments;
//                                Intent intent = new Intent(Intent.ACTION_VIEW);
//                                intent.setData(Uri.parse(url));
//                                startActivity(intent);
//                                break;
//                        }
//                    }
//                });

    }
}
