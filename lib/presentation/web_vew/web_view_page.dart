import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sport_news/injection.dart';

import '../../main.dart';

@RoutePage()
class WebViewPage extends StatefulWidget {
  final String urlToOpen;

  const WebViewPage({Key? key, required this.urlToOpen}) : super(key: key);

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late InAppWebViewController _webViewController;
  late final Uri theUri;
  final expiresDate =
      DateTime.now().add(const Duration(days: 3)).millisecondsSinceEpoch;

  setTheCookie() async {
    log.i("setTheCookie Started");
    await getIt<CookieManager>().setCookie(
      url: theUri,
      name: "myCookie",
      value: "myValue",
      expiresDate: expiresDate,
      isSecure: true,
    );
  }

  getCookies() async {
    log.i("getCookies Started");
    List<Cookie> cookies = await getIt<CookieManager>().getCookies(url: theUri);
    log.i("cookies:$cookies");
  }

  getACookie() async {
    log.i("getACookie Started");
    Cookie? cookie =
        await getIt<CookieManager>().getCookie(url: theUri, name: "myCookie");
    log.i("cookie:$cookie");
  }

  Future<bool> onBackPressed() async {
    _webViewController.goBack();
    return false;
  }

  @override
  void initState() {
    super.initState();
    theUri = Uri(path: widget.urlToOpen);
    setTheCookie();
    getACookie();
    getCookies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WillPopScope(
          onWillPop: onBackPressed,
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.urlToOpen)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                useShouldOverrideUrlLoading: true,
                javaScriptCanOpenWindowsAutomatically: true,
                javaScriptEnabled: true,
                cacheEnabled: true,
                allowFileAccessFromFileURLs: true,
                supportZoom: true,
              ),
            ),
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            androidOnPermissionRequest: (InAppWebViewController controller,
                String origin, List<String> resources) async {
              return PermissionRequestResponse(
                  resources: resources,
                  action: PermissionRequestResponseAction.GRANT);
            },
          ),
        ),
      ),
    );
  }
}
