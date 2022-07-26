import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget image(
  final String source, {
  final Color? color,
  final double? width,
  final double? height,
  final BoxFit fit = BoxFit.contain,
  final Clip clipBehavior = Clip.hardEdge,
  final double borderRadius = 1,
  final EdgeInsets margin = EdgeInsets.zero,
  final String? placeholder,
  final VoidCallback? onTap,
}) {
  if (source.length <= 10) {
    if (placeholder == null)
      return SizedBox(width: width, height: height);
    else
      return imageAsset(
        placeholder,
        width: width,
        height: height,
        borderRadius: borderRadius,
        color: color,
        margin: margin,
        onTap: onTap,
        fit: fit,
        clipBehavior: clipBehavior,
      );
  } else {
    if (source.contains("http://") || source.contains("https://"))
      return imageNetwork(
        source,
        width: width,
        height: height,
        fit: fit,
        clipBehavior: clipBehavior,
        margin: margin,
        borderRadius: borderRadius,
        color: color,
        onTap: onTap,
        placeholder: placeholder,
      );
    else
      return imageAsset(
        source,
        width: width,
        height: height,
        fit: fit,
        clipBehavior: clipBehavior,
        margin: margin,
        borderRadius: borderRadius,
        color: color,
        onTap: onTap,
      );
  }
}

Widget imageAsset(
  final String asset, {
  final Color? color,
  final double? width,
  final double? height,
  final BoxFit fit = BoxFit.contain,
  final Clip clipBehavior = Clip.hardEdge,
  final double borderRadius = 1,
  final EdgeInsets margin = EdgeInsets.zero,
  final VoidCallback? onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
        margin: margin,
        width: width,
        height: height,
        child: asset.substring(asset.length - 3).toLowerCase() == "svg"
            ? SvgPicture.asset(
                asset,
                color: color,
                width: width,
                height: height,
                fit: fit,
                clipBehavior: clipBehavior,
              )
            : Image.asset(asset, color: color, width: width, height: height, fit: fit),
      ),
    );

Widget imageNetwork(
  final String url, {
  final Color? color,
  final double? width,
  final double? height,
  final BoxFit fit = BoxFit.contain,
  final Clip clipBehavior = Clip.hardEdge,
  final double borderRadius = 1,
  final EdgeInsets margin = EdgeInsets.zero,
  final VoidCallback? onTap,
  final String? placeholder,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
        margin: margin,
        width: width,
        height: height,
        child: url.length <= 10
            ? placeholder == null
                ? const SizedBox()
                : imageAsset(
                    placeholder,
                    width: width,
                    height: height,
                    fit: fit,
                    clipBehavior: clipBehavior,
                  )
            : url.substring(url.length - 3) == "svg"
                ? SvgPicture.network(
                    url,
                    color: color,
                    width: width,
                    height: height,
                    fit: fit,
                    placeholderBuilder: placeholder == null
                        ? null
                        : (final _) => imageAsset(
                              placeholder,
                              width: width,
                              height: height,
                              fit: fit,
                              clipBehavior: clipBehavior,
                            ),
                  )
                : CachedNetworkImage(
                    imageUrl: url,
                    color: color,
                    width: width,
                    height: height,
                    fit: fit,
                    errorWidget: placeholder == null
                        ? null
                        : (final _, final __, final ___) => imageAsset(
                              placeholder,
                              color: color,
                              width: width,
                              height: height,
                              fit: fit,
                              clipBehavior: clipBehavior,
                            ),
                    placeholder: placeholder == null
                        ? null
                        : (final _, final __) => imageAsset(
                              placeholder,
                              color: color,
                              width: width,
                              height: height,
                              fit: fit,
                              clipBehavior: clipBehavior,
                            ),
                  ),
      ),
    );

Widget imageFile(
  final File file, {
  final Color? color,
  final double? width,
  final double? height,
  final BoxFit fit = BoxFit.contain,
  final Clip clipBehavior = Clip.hardEdge,
  final double borderRadius = 1,
  final EdgeInsets margin = EdgeInsets.zero,
  final VoidCallback? onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
        margin: margin,
        width: width,
        height: height,
        child: Image.file(file, color: color, width: width, height: height, fit: fit),
      ),
    );
