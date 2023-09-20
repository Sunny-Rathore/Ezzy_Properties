import 'package:flutter/material.dart';
import 'package:property_app/Widgets/text_widget.dart';

import '../Utils/color_utils.dart';

AppBar appbar(title, context) => AppBar(
      centerTitle: true,
      title: TextWidget(
        text: title,
        color: white_color,
      ),
    );
