class AppInfo {
  final String version;
  final String installTimeStamp;
  final String uninstallTimeStamp;
  final String downloadTimeStamp;

  AppInfo({
    required this.version,
    required this.installTimeStamp,
    required this.uninstallTimeStamp,
    required this.downloadTimeStamp,
});

  Map<String, dynamic> toJson() =>{
    'version': version,
    'installTimeStamp': installTimeStamp,
    'uninstallTimeStamp': uninstallTimeStamp,
    'downloadTimeStamp': downloadTimeStamp,
  };

}