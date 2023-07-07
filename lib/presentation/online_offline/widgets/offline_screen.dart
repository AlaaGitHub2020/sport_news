import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_news/domain/core/utilities/colors.dart';
import 'package:sport_news/domain/core/utilities/strings.dart';
import 'package:sport_news/generated/l10n.dart';

class OffLineScreen extends StatelessWidget {
  const OffLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildOfflineImage(),
            const SizedBox(height: 35),
            buildYouAreOfflineText(context),
            const SizedBox(height: 8),
            buildNetworkConnectionIsRequiredText(context),
          ],
        ),
      ),
    );
  }

  Text buildNetworkConnectionIsRequiredText(BuildContext context) {
    return Text(
      S.of(context).networkConnectionIsRequired,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Text buildYouAreOfflineText(BuildContext context) {
    return Text(
      S.of(context).youAreOffline,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  SvgPicture buildOfflineImage() {
    return SvgPicture.asset(
      Strings.icOffline,
      colorFilter:
          const ColorFilter.mode(AppColors.errorColor, BlendMode.srcIn),
    );
  }
}
