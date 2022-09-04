import 'dart:ui' as ui;
import 'package:get/get.dart';

extension PageStateExtension on PageState {
  bool get isInitial => this == PageState.initial;
  bool get isLoading => this == PageState.loading;
  bool get isLoaded => this == PageState.loaded;
  bool get isError => this == PageState.error;
  bool get isEmpty => this == PageState.empty;
  bool get isPaging => this == PageState.paging;
}

extension RxPageStateExtension on Rx<PageState> {
  bool get isLoading => value == PageState.loading;
  bool get isLoaded => value == PageState.loaded;
  bool get isInitial => value == PageState.initial;
  bool get isError => value == PageState.error;
  bool get isEmpty => value == PageState.empty;
  bool get isPaging => value == PageState.paging;
  PageState initial() => this(PageState.initial);
  PageState loading() => this(PageState.loading);
  PageState loaded() => this(PageState.loaded);
  PageState error() => this(PageState.error);
  PageState empty() => this(PageState.empty);
  PageState paging() => this(PageState.paging);
}


class UtilitiesConstants {
  // static String token = "token";
}

enum PageState { initial, loading, loaded, error, empty, paging }

typedef UiTextDirection = ui.TextDirection;