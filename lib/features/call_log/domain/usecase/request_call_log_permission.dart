import 'package:permission_handler/permission_handler.dart';

class RequestCallLogPermissionUseCase {
  Future<void> call() async {
    final status = await Permission.phone.status;
    if (status.isPermanentlyDenied) {
      await openAppSettings();
    } else if (!status.isGranted) {
      await Permission.phone.request();
    }
  }
}
