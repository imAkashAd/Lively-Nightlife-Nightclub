// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:pacey_blacher/core/common/controllers/success_animation_controller.dart';
// import 'package:pacey_blacher/core/utils/constants/animated_icon_path.dart';

// class SuccessAnimation extends StatelessWidget {
//   const SuccessAnimation({super.key});
  
//   // ignore: non_constant_identifier_names
//   get Lottie => null;

//   @override
//   Widget build(BuildContext context) {
//     final SuccessAnimationController lottieCtrl = Get.put(
//       SuccessAnimationController(),
//     );

//     return Lottie.asset(
//       AnimatedIconPath.checked,
//       controller: lottieCtrl.animationController,
//       onLoaded: (composition) {
//         lottieCtrl.animationController.duration = composition.duration;
//         lottieCtrl.playAndHold();
//       },
//       width: 60.w,
//       height: 60.h,
//       repeat: false,
//     );
//   }
// }
