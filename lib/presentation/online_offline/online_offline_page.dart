import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sport_news/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:sport_news/injection.dart';
import 'package:sport_news/presentation/online_offline/widgets/online_offline_body.dart';


@RoutePage()
class OnlineOfflinePage extends StatelessWidget {
  const OnlineOfflinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getIt.allReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final log=getLogger();
          log.i("snapshot:$snapshot");
          return const OnlineOfflineBody();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
