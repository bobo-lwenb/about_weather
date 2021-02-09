import 'dart:async';

import 'package:about_weather/location/model/location.dart';
import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'amap_key.dart';

typedef LocationChange = Function(Location);
typedef PermissionDenied = Function();

class AMapLocation {
  AMapFlutterLocation _location = AMapFlutterLocation();
  StreamSubscription<Map<String, Object>> _locationListener;
  LocationChange locationChange;
  PermissionDenied permissionDenied;

  AMapLocation({
    @required this.locationChange,
    @required this.permissionDenied,
  });

  /// 设置 key
  static void initAMapLocationKey() {
    AMapFlutterLocation.setApiKey(ANDROID_KEY_DEBUG, IOS_KEY_DEBUG);
  }

  /// 动态申请定位权限
  void requestPermission() async {
    _locationListener = _location.onLocationChanged().listen(
      (Map<String, Object> result) {
        Location location = Location.fromJson(result);
        locationChange(location);
        if (location.province != null) {
          stopLocation();
        }
      },
    );
    bool hasLocationPermission = await _requestLocationPermission();
    if (hasLocationPermission) {
      _setLocationOption();
      startLocation();
    } else {
      permissionDenied();
    }
  }

  Future<bool> _requestLocationPermission() async {
    var status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      //已经授权
      return true;
    } else {
      //未授权则发起一次申请
      status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }

  void startLocation() => _location.startLocation();

  void stopLocation() => _location.stopLocation();

  void dispose() {
    if (_locationListener != null) _locationListener.cancel();
    if (_location != null) _location.destroy();
  }

  /// 设置定位参数
  void _setLocationOption() {
    if (_location == null) return;

    AMapLocationOption locationOption = AMapLocationOption();

    locationOption.onceLocation = false; // 是否单次定位
    locationOption.needAddress = true; // 是否需要返回逆地理信息
    locationOption.geoLanguage = GeoLanguage.DEFAULT; // 逆地理信息的语言类型

    /// iOS
    /// iOS 14中设置期望的定位精度权限
    locationOption.desiredLocationAccuracyAuthorizationMode =
        AMapLocationAccuracyAuthorizationMode.ReduceAccuracy;

    /// iOS 14中定位精度权限由模糊定位升级到精确定位时，需要用到的场景key fullAccuracyPurposeKey 这个key要和plist中的配置一样
    locationOption.fullAccuracyPurposeKey = "";

    /// iOS端定位最小更新距离
    locationOption.distanceFilter = -1;

    /// iOS中期望的定位精度
    locationOption.desiredAccuracy = DesiredAccuracy.Best;

    /// iOS端是否允许系统暂停定位
    locationOption.pausesLocationUpdatesAutomatically = false;

    /// iOS end

    /// android
    /// Android端连续定位的间隔
    locationOption.locationInterval = 2000;

    /// Android端定位模式
    locationOption.locationMode = AMapLocationMode.Hight_Accuracy;

    /// android end
    _location.setLocationOption(locationOption);
  }

  /// iOS14 上获取native精度类型
  void requestAccuracyAuthorization() async {
    AMapAccuracyAuthorization currentAccuracyAuthorization =
        await _location.getSystemAccuracyAuthorization();
    if (currentAccuracyAuthorization ==
        AMapAccuracyAuthorization.AMapAccuracyAuthorizationFullAccuracy) {
    } else if (currentAccuracyAuthorization ==
        AMapAccuracyAuthorization.AMapAccuracyAuthorizationReducedAccuracy) {
    } else {}
  }
}
