import 'package:encode_decode/features/codec/logic/cody_cubit.dart';
import 'package:encode_decode/features/encryptor/logic/encryptor_cubit.dart';
import 'package:encode_decode/navigation_menu.dart';
import 'package:encode_decode/utils/themes/theming_logic/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/barcode/logic/barcode_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()..add(GetCurrentThemeEvent())),
        BlocProvider(create: (context) => CodyCubit()),
        BlocProvider(create: (context) => BarcodeCubit()),
        BlocProvider(create: (context) => EncryptorCubit()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is LoadedThemeState) {
            return MaterialApp(
              title: 'Cody',
              debugShowCheckedModeBanner: false,
              theme: state.theme,
              home: const NavigationMenu(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
