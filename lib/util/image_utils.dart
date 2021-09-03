import 'package:cached_network_image/cached_network_image.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/widgets.dart';

class ImageUtils {
  static ImageProvider getAssetImage(String name,
      {ImageFormat format = ImageFormat.png, bool isDark = false}) {
    return AssetImage(getImgPath(name, format: format, isDark: isDark));
  }

  static String getImgPath(String name,
      {ImageFormat format = ImageFormat.png, bool isDark = false}) {
    ///通过统一加后缀“ ”的方式来统一替换图片
    String imgName = isDark ? name + '_dark' : name + "";
    return 'assets/images/$imgName.${format.value}';
  }

  static ImageProvider getImageProvider(String imageUrl,
      {String holderImg = 'none'}) {
    if (TextUtil.isEmpty(imageUrl)) {
      return AssetImage(getImgPath(holderImg));
    }
    return CachedNetworkImageProvider(imageUrl);
  }
}

enum ImageFormat { png, jpg, gif, webp }

extension ImageFormatExtension on ImageFormat {
  String get value => ['png', 'jpg', 'gif', 'webp'][index];
}
