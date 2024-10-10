enum AppStatus {loading, success, failure, offline }

extension AppStatusX on AppStatus {

  bool get isLoading => this == AppStatus.loading;

  bool get isSuccess => this == AppStatus.success;

  bool get isFailure => this == AppStatus.failure;

  bool get isOffline => this == AppStatus.offline;

}

