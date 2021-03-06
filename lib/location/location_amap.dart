import 'dart:async';
import 'dart:io';

import 'package:about_weather/location/amap_key.dart';
import 'package:about_weather/location/model/location.dart';
import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';

typedef LocationChange = Function(Location);
typedef PermissionDenied = Function();

class LocationAmap {
  AMapFlutterLocation _locationPlugin = AMapFlutterLocation();

  StreamSubscription<Map<String, Object>>? _locationListener;

  LocationAmap.init(LocationChange locationChange) {
    /// 设置 key
    AMapFlutterLocation.setApiKey(ANDROID_KEY_DEBUG, IOS_KEY_DEBUG);

    /// 注册定位结果监听
    _locationListener = _locationPlugin
        .onLocationChanged()
        .listen((Map<String, Object> result) {
      Location location = Location.fromJson(result);
      locationChange(location);
      if (location.province != null) {
        _stopLocation();
      }
    });

    if (Platform.isIOS) {
      _requestAccuracyAuthorization();
    }

    _setLocationOption();
  }

  /// 开始定位
  void startLocation() {
    _locationPlugin.startLocation();
  }

  /// 停止定位
  void _stopLocation() {
    _locationPlugin.stopLocation();
  }

  ///设置定位参数
  void _setLocationOption() {
    AMapLocationOption locationOption = new AMapLocationOption();

    ///是否单次定位
    locationOption.onceLocation = false;

    ///是否需要返回逆地理信息
    locationOption.needAddress = true;

    ///逆地理信息的语言类型
    locationOption.geoLanguage = GeoLanguage.DEFAULT;

    locationOption.desiredLocationAccuracyAuthorizationMode =
        AMapLocationAccuracyAuthorizationMode.ReduceAccuracy;

    locationOption.fullAccuracyPurposeKey = "AMapLocationScene";

    ///设置Android端连续定位的定位间隔
    locationOption.locationInterval = 60000;

    ///设置Android端的定位模式<br>
    ///可选值：<br>
    ///<li>[AMapLocationMode.Battery_Saving]</li>
    ///<li>[AMapLocationMode.Device_Sensors]</li>
    ///<li>[AMapLocationMode.Hight_Accuracy]</li>
    locationOption.locationMode = AMapLocationMode.Hight_Accuracy;

    ///设置iOS端的定位最小更新距离<br>
    locationOption.distanceFilter = -1;

    ///设置iOS端期望的定位精度
    /// 可选值：<br>
    /// <li>[DesiredAccuracy.Best] 最高精度</li>
    /// <li>[DesiredAccuracy.BestForNavigation] 适用于导航场景的高精度 </li>
    /// <li>[DesiredAccuracy.NearestTenMeters] 10米 </li>
    /// <li>[DesiredAccuracy.Kilometer] 1000米</li>
    /// <li>[DesiredAccuracy.ThreeKilometers] 3000米</li>
    locationOption.desiredAccuracy = DesiredAccuracy.Best;

    ///设置iOS端是否允许系统暂停定位
    locationOption.pausesLocationUpdatesAutomatically = false;

    ///将定位参数设置给定位插件
    _locationPlugin.setLocationOption(locationOption);
  }

  /// 获取iOS native的accuracyAuthorization类型
  void _requestAccuracyAuthorization() async {
    AMapAccuracyAuthorization currentAccuracyAuthorization =
        await _locationPlugin.getSystemAccuracyAuthorization();
    if (currentAccuracyAuthorization ==
        AMapAccuracyAuthorization.AMapAccuracyAuthorizationFullAccuracy) {
    } else if (currentAccuracyAuthorization ==
        AMapAccuracyAuthorization.AMapAccuracyAuthorizationReducedAccuracy) {
    } else {}
  }

  void dispose() {
    /// 移除定位监听
    if (null != _locationListener) {
      _locationListener?.cancel();
    }

    /// 销毁定位
    _locationPlugin.destroy();
  }
}
