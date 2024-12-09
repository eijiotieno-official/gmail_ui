// import 'package:flutter/material.dart';
// import 'package:gmail_ui/model/base/account_model.dart';
// import 'package:gmail_ui/view/widgets/input_view.dart';

// class FromSection extends StatelessWidget {
//   final TextEditingController fromController;
//   final List<Account> senderAccounts;
//   final VoidCallback onPickAccount;
//   const FromSection({
//     super.key,
//     required this.fromController,
//     required this.senderAccounts,
//     required this.onPickAccount,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InputView(
//       controller: fromController,
//     );

//     InkWell(
//       hoverColor: Theme.of(context).colorScheme.surface,
//       child: Row(
//         children: [
//           Text(
//             "From    ",
//             style: TextStyle(
//               color: Theme.of(context).colorScheme.primary,
//             ),
//           ),
//           Expanded(
//             child: TextField(
//               controller: fromController,
//               onTap: onPickAccount,
//               decoration: const InputDecoration(
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.zero,
//                 focusColor: Colors.transparent,
//               ),
//             ),
//           ),
//           const Icon(Icons.keyboard_arrow_down_rounded),
//         ],
//       ),
//     );
//   }
// }
