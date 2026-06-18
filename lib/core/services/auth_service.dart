// // ignore_for_file: unused_field

// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class AuthService extends GetxService {
//   final _storage = GetStorage();
//   final _onboardingStorage = GetStorage('onboarding_state');

//   static const String _accountTypeKey = 'account_type';
//   static const String _userEmailKey = 'user_email';
//   static const String _isLoggedInKey = 'is_logged_in';
//   static const String _userIdKey = 'user_id';

//   String _onboardingKeyFor(String email) {
//     return 'onboarding_completed_${email.trim().toLowerCase()}';
//   }

//   void setAccountType(String type) {
//     _storage.write(_accountTypeKey, type);
//   }

//   void setUserEmail(String email) {
//     _storage.write(_userEmailKey, email.trim());
//   }

//   String? getAccountType() {
//     return _storage.read<String>(_accountTypeKey);
//   }

//   void login(String email, String? accountType) {
//     _storage.write(_userEmailKey, email);
//     if (accountType != null) {
//       _storage.write(_accountTypeKey, accountType);
//     }
//     _storage.write(_isLoggedInKey, true);
//   }

//   bool isLoggedIn() {
//     return _storage.read<bool>(_isLoggedInKey) ?? false;
//   }

//   bool hasCompletedOnboarding({String? email}) {
//     final currentEmail = (email ?? getUserEmail())?.trim();
//     if (currentEmail == null || currentEmail.isEmpty) {
//       return false;
//     }

//     return _onboardingStorage.read<bool>(_onboardingKeyFor(currentEmail)) ??
//         false;
//   }

//   void markOnboardingCompleted({String? email}) {
//     final currentEmail = (email ?? getUserEmail())?.trim();
//     if (currentEmail == null || currentEmail.isEmpty) {
//       return;
//     }

//     _onboardingStorage.write(_onboardingKeyFor(currentEmail), true);
//   }

//   void resetSession() {
//     _storage.erase();
//   }

//   String getPanelRoute() {
//     String? accountType = getAccountType();

//     switch (accountType) {
//       case 'Buy a Product':
//         return '/customerBottomNavigationView';
//       case 'Sell Your Product':
//         return '/upgradeScreen';
//       // return '/sellerBottomNavigationView';
//       case 'Be our Delivery Partner':
//         return '/deliveryBottomNavigationView';
//       default:
//         return '/customerBottomNavigationView';
//     }
//   }

//   void logout() {
//     resetSession();
//   }

//   String? getUserEmail() {
//     return _storage.read<String>(_userEmailKey);
//   }
// }
