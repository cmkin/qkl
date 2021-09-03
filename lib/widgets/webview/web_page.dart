import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WebPage extends StatefulWidget {
  const WebPage(this.url) : super();
  final String url;

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> with AutomaticKeepAliveClientMixin {
  // 是否显示加载动画
  bool _flag = true;
  double xx = 0.01;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        this._flag ? _getMoreWidget() : Gaps.empty,
        Expanded(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            // 加载进度变化事件
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                this.xx = progress / 100;
                if ((progress / 100) > 0.999) {
                  this._flag = false;
                }
              });
            },
          ),
        )
      ],
    );
  }

  // 加载状态
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation(
                ColorUtils.getThemeColor().withOpacity(0.5)),
            //设置进度颜色
            backgroundColor: Colours.text_gray_c,
            //置整个进度条颜色
            value: xx // 进度值,0到1之间
            ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
