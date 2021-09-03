import 'package:flutter/material.dart';
import 'package:zjsb_app/generated/l10n.dart';
import 'package:zjsb_app/res/colors.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/widgets/hi_table.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabDetailOne extends StatefulWidget {
  @override
  _TabDetailOneState createState() => _TabDetailOneState();
}

class _TabDetailOneState extends State<TabDetailOne>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    List<TableDetail> list1 = [
      TableDetail('${S.of(context).hm_bg_sbxh}', '存储服务器（分布式）A-1T'),
      TableDetail('${S.of(context).hm_bg_ccb}', 'BZZ')
    ];
    List<TableDetail> list2 = [
      TableDetail('${S.of(context).hm_bg_edkj}', '1Tib'),
      TableDetail('${S.of(context).hm_bg_yxkj}', '100%')
    ];
    List<TableDetail> list3 = [
      TableDetail('${S.of(context).hm_bg_tmq}', '1${S.of(context).dw_tian}'),
      TableDetail('${S.of(context).hm_bg_jsfuf}', '20.00%')
    ];
    List<TableDetail> list4 = [
      TableDetail('${S.of(context).hm_bg_zlzq}',
          '540${S.of(context).dw_tian}+540${S.of(context).dw_tian}')
    ];
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Container(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HiTable([list1, list2, list3, list4]),
                Gaps.vGap10,
                Text("${S.of(context).hm_bg_zysx}")
                    .fontSize(13.sp)
                    .textColor(ColorUtils.getThemeColor()),
                Text(
                  "${S.of(context).hm_bg_zysx_text}",
                  maxLines: 4,
                ).fontSize(12.sp).textColor(Colours.text_gray),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
