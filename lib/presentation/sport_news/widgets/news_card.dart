import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sport_news/domain/core/utilities/colors.dart';
import 'package:sport_news/domain/news/article/article.dart';

class NewsCard extends StatelessWidget {
  final Article? article;

  const NewsCard({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(top: 8, bottom: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: AppColors.grayColor1,
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 8, right: 8),
          leading: SizedBox(
            height: MediaQuery.of(context).size.width * 0.1,
            width: MediaQuery.of(context).size.width * 0.125,
            child: CachedNetworkImage(
              imageUrl: article?.urlToImage?.getOrCrash() ?? "",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  buildProgressIndicator(downloadProgress, context),
              errorWidget: (context, url, error) => buildErrorIcon(),
              imageBuilder: (context, imageProvider) =>
                  buildCachedNetworkImage(context, imageProvider),
            ),
          ),
          title: Text(
            article?.title?.getOrCrash() ?? "",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          subtitle: Text(
            article?.description?.getOrCrash() ?? '',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ));
  }

  Shimmer buildProgressIndicator(
      DownloadProgress downloadProgress, BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.grayColor2,
      highlightColor: AppColors.blackColor2,
      child: const CircleAvatar(radius: 28),
    );
  }

  CircleAvatar buildCachedNetworkImage(
      BuildContext context, ImageProvider<Object> imageProvider) {
    return CircleAvatar(
      radius: 28,
      backgroundColor: Colors.transparent,
      foregroundImage: imageProvider,
    );
  }

  Center buildErrorIcon() =>
      const Center(child: Icon(Icons.error, color: AppColors.errorColor));
}
