// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:property_app/pages/agent_seller/subscriptions/Componets/update_paln_view.dart';

import '../../../Utils/color_utils.dart';
import '../../../Widgets/text_widget.dart';

class SubscriptionsPage extends StatelessWidget {
  const SubscriptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextWidget(
            text: 'Subscriptions',
            color: white_color,
          ),
        ),
        body: const UpdatePlanView());
  }
}
