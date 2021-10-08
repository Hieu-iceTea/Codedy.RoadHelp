import 'package:flutter/widgets.dart';
import 'package:roadhelp/screens/my_account/edit_my_account_success/edit_my_account_success_screen.dart';

import '/screens/auth/complete_profile/complete_profile_screen.dart';
import '/screens/auth/forgot_password/forgot_password_screen.dart';
import '/screens/auth/otp/otp_screen.dart';
import '/screens/auth/sign_in/sign_in_screen.dart';
import '/screens/auth/sign_in_partner/sign_in_partner_screen.dart';
import '/screens/auth/sign_up/sign_up_screen.dart';
import '/screens/cart/cart_screen.dart';
import '/screens/details/details_screen.dart';
import '/screens/emergency_rescue/receive/receive_rescue/receive_rescue_screen.dart';
import '/screens/emergency_rescue/receive/receive_rescue_details/receive_rescue_details_screen.dart';
import '/screens/emergency_rescue/receive/receive_rescue_navigation_map/receive_rescue_navigation_map_screen.dart';
import '/screens/emergency_rescue/send/send_rescue/send_rescue_screen.dart';
import '/screens/emergency_rescue/send/send_rescue_confirm/send_rescue_confirm_screen.dart';
import '/screens/emergency_rescue/send/send_rescue_reviews/send_rescue_reviews_screen.dart';
import '/screens/emergency_rescue/send/send_rescue_tracking/send_rescue_tracking_screen.dart';
import '/screens/home/home_screen.dart';
import '/screens/login_success/login_success_screen.dart';
import '/screens/my_account/become_to_partner/become_to_partner_screen.dart';
import '/screens/my_account/change_password/change_password_screen.dart';
import '/screens/my_account/my_account/my_account_screen.dart';
import '/screens/my_account/edit_my_account/edit_my_account_screen.dart';
import '/screens/place/gas_place/gas_place_screen.dart';
import '/screens/place/repair_place/member/repair_place/repair_place_screen.dart';
import '/screens/place/repair_place/member/repair_place_details/repair_place_details_screen.dart';
import '/screens/place/repair_place/partner/repair_place_manage/repair_place_manage_screen.dart';
import '/screens/place/repair_place/partner/repair_place_manage_add_edit/repair_place_manage_add_edit_screen.dart';
import '/screens/place/repair_place/partner/repair_place_manage_details/repair_place_manage_details_screen.dart';
import '/screens/profile/profile_screen.dart';
import '/screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  EditMyAccountSuccess.routeName: (context) => EditMyAccountSuccess(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  //NEW:
  //TODO: Chưa sửa 'routeName' của các màn hình:
  SignInPartnerScreen.routeName: (context) => const SignInPartnerScreen(),
  ReceiveRescueScreen.routeName: (context) => const ReceiveRescueScreen(),
  ReceiveRescueDetailsScreen.routeName: (context) => const ReceiveRescueDetailsScreen(),
  ReceiveRescueNavigationMapScreen.routeName: (context) => const ReceiveRescueNavigationMapScreen(),
  SendRescueScreen.routeName: (context) => const SendRescueScreen(),
  SendRescueConfirmScreen.routeName: (context) => const SendRescueConfirmScreen(),
  SendRescueReviewsScreen.routeName: (context) => const SendRescueReviewsScreen(),
  SendRescueTrackingScreen.routeName: (context) => const SendRescueTrackingScreen(),
  BecomeToPartnerScreen.routeName: (context) => const BecomeToPartnerScreen(),
  ChangePasswordScreen.routeName: (context) => const ChangePasswordScreen(),
  MyAccountScreen.routeName: (context) => const MyAccountScreen(),
  EditMyAccount.routeName: (context) => const EditMyAccount(),
  GasPlaceScreen.routeName: (context) => const GasPlaceScreen(),
  RepairPlaceScreen.routeName: (context) => const RepairPlaceScreen(),
  RepairPlaceDetailsScreen.routeName: (context) => const RepairPlaceDetailsScreen(),
  RepairPlaceManageScreen.routeName: (context) => const RepairPlaceManageScreen(),
  RepairPlaceManageAddEditScreen.routeName: (context) => const RepairPlaceManageAddEditScreen(),
  RepairPlaceManageDetailsScreen.routeName: (context) => const RepairPlaceManageDetailsScreen(),
};
