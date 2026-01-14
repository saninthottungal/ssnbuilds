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
  });

  final String? title;
  final IconData? leading;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
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
                    ),
                  const Spacer(),

                  //* Trailing
                  Text(
                    "page 1 of 1",
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.colorScheme.onPrimaryContainer.withValues(
                        alpha: 0.5,
                      ),
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
