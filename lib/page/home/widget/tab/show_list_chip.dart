import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zjsb_app/res/gaps.dart';
import 'package:zjsb_app/res/styles.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zjsb_app/util/color_utils.dart';
import 'package:zjsb_app/util/image_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef ActionOneParam = void Function(int index);

class ShowListChip extends StatefulWidget {
  // 标题
  final String titleStr;

  // 数据源 List
  final List textList;

  final FontWeight fontWeight;

  // 样式
  final int cellType;

  // 选中方法
  final ActionOneParam valueChanged;

  ShowListChip(
      {Key key,
      this.titleStr = '',
      this.valueChanged,
      this.textList,
      this.cellType = 1,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  _ShowListChipState createState() => _ShowListChipState();
}

class _ShowListChipState extends State<ShowListChip> {
  int _valueChoice = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.titleStr, style: TextStyles.get2828TextStyle(context))
              .fontWeight(widget.fontWeight),
          Wrap(
            spacing: 8,
            children: List.generate(widget.textList.length, (index) {
              // return _buildChoiceItem(index);
              return widget.cellType == 1
                  ? _buildChoiceItem(index)
                  : _severItem(index);
            }),
          ),
          // 线条
          Container(
            height: 0.1,
            width: double.infinity,
            color: Colors.black.withOpacity(1),
            child: SizedBox(),
          ),
        ],
      ),
    );
  }

  //
  Widget _buildChoiceItem(int index) {
    return ChoiceChip(
      label: Text(
        widget.textList[index],
      ).textColor(_valueChoice == index ? ColorUtils.getThemeColor() : null),
      selectedColor: ColorUtils.getThemeColor().withOpacity(0.2),
      //选中的颜色
      onSelected: (bool selected) {
        setState(() {
          _valueChoice = selected ? index : null;
        });
        widget.valueChanged(index);
      },
      selected: _valueChoice == index,
      labelStyle: TextStyle(color: Colors.black54),
    );
  }

  Widget _severItem(int index) {
    return FilterChip(
      label: Text.rich(TextSpan(children: [
        TextSpan(text: '质押币', style: TextStyles.get6565TextStyle(context)),
        TextSpan(text: '7.2187').textColor(ColorUtils.getThemeColor()),
        // 单位
        TextSpan(text: 'BZZ/T').textColor(ColorUtils.getThemeColor()),
      ])),
      onSelected: (bool selected) {
        setState(() {
          _valueChoice = selected ? index : null;
        });
        widget.valueChanged(index);
      },
      selected: _valueChoice == index,
      labelStyle: TextStyle(color: Colors.black54),
    );
  }
}
