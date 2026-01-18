import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:ssnbuilds/extensions/context_ext.dart';

class ContentWrapper extends StatelessWidget {
  const ContentWrapper({
    super.key,
    required this.child,
    this.title,
    this.leading,
    this.padding,
    this.margin,
    this.trailing,
    this.width,
    this.contentCrossAxisAlignment,
  });

  final String? title;
  final IconData? leading;
  final String? trailing;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final CrossAxisAlignment? contentCrossAxisAlignment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        border: Border.all(
          color: context.colorScheme.outline,
        ),
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.all(
          Radius.circular(context.gutterTiny),
        ),
      ),
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: contentCrossAxisAlignment ?? .center,
        children: [
          if (title != null || leading != null)
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: context.colorScheme.primaryContainer,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(context.gutterTiny),
                ),

                border: Border(
                  bottom: BorderSide(
                    color: context.colorScheme.outline,
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: context.gutterSmall,
                vertical: context.gutterTiny,
              ),
              child: Row(
                spacing: context.gutterTiny,
                children: [
                  //* Leading
                  if (leading != null)
                    Icon(
                      leading,
                      size: 14,
                      color: context.colorScheme.onPrimaryContainer,
                    ),

                  //* Title
                  if (title != null)
                    Text(
                      title ?? '',
                      style: context.textTheme.titleSmall?.copyWith(
                        color: context.colorScheme.onPrimaryContainer,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                  //* Trailing
                  if (trailing != null)
                    Expanded(
                      child: Text(
                        trailing!,
                        style: context.textTheme.labelSmall?.copyWith(
                          color: context.colorScheme.onPrimaryContainer
                              .withValues(alpha: 0.5),
                          overflow: TextOverflow.ellipsis,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                ],
              ),
            ),

          //* Child
          Padding(
            padding: padding ?? EdgeInsets.all(context.gutterSmall),
            child: child,
          ),
        ],
      ),
    );
  }
}
