// ignore_for_file: use_build_context_synchronously

import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';
import 'package:xtpay/app/widgets/app_colors.dart';
import 'package:xtpay/app/widgets/device_size.dart';
import 'package:xtpay/app/widgets/fontsize.dart';

void toastBar({required BuildContext context, required String label, required Color bgcolor}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        label,
        style: TextStyle(
          fontSize: isDeviceTablet() ? CustomFontsize.f13 : CustomFontsize.f16,
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: bgcolor,
    ),
  );
}

// void toastBarWithOpenButton({
//   required BuildContext context,
//   required String label,
//   required String filePath,
//   required Color bgcolor,
// }) {
//   ScaffoldMessenger.of(context).removeCurrentSnackBar();
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Row(
//         children: [
//           Expanded(
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontSize: isDeviceTablet() ? CustomFontsize.f13 : CustomFontsize.f16,
//                 color: AppColors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: CustomHight.h34,
//             child: TextButton(
//               onPressed: () async {
//                 final result = await OpenFile.open(filePath);
//                 if (result.type != ResultType.done) {
//                   ScaffoldMessenger.of(context).removeCurrentSnackBar();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: const Text("Failed to open the file"),
//                       backgroundColor: AppColors.red,
//                     ),
//                   );
//                 }
//               },
//               child: Text(
//                 "OPEN",
//                 style: TextStyle(
//                   color: AppColors.white,
//                   fontSize: isDeviceTablet() ? CustomFontsize.f13 : CustomFontsize.f14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: bgcolor,
//     ),
//   );
// }
