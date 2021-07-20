import 'package:flutter/material.dart';
import 'dimen_constants.dart';

class UIConstants {
  static const fillContainer = BoxConstraints.expand();

  static const emptyBox = SizedBox();

  static const verticalBox4 = SizedBox(height: Dimens.size4);
  static const verticalBox8 = SizedBox(height: Dimens.size8);
  static const verticalBox12 = SizedBox(height: Dimens.size12);
  static const verticalBox16 = SizedBox(height: Dimens.size16);
  static const verticalBox20 = SizedBox(height: Dimens.size20);
  static const verticalBox24 = SizedBox(height: Dimens.size24);
  static const verticalBox32 = SizedBox(height: Dimens.size32);
  static const verticalBox48 = SizedBox(height: Dimens.size48);
  static const verticalBox64 = SizedBox(height: Dimens.size64);


  static const horizontalBox4 = SizedBox(width: Dimens.size4);
  static const horizontalBox8 = SizedBox(width: Dimens.size8);
  static const horizontalBox12 = SizedBox(width: Dimens.size12);
  static const horizontalBox16 = SizedBox(width: Dimens.size16);
  static const horizontalBox20 = SizedBox(width: Dimens.size20);
  static const horizontalBox24 = SizedBox(width: Dimens.size24);

  static const edgeInsetEmpty = EdgeInsets.all(Dimens.size0);

  static const edgeInsetAll4 = EdgeInsets.all(Dimens.size4);
  static const edgeInsetAll8 = EdgeInsets.all(Dimens.size8);
  static const edgeInsetAll12 = EdgeInsets.all(Dimens.size12);
  static const edgeInsetAll16 = EdgeInsets.all(Dimens.size16);
  static const edgeInsetAll24 = EdgeInsets.all(Dimens.size24);

  static const horizontalEdge8 = EdgeInsets.symmetric(horizontal: Dimens.size8);
  static const horizontalEdge16 = EdgeInsets.symmetric(horizontal: Dimens.size16);
  static const horizontalEdge24 = EdgeInsets.symmetric(horizontal: Dimens.size24);

  static const verticalEdge4 = EdgeInsets.symmetric(vertical: Dimens.size4);
  static const verticalEdge8 = EdgeInsets.symmetric(vertical: Dimens.size8);
  static const verticalEdge16 = EdgeInsets.symmetric(vertical: Dimens.size16);
  static const verticalEdge24 = EdgeInsets.symmetric(vertical: Dimens.size24);

  static const borderRadiusTopBottom = BorderRadius.only(
    topLeft: Radius.circular(Dimens.size8),
    bottomRight: Radius.circular(Dimens.size8),
  );

  static const borderRadiusTopBottom12 = BorderRadius.only(
    topLeft: Radius.circular(Dimens.size12),
    bottomRight: Radius.circular(Dimens.size12),
  );

  static const borderRadiusTopBottom16 = BorderRadius.only(
    topLeft: Radius.circular(Dimens.size16),
    bottomRight: Radius.circular(Dimens.size16),
  );
}
