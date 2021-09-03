import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/util/image_utils.dart';
import 'package:zjsb_app/widgets/load_image.dart';

class PInfoImage extends StatefulWidget {
  String url;
  double size;
  // 默认本地图片
  String unUrl;
  PInfoImage({Key key,this.url,this.size = 40,this.unUrl = 'icon_uesr_default'}): super(key: key);
  @override
  _PInfoImageState createState() => _PInfoImageState();
}

class _PInfoImageState extends State<PInfoImage> {
  @override
  Widget build(BuildContext context) {
    return  LoadImage(widget.url,errorImg: widget.unUrl,width: widget.size,height: widget.size,);
  }
}
