import 'package:permission_handler/permission_handler.dart';

class RequestCallLogPermissionUseCase {
  Future<void> call() async {
    await Permission.phone.request();
  }
}
