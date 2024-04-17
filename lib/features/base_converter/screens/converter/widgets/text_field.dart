// import 'package:encode_decode/features/base_converter/logic/cubit/base_converter_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CTextField extends StatelessWidget {
//   const CTextField({super.key, required this.label, required this.controllerIndex});
//   final String label;
//   final int controllerIndex;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       keyboardType: TextInputType.none, //hiding the keyboard
//       controller: context.read<BaseConverterCubit>().textControllers[controllerIndex],
//       onTap: (){
//         context.read<BaseConverterCubit>().changeActiveController(controllerIndex);
//       },
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30)
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Theme.of(context).primaryColor),
//           borderRadius: BorderRadius.circular(30)
//         ),
//         floatingLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 25),
//         label: Text(label),
//       ),
//     );
//   }
// }
