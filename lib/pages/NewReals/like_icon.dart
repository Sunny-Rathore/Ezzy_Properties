import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LikeIcon extends StatelessWidget {
  const LikeIcon({Key? key}) : super(key: key);

  Future<int> tempFuture() async {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: tempFuture(),
        builder: (context, snapshot) =>
            snapshot.connectionState != ConnectionState.done
                ? Icon(
                    Icons.favorite,
                    size: 20.w,
                    color: Colors.red,
                  )
                : const SizedBox(),
      ),
    );
  }
}
