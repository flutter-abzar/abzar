import 'package:get/get.dart';

extension PageStateExtension on PageState {
  bool isInitial() => this == PageState.initial;

  bool isLoading() => this == PageState.loading;

  bool isLoaded() => this == PageState.loaded;

  bool isError() => this == PageState.error;

  bool isPaging() => this == PageState.paging;
}

extension RxPageStateExtension on Rx<PageState> {
  bool isLoading() => value == PageState.loading;

  bool isLoaded() => value == PageState.loaded;

  bool isInitial() => value == PageState.initial;

  bool isError() => value == PageState.error;

  bool isPaging() => value == PageState.paging;

  PageState initial() => this(PageState.initial);

  PageState loading() => this(PageState.loading);

  PageState loaded() => this(PageState.loaded);

  PageState error() => this(PageState.error);

  PageState paging() => this(PageState.paging);
}

enum PageState { initial, loading, loaded, error, empty, paging }
