import 'package:encode_decode/utils/helpers/theme_cache_helper.dart';
import 'package:encode_decode/utils/themes/app_themes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ThemeEvent>((event, emit) async {
      if (event is GetCurrentThemeEvent) {
        bool dark= await ThemeCacheHelper.isCachedThemeDark(); // get theme index from cache

        emit(LoadedThemeState(theme: dark ? AppThemes.darkTheme : AppThemes.lightTheme));
      } else if (event is ThemeChangedEvent) {
        bool dark = ! await ThemeCacheHelper.isCachedThemeDark(); // get theme index from cache
        ThemeCacheHelper.cacheTheme(isDark: dark); // save theme index in cache
        emit(LoadedThemeState(theme: dark ? AppThemes.darkTheme : AppThemes.lightTheme));
      }
    });
  }
}
