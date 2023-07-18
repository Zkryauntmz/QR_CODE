// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// text bos olup olmadıgını kontrol ett ona göre iconları göster
// ignore: must_be_immutable
class RouteTwo extends StatelessWidget {
  late String url;

  RouteTwo({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
            )),
        appBar: AppBar(
            titleSpacing: 00.2,
            centerTitle: true,
            toolbarHeight: 45.2,
            toolbarOpacity: 0.7,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            elevation: 0.00,
            backgroundColor: Colors.blue[400],
            title: const Text(
              'SISECAM',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )));
  }
}
