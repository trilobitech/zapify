import 'package:permission_handler/permission_handler.dart';

class HasCallLogAccessPermissionUseCase {
  Future<bool> call() async {
    return await Permission.phone.isGranted;
  }
}
