import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:property_app/controller/auth_controller.dart';
import 'package:property_app/extensions/extension.dart';
import 'package:property_app/pages/login_signup/otp_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utils/color_utils.dart';
import '../../../Widgets/text_widget.dart';

import '../../../Utils/img_utils.dart';
import '../../../Widgets/button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Widgets/back_button.dart';
import '../../api_services/auth/login_api.dart';
import '../../api_services/auth/signup_api.dart';
import '../../widgets/textfromfield_widget.dart';
import '../agent_seller/bottom_nav_bar/bottom_nav.dart';
import '../agent_seller/home/home.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key, required this.userSelectionindex})
      : super(key: key);
  final int userSelectionindex;
  @override
  Widget build(BuildContext context) {
    final controlller = Get.put(LoginApi());

    final AuthController authController = Get.find();
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          40.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BackButtonWidget(),
              Visibility(
                visible: userSelectionindex == 2,
                child: GestureDetector(
                    onTap: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.setInt("id", 2);
                      preferences.setInt('checkUser', 2);
                      Get.offAll(
                          HomeView(userSelectionindex: userSelectionindex));
                    },
                    child: const TextWidget(text: 'Skip')),
              ),
            ],
          ),
          SvgPicture.asset(
            signupimage,
            width: 203.69.w,
            height: 211.7.h,
          ),
          20.ph,
          TextWidget(
              text: 'Login',
              //text: 'Let’s You In',
              size: 20.sp,
              weight: FontWeight.w500,
              textAlign: TextAlign.center),
          20.ph,
          TextWidget(
            textAlign: TextAlign.left,
            text: 'Enter Your Mobile Number *',
            color: blacktext,
          ),
          10.ph,
          TextFromFieldWidget(
            controller: controlller.mobileController,
            hint: 'Phone number',
            icon: phoneicon,
            inputType: TextInputType.number,
          ),
          20.ph,

          TextWidget(
            textAlign: TextAlign.left,
            text: 'Enter Your Password *',
            color: blacktext,
          ),
          10.ph,
          TextFromFieldWidget(
            controller: controlller.passwordController,
            hint: 'Password',
            icon: phoneicon,
            inputType: TextInputType.number,
          ),
          20.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                  color: secondary_color,
                  textcolor: white_color,
                  text: 'Continue',
                  ontap: () async {
                    var data = await LoginApi().fetchLogin(
                      mobileNumber:
                          controlller.mobileController.text.toString(),
                      password: controlller.passwordController.text.toString(),
                      userType: userSelectionindex == 0
                          ? 'Agent'
                          : userSelectionindex == 1
                              ? 'Seller'
                              : 'Buyer',
                    );
                    Fluttertoast.showToast(msg: data.toString());
                    if (data == 'Success') {
                      authController.login(userSelectionindex);
                      Get.offAll(() => userSelectionindex == 2
                          ? const HomeView(
                              userSelectionindex: 2,
                            )
                          : BottomNavView(
                              userselectionindex: userSelectionindex,
                            ));
                    }
                  }),
            ],
          ),
          // Column(
          //   children: List.generate(3, (index) {
          //     return Container(
          //       margin: EdgeInsets.only(bottom: 10.h),
          //       width: double.infinity,
          //       height: 44.h,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(35.r),
          //           border: Border.all(color: const Color(0XFFEBEBEB))),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           SvgPicture.asset(LoginLogoList[index]),
          //           20.pw,
          //           TextWidget(
          //             text: LoginList[index],
          //             size: 14.sp,
          //             color: const Color(0Xff000000),
          //           )
          //         ],
          //       ),
          //     );
          //   }),
          // ),
          20.ph,
          const Row(
            children: [
              Expanded(child: Divider()),
              TextWidget(
                text: 'Or',
              ),
              Expanded(child: Divider())
            ],
          ),
          // 20.ph,
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Button(
          //         text: 'Sign in with phone number',
          //         color: secondary_color,
          //         textcolor: white_color,
          //         ontap: () {
          //           Get.to(LoginWithPone(
          //             index: index,
          //           ));
          //         }),
          //   ],
          // ),
          30.ph,
          TextWidget(
              text: 'Don’t have an account ?',
              size: 14.sp,
              color: blacktext,
              textAlign: TextAlign.center),
          10.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                text: 'SIGNUP',
                color: primary_color,
                textcolor: white_color,
                ontap: () => _show(context),
                //_showModalSheet(context)
              )
            ],
          ),
        ],
      ),
    );
  }

  void _show(BuildContext ctx) {
    final signUpcontrolller = Get.put(SignUpApi());
    final AuthController authController = Get.find();
    showModalBottomSheet(
        constraints: BoxConstraints(
          maxHeight: 489.h,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.w),
          topRight: Radius.circular(20.w),
        )),
        elevation: 10,
        backgroundColor: white_color,
        context: ctx,
        builder: (ctx) => ListView(
              padding: EdgeInsets.all(20.h),
              children: [
                TextWidget(
                    text: 'Signup',
                    color: secondary_color,
                    size: 20.sp,
                    textAlign: TextAlign.center),
                20.ph,
                TextWidget(
                  text: 'Enter Your Name',
                  textAlign: TextAlign.left,
                  color: secondary_color,
                ),
                10.ph,
                TextFromFieldWidget(
                    controller: signUpcontrolller.nameController,
                    hint: "Name",
                    icon: mailicon),
                20.ph,
                TextWidget(
                  text: 'Enter Your Email (Optional)',
                  textAlign: TextAlign.left,
                  color: secondary_color,
                ),
                10.ph,
                TextFromFieldWidget(
                    controller: signUpcontrolller.emailController,
                    hint: "Email id",
                    icon: mailicon),
                10.ph,
                TextWidget(
                  text: 'Enter Your Mobile Number *',
                  textAlign: TextAlign.left,
                  color: secondary_color,
                ),
                10.ph,
                TextFromFieldWidget(
                    controller: signUpcontrolller.mobileController,
                    hint: "Phone Number",
                    icon: phoneicon),
                10.ph,
                TextWidget(
                  text: 'Enter Your Password *',
                  textAlign: TextAlign.left,
                  color: secondary_color,
                ),
                10.ph,
                TextFromFieldWidget(
                    controller: signUpcontrolller.passwordController,
                    hint: "Password",
                    icon: phoneicon),
                10.ph,
                TextWidget(
                  text: 'Enter Your Address *',
                  textAlign: TextAlign.left,
                  color: secondary_color,
                ),
                10.ph,
                TextFromFieldWidget(
                    controller: signUpcontrolller.addressController,
                    hint: "Address",
                    icon: phoneicon),
                40.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                        text: 'CONTINUE',
                        color: secondary_color,
                        textcolor: white_color,
                        ontap: () async {
                          String msg = await signUpcontrolller.fetchApi(
                              userType: userSelectionindex,
                              mobileNumber:
                                  signUpcontrolller.mobileController.text,
                              password:
                                  signUpcontrolller.passwordController.text,
                              address: signUpcontrolller.addressController.text,
                              email: signUpcontrolller.emailController.text,
                              name: signUpcontrolller.nameController.text);
                          Fluttertoast.showToast(msg: msg);
                          if (msg == 'Success') {
                            authController.login(
                              userSelectionindex,
                            );
                            Get.offAll(
                              () => OtpPageView(
                                  userSelectionindex: userSelectionindex),
                            );
                          }
                        }),
                  ],
                ),
                40.ph,
                TextWidget(
                    text: 'Aalready have an account',
                    color: blacktext,
                    textAlign: TextAlign.center),
                10.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                        text: 'LOGIN',
                        color: primary_color,
                        textcolor: white_color,
                        ontap: () {
                          Get.to(() => LoginView(
                              userSelectionindex: userSelectionindex));
                        }),
                  ],
                ),
              ],
            ));
  }
}
