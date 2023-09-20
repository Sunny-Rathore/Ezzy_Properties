import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:property_app/extensions/extension.dart';

import '../../../../../Utils/color_utils.dart';
import '../../../../../Widgets/text_widget.dart';
import 'details_view.dart';
import 'proposal_view.dart';

class BuyerDetailsPage extends StatelessWidget {
  const BuyerDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: TextWidget(
              text: 'Buyer Details',
              color: white_color,
            ),
            elevation: 0,
            bottom: PreferredSize(
                preferredSize: Size(double.infinity, 50.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    color: white_color,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.ph,
                        TabBar(
                          labelStyle: TextStyle(fontSize: 16.sp),
                          indicatorSize: TabBarIndicatorSize.label,
                          labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
                          indicatorColor: secondary_color,
                          isScrollable: true,
                          labelColor: secondary_color,
                          unselectedLabelColor: const Color(0xFFA7A7A7),
                          tabs: const [
                            Text('Details'),
                            Text('Proposals'),
                          ],
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                        )
                      ],
                    ),
                  ),
                ))),
        body: const TabBarView(children: [DetailsView(), ProposalView()]),
      ),
    );
  }
}
