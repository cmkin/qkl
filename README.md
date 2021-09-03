# zjsb_app

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

        environment: //这样配置将使工程支持空安全，新项目建议这样配置，原有项目还是 sdk: ">=2.7.0 <3.0.0"
        sdk: ">=2.12.0 <3.0.0"
        
    static M fromJsonAsT<M>(json) {
      if (json is List) {
      	if(M.toString() == "List<String>"){
  				List tempList = new List<String>();
  				json.forEach((itemJson) {
  					tempList.add(itemJson);
  				});
  				return tempList as M;
  			}
        return _getListChildType<M>(json);
      } else {
        return _fromJsonSingle<M>(json) as M;
      }
    }

     import 'package:styled_widget/styled_widget.dart';
     
     /// 使用Selector避免同provider数据变化导致此处不必要的刷新
                     child: Selector<GoodsPageProvider, int>(
                       selector: (_, provider) => provider.sortIndex,
                       /// 精准判断刷新条件（provider 4.0新属性）
     //                  shouldRebuild: (previous, next) => previous != next,
                       builder: (_, sortIndex, __) {
                         // 只会触发sortIndex变化的刷新
                         return Row(
                           mainAxisSize: MainAxisSize.min,
                           children: <Widget>[
                             Gaps.hGap16,
                             Text(
                               _sortList[sortIndex],
                               style: TextStyles.textBold24,
                             ),
                             Gaps.hGap8,
                             LoadAssetImage('goods/expand', width: 16.0, height: 16.0, color: _iconColor,)
                           ],
                         );
                       },
                     ),
                     获取全局context:
                     
                     BuildContext context = navigatorKey.currentState.overlay.context
                     
                     注意：通过这种方式获取的context在某些情况下需要放在
                     Future.delayed(Duration(seconds: 0)).then((onValue) { });