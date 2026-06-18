// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:jerfox23_popn/core/common/controllers/language_switch_controller.dart';
// import 'package:pacey_blacher/core/common/controllers/language_switch_controller.dart';
// import 'package:pacey_blacher/core/utils/constants/colors.dart';

// class LanguageSwitch extends StatelessWidget {
//   final languageController = Get.find<LanguageSwitchController>();

//   LanguageSwitch({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16.r),
//           color: Colors.grey.shade300,
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             GestureDetector(
//               onTap: languageController.setEnglish,
//               child: AnimatedContainer(
//                 duration: Duration(milliseconds: 250),
//                 padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
//                 decoration: BoxDecoration(
//                   color: languageController.isEnglish
//                       ? AppColors.primaryColor
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(16.r),
//                 ),
//                 child: Text(
//                     'EN',
//                     style: TextStyle(
//                       color: languageController.isEnglish
//                           ? Colors.white
//                           : Colors.black,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//               ),
//             ),
//             GestureDetector(
//               onTap: languageController.setHebrew,
//               child: AnimatedContainer(
//                 duration: Duration(milliseconds: 250),
//                 padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
//                 decoration: BoxDecoration(
//                   color: languageController.isHebrew
//                       ? AppColors.primaryColor
//                       : Colors.transparent,
//                   borderRadius: BorderRadius.circular(16.r),
//                 ),
//                 child: Text(
//                     'HE',
//                     style: TextStyle(
//                       color: languageController.isHebrew
//                           ? Colors.white
//                           : Colors.black,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
