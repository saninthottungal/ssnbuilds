import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';
import 'package:ssnbuilds/gen/assets.gen.dart';
import 'package:ssnbuilds/models/social_media_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaRow extends StatelessWidget {
  const SocialMediaRow({super.key});

  void _onTap(String url) {
    final uri = Uri.parse(url);
    launchUrl(uri, mode: .externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: context.gutterTiny,
      children: List.generate(
        _socialMedias.length,
        (index) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => _onTap(_socialMedias[index].url),
            child: CircleAvatar(
              radius: 16,
              child: Image.asset(
                _socialMedias[index].iconPath,
                height: 26,
                width: 26,
                color: context.colorScheme.onPrimaryContainer.withValues(
                  alpha: 0.6,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<SocialMediaModel> _socialMedias = [
  // github
  SocialMediaModel(
    url: 'https://github.com/saninthottungal',
    iconPath: Assets.icons.github.path,
  ),

  //linkeding
  SocialMediaModel(
    url: 'https://www.linkedin.com/in/saninthottungal/',
    iconPath: Assets.icons.linkedin.path,
  ),

  //twitter
  SocialMediaModel(
    url: 'https://x.com/ssn564',
    iconPath: Assets.icons.twitter.path,
  ),
];
