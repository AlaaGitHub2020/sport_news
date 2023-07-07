import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_news/application/remote_url/remote_url_bloc.dart';
import 'package:sport_news/domain/core/utilities/strings.dart';
import 'package:sport_news/presentation/core/widgets/loading_screen.dart';
import 'package:sport_news/presentation/sport_news/sport_news_screen.dart';
import 'package:sport_news/presentation/web_vew/web_view_page.dart';

import '../../../main.dart';

class OnLineScreen extends StatefulWidget {
  const OnLineScreen({super.key});

  @override
  State<OnLineScreen> createState() => _OnLineScreenState();
}

class _OnLineScreenState extends State<OnLineScreen> {
  String? localUrlForWebView;

  getTheUrl() async {
    await SharedPreferences.getInstance().then((value) async {
      localUrlForWebView = value.getString(Strings.cLocalUrl);
      log.i("localUrlForWebView: $localUrlForWebView");
      if (localUrlForWebView == null) {
        context.read<RemoteUrlBloc>().add(const RemoteUrlEvent.getRemoteUrl());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getTheUrl();
  }

  @override
  Widget build(BuildContext context) {
    return (localUrlForWebView == null)
        ? BlocBuilder<RemoteUrlBloc, RemoteUrlState>(
            builder: (BuildContext context, RemoteUrlState state) {
            return state.map(
              initial: (_) => Scaffold(body: Container()),
              actionInProgress: (_) => const LoadingScreen(),
              actionFailure: (_) => const SportNewsScreen(),
              actionSuccess: (success) =>
                  WebViewPage(urlToOpen: success.theUrl!),
            );
          })
        : WebViewPage(urlToOpen: localUrlForWebView!);
  }
}
