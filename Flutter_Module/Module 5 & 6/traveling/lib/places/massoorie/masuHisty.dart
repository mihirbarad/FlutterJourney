import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:traveling/otherscreen/colors.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

class KinnuaurHistory extends StatefulWidget {
  const KinnuaurHistory({super.key});

  @override
  State<KinnuaurHistory> createState() => _KinnuaurHistoryState();
}

class _KinnuaurHistoryState extends State<KinnuaurHistory> {
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: WebView(
          initialUrl: 'https://en.wikipedia.org/wiki/Kinnaur_district',
        ),
      ),
    );
  }
}
