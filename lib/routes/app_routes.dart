import 'package:get/get.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/bindings/auth_bindings.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/bindings/create_password_binding.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/bindings/opt_bindings.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/bindings/reset_password_flow_binding.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/bindings/signup_binding.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/view/get_started_view.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/view/login_view.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/view/otp_verification_view.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/view/password_reset_flow_view.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/view/sign_up_view.dart';
import 'package:lively_nightlife_nightclub_party/features/auth_view/widgets/create_new_pass_view.dart';
import 'package:lively_nightlife_nightclub_party/features/bottom_navigation_bar/bindings/club_bottom_navbar_bindings.dart';
import 'package:lively_nightlife_nightclub_party/features/bottom_navigation_bar/bindings/user_bottom_navbar_bindings.dart';
import 'package:lively_nightlife_nightclub_party/features/bottom_navigation_bar/view/club_bottom_navbar_view.dart';
import 'package:lively_nightlife_nightclub_party/features/bottom_navigation_bar/view/user_bottom_navigation_bar_view.dart';
// import 'package:lively_nightlife_nightclub_party/features/bottom_navigation_bar/bindings/navbar_bindings.dart';
// import 'package:lively_nightlife_nightclub_party/features/bottom_navigation_bar/view/bottom_navigation_bar_view.dart';
import 'package:lively_nightlife_nightclub_party/features/onboarding_view/bindings/onboading_binding.dart';
import 'package:lively_nightlife_nightclub_party/features/onboarding_view/bindings/permissions_bindings.dart';
import 'package:lively_nightlife_nightclub_party/features/onboarding_view/bindings/vibe_selection_bindings.dart';
import 'package:lively_nightlife_nightclub_party/features/onboarding_view/model/permission_type.dart';
import 'package:lively_nightlife_nightclub_party/features/onboarding_view/view/onboarding_view.dart';
import 'package:lively_nightlife_nightclub_party/features/onboarding_view/view/permission_view.dart';
import 'package:lively_nightlife_nightclub_party/features/onboarding_view/view/vibe_selection_view.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/heat_map/bindings/heat_map_bindings.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/home_view/bindings/user_home_bindings.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/notification/bindings/user_notification_bindings.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/notification/view/user_notification_read_view.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/notification/view/user_notification_view.dart';
import 'package:lively_nightlife_nightclub_party/features/splash_view/bindings/splash_bindings.dart';
import 'package:lively_nightlife_nightclub_party/features/splash_view/view/splash_view.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/discover_view/bindings/user_discover_binding.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/club_details/bindings/user_club_details_binding.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/club_details/view/user_club_details_view.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/chat_view/bindings/user_chat_binding.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/chat_view/view/user_chat_screen_view.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/events/bindings/user_event_binding.dart';
import 'package:lively_nightlife_nightclub_party/features/role/user/events/view/user_event_details_view.dart';

class AppRoute {
  static const String splashView = '/splashView';
  static const String onboardingView = '/onboardingView';
  static const String loginView = '/loginView';
  static const String forgetPassView = '/forgetPassView';
  static const String createNewPassView = '/createNewPassView';
  static const String signUpView = '/signUpView';
  static const String userBottomNavigationBarView =
      '/userBottomNavigationBarView';
  static const String clubBottomNavbarView = '/clubBottomNavbarView';
  static const String notificationView = '/notificationView';
  static const String changePasswordView = '/changePasswordView';
  static const String getStartedView = '/getstartedView';
  static const String otpVerificationView = '/otpVerificationView';
  static const String permissionView = '/permissionView';
  static const String vibeSelectionView = '/vibeSelectionView';
  static const String userNotificationView = '/userNotificationView';
  static const String userNotificationReadView = '/userNotificationReadView';
  static const String userClubDetailsView = '/userClubDetailsView';
  static const String userChatScreenView = '/userChatScreenView';
  static const String userEventDetailsView = '/userEventDetailsView';

  static String getSplashView() => splashView;
  static String getOnboardingView() => onboardingView;
  static String getLoginView() => loginView;
  static String getForgetPassView() => forgetPassView;
  static String getCreateNewPassView() => createNewPassView;
  static String getSignUpView() => signUpView;
  static String getUserBottomNavigationBarView() => userBottomNavigationBarView;
  static String getClubBottomNavbarView() => clubBottomNavbarView;
  static String getNotificationView() => notificationView;
  static String getChangePasswordView() => changePasswordView;
  static String getGetStartedView() => getStartedView;
  static String getOtpVerificationView() => otpVerificationView;
  static String getPermissionView() => permissionView;
  static String getVibeSelectionView() => vibeSelectionView;
  static String getUserNotificationView() => userNotificationView;
  static String getUserNotificationReadView() => userNotificationReadView;
  static String getUserClubDetailsView() => userClubDetailsView;
  static String getUserChatScreenView() => userChatScreenView;
  static String getUserEventDetailsView() => userEventDetailsView;

  static List<GetPage> routes = [
    GetPage(
      name: splashView,
      page: () => SplashView(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: onboardingView,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(name: loginView, page: () => LoginView(), binding: AuthBindings()),
    GetPage(
      name: forgetPassView,
      page: () => PasswordResetFlowView(),
      binding: ResetPasswordFlowBinding(),
    ),
    GetPage(
      name: createNewPassView,
      page: () => CreateNewPassView(),
      binding: CreatePasswordBinding(),
    ),
    GetPage(
      name: signUpView,
      page: () => SignUpView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: userBottomNavigationBarView,
      page: () => UserBottomNavigationView(),
      bindings: [UserBottomNavbarBindings(), UserHomeBindings(), HeatMapBinding(), UserDiscoverBinding()],
    ),

    GetPage(
      name: clubBottomNavbarView,
      page: () => ClubBottomNavbarView(),
      binding: ClubBottomNavbarBinding(),
    ),
    // GetPage(
    //   name: notificationView,
    //   page: () => const NotificationView(),
    //   binding: NotificationBinding(),
    // ),
    // GetPage(
    //   name: changePasswordView,
    //   page: () => const ChangePasswordView(),
    //   binding: ChangePasswordBinding(),
    // ),
    GetPage(name: getStartedView, page: () => GetStartedView()),
    GetPage(
      name: otpVerificationView,
      page: () => OtpVerificationView(),
      binding: OtpBinding(),
    ),

    GetPage(
      name: permissionView,
      page: () => const PermissionView(type: PermissionType.location),
      binding: PermissionsBinding(),
    ),

    GetPage(
      name: vibeSelectionView,
      page: () => const VibeSelectionView(),
      binding: VibeSelectionBinding(),
    ),
    GetPage(
      name: userNotificationView,
      page: () => const UserNotificationView(),
      binding: UserNotificationBinding(),
    ),
    GetPage(
      name: userNotificationReadView,
      page: () => const UserNotificationReadView(),
      // binding: UserNotificationBinding(),
    ),
    GetPage(
      name: userClubDetailsView,
      page: () => const UserClubDetailsView(),
      binding: UserClubDetailsBinding(),
    ),
    GetPage(
      name: userChatScreenView,
      page: () => const UserChatScreenView(),
      binding: UserChatBinding(),
    ),
    GetPage(
      name: userEventDetailsView,
      page: () => const UserEventDetailsView(),
      binding: UserEventBinding(),
    ),
  ];
}
