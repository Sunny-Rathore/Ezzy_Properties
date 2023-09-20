import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_app/api_services/reels/reels_api.dart';
import 'package:property_app/pages/NewReals/content_screen.dart';

class ReelPage extends StatelessWidget {
  const ReelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReelsApi());
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder(
            future: controller.fetchApi(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return SafeArea(
                child: Stack(
                  children: [
                    Swiper(
                      itemCount: snapshot.data.data.length,
                      itemBuilder: (context, index) {
                        return ContentScreen(
                          src: snapshot.data.data[index].reels,
                        );
                      },
                      scrollDirection: Axis.vertical,
                    ),
                  ],
                ),
              );
            })));
  }
}
