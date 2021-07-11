import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  Permission permission;

  // ignore: unused_field
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  PermissionUtil.init({required this.permission}) {
    _listenerForPermissionStatus();
  }

  Future<void> _listenerForPermissionStatus() async {
    _permissionStatus = await permission.status;
  }

  Future<void> requestPermission() async {
    _permissionStatus = await permission.request();
  }

  Future<bool> requestLocationPermission() async {
    var status = await permission.status;
    if (status == PermissionStatus.granted) {
      //已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await permission.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
