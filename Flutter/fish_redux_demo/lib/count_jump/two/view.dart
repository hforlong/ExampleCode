import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(TwoState state, Dispatch dispatch, ViewService viewService) {
  return WillPopScope(
    child: _bodyWidget(state),
    onWillPop: () {
      dispatch(TwoActionCreator.backFirst());
      ///true：表示执行页面返回    false:表示不执行返回页面操作，这里因为要传值，所以接管返回操作
      return Future.value(false);
    },
  );
}

Widget _bodyWidget(TwoState state) {
  return Scaffold(
    appBar: AppBar(
      title: Text("TwoPage"),
      backgroundColor: state.themeColor,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('下方数据是TwoPage页面传递过来的:'),
          Text(state.msg),
        ],
      ),
    ),
  );
}