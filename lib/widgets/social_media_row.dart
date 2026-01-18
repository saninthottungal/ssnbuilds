import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/constants/url_const.dart';
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
          return _SocialMediaIcon(
            iconPath: _socialMedias[index].iconPath,
            onTap: () => _onTap(_socialMedias[index].url),
          );
        },
      ),
    );
  }
}

class _SocialMediaIcon extends StatefulWidget {
  const _SocialMediaIcon({
    required this.iconPath,
    required this.onTap,
  });

  final VoidCallback onTap;
  final String iconPath;

  @override
  State<_SocialMediaIcon> createState() => _SocialMediaIconState();
}

class _SocialMediaIconState extends State<_SocialMediaIcon> {
  bool hightlight = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        hightlight = true;
      }),
      onExit: (_) => setState(() {
        hightlight = false;
      }),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: .translucent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          height: 32,
          width: 32,
          padding: EdgeInsets.all(hightlight ? 2 : 3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.primaryContainer,
          ),
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            tween: ColorTween(
              begin: context.colorScheme.onPrimaryContainer.withValues(
                alpha: 0.6,
              ),
              end: context.colorScheme.onPrimaryContainer.withValues(
                alpha: hightlight ? 1 : 0.6,
              ),
            ),
            builder: (context, value, _) =>
                Image.asset(widget.iconPath, color: value),
          ),
        ),
      ),
    );
  }
}

List<SocialMediaModel> _socialMedias = [
  // github
  SocialMediaModel(
    url: URLConsts.myGithub,
    iconPath: Assets.icons.github.path,
  ),

  //linkedin
  SocialMediaModel(
    url: URLConsts.myLinkedin,
    iconPath: Assets.icons.linkedin.path,
  ),

  //twitter
  SocialMediaModel(
    url: URLConsts.myTwitter,
    iconPath: Assets.icons.twitter.path,
  ),
];
