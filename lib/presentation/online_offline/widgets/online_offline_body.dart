import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:sport_news/presentation/online_offline/widgets/offline_screen.dart';
import 'package:sport_news/presentation/online_offline/widgets/online_screen.dart';

class OnlineOfflineBody extends StatelessWidget {
  const OnlineOfflineBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        return connected ? const OnLineScreen() : const OffLineScreen();
      },
      child: Container(),
    );
  }
}
