String adaptConditionId(String id, String icon) {
  int _id = int.parse(id);
  int _icon = int.parse(icon);
  String path = "";
  switch (_id) {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      switch (_icon) {
        case 0:
          path = "lib/images/B0.webp"; //晴day
          break;
        case 30:
          path = "lib/images/B1.webp"; //晴night
          break;
      }
      break;
    case 6:
    case 7:
      switch (_icon) {
        case 0:
          path = "lib/images/B2.webp"; //大部晴朗day
          break;
        case 30:
          path = "lib/images/B3.webp"; //大部晴朗night
          break;
      }
      break;
    case 8:
    case 9:
    case 10:
    case 11:
      switch (_icon) {
        case 1:
          path = "lib/images/B4.webp"; //多云day
          break;
        case 31:
          path = "lib/images/B5.webp"; //多云night
          break;
      }
      break;
    case 12:
      switch (_icon) {
        case 1:
          path = "lib/images/B6.webp"; //少云day
          break;
        case 31:
          path = "lib/images/B7.webp"; //少云night
          break;
      }
      break;
    case 13:
    case 14:
      switch (_icon) {
        case 2:
          path = "lib/images/B8.webp"; //阴day
          break;
        case 2:
          path = "lib/images/B9.webp"; //阴night
          break;
      }
      break;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
      switch (_icon) {
        case 3:
          path = "lib/images/B10.webp"; //阵雨day
          break;
        case 33:
          path = "lib/images/B11.webp"; //阵雨night
          break;
      }
      break;
    case 20:
    case 21:
      switch (_icon) {
        case 3:
          path = "lib/images/B12.webp"; //局部阵雨day
          break;
        case 33:
          path = "lib/images/B13.webp"; //局部阵雨night
          break;
      }
      break;
    case 22:
      switch (_icon) {
        case 3:
          path = "lib/images/B12.webp"; //小阵雨day
          break;
        case 33:
          path = "lib/images/B13.webp"; //小阵雨night
          break;
      }
      break;
    case 23:
      switch (_icon) {
        case 3:
          path = "lib/images/B10.webp"; //强阵雨day
          break;
        case 33:
          path = "lib/images/B11.webp"; //强阵雨night
          break;
      }
      break;
    case 24:
      switch (_icon) {
        case 13:
          path = "lib/images/B14.webp"; //阵雪day
          break;
        case 34:
          path = "lib/images/B15.webp"; //阵雪night
          break;
      }
      break;
    case 25:
      switch (_icon) {
        case 13:
          path = "lib/images/B14.webp"; //小阵雪day
          break;
        case 34:
          path = "lib/images/B15.webp"; //小阵雪night
          break;
      }
      break;
    case 26:
    case 27:
      switch (_icon) {
        case 18:
          path = "lib/images/B16.webp"; //雾day
          break;
        case 32:
          path = "lib/images/B17.webp"; //雾night
          break;
      }
      break;
    case 28:
      switch (_icon) {
        case 18:
          path = "lib/images/B18.webp"; //冻雾day
          break;
        case 32:
          path = "lib/images/B19.webp"; //冻雾night
          break;
      }
      break;
    case 29:
      switch (_icon) {
        case 20:
          path = "lib/images/B20.webp"; //沙尘暴day
          break;
        case 36:
          path = "lib/images/B21.webp"; //沙尘暴night
          break;
      }
      break;
    case 30:
      switch (_icon) {
        case 29:
          path = "lib/images/B22.webp"; //浮尘day
          break;
        case 35:
          path = "lib/images/B23.webp"; //浮尘night
          break;
      }
      break;
    case 31:
      switch (_icon) {
        case 29:
          path = "lib/images/B22.webp"; //尘卷风day
          break;
        case 35:
          path = "lib/images/B23.webp"; //尘卷风night
          break;
      }
      break;
    case 32:
      switch (_icon) {
        case 29:
          path = "lib/images/B22.webp"; //扬沙day
          break;
        case 35:
          path = "lib/images/B23.webp"; //扬沙night
          break;
      }
      break;
    case 33:
      switch (_icon) {
        case 20:
          path = "lib/images/B20.webp"; //强沙尘暴day
          break;
        case 36:
          path = "lib/images/B21.webp"; //强沙尘暴night
          break;
      }
      break;
    case 34:
    case 35:
      switch (_icon) {
        case 45:
          path = "lib/images/B24.webp"; //霾day
          break;
        case 46:
          path = "lib/images/B25.webp"; //霾night
          break;
      }
      break;
    case 36:
      switch (_icon) {
        case 2:
          path = "lib/images/B26.webp"; //阴day
          break;
        case 2:
          path = "lib/images/B27.webp"; //阴night
          break;
      }
      break;
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
      switch (_icon) {
        case 4:
          path = "lib/images/B28.webp"; //"雷阵雨day";
          break;
        case 4:
          path = "lib/images/B29.webp"; //"雷阵雨night";
          break;
      }
      break;
    case 42:
      switch (_icon) {
        case 4:
          path = "lib/images/B30.webp"; //"雷电day";
          break;
        case 4:
          path = "lib/images/B31.webp"; //"雷电night";
          break;
      }
      break;
    case 43:
      switch (_icon) {
        case 4:
          path = "lib/images/B28.webp"; //"雷暴day";
          break;
        case 4:
          path = "lib/images/B29.webp"; //"雷暴night";
          break;
      }
      break;
    case 44:
    case 45:
      switch (_icon) {
        case 5:
          path = "lib/images/B28.webp"; //"雷阵雨伴有冰雹day";
          break;
        case 5:
          path = "lib/images/B29.webp"; //"雷阵雨伴有冰雹night";
          break;
      }
      break;
    case 46:
      switch (_icon) {
        case 5:
          path = "lib/images/B32.webp"; //"冰雹day";
          break;
        case 5:
          path = "lib/images/B33.webp"; //"冰雹night";
          break;
      }
      break;
    case 47:
      switch (_icon) {
        case 5:
          path = "lib/images/B34.webp"; //"冰针day";
          break;
        case 5:
          path = "lib/images/B35.webp"; //"冰针night";
          break;
      }
      break;
    case 48:
      switch (_icon) {
        case 5:
          path = "lib/images/B36.webp"; //"冰粒day";
          break;
        case 5:
          path = "lib/images/B37.webp"; //"冰粒night";
          break;
      }
      break;
    case 49:
    case 50:
    case 48:
      switch (_icon) {
        case 6:
          path = "lib/images/B32.webp"; //"雨夹雪day";
          break;
        case 6:
          path = "lib/images/B34.webp"; //"雨夹雪night";
          break;
      }
      break;
    case 51:
    case 52:
      switch (_icon) {
        case 7:
          path = "lib/images/B12.webp"; //"小雨day";
          break;
        case 7:
          path = "lib/images/B13.webp"; //"小雨night";
          break;
      }
      break;
    case 53:
      switch (_icon) {
        case 8:
          path = "lib/images/B12.webp"; //"中雨day";
          break;
        case 8:
          path = "lib/images/B13.webp"; //"中雨night";
          break;
      }
      break;
    case 54:
      switch (_icon) {
        case 9:
          path = "lib/images/B38.webp"; //"大雨day";
          break;
        case 9:
          path = "lib/images/B39.webp"; //"大雨night";
          break;
      }
      break;
    case 55:
      switch (_icon) {
        case 10:
          path = "lib/images/B40.webp"; //"暴雨day";
          break;
        case 10:
          path = "lib/images/B41.webp"; //"暴雨night";
          break;
      }
      break;
    case 56:
      switch (_icon) {
        case 10:
          path = "lib/images/B42.webp"; //"大暴雨day";
          break;
        case 10:
          path = "lib/images/B43.webp"; //"大暴雨night";
          break;
      }
      break;
    case 57:
      switch (_icon) {
        case 10:
          path = "lib/images/B42.webp"; //"特大暴雨day";
          break;
        case 10:
          path = "lib/images/B43.webp"; //"特大暴雨night";
          break;
      }
      break;
    case 58:
    case 59:
      switch (_icon) {
        case 14:
          path = "lib/images/B14.webp"; //"小雪day";
          break;
        case 14:
          path = "lib/images/B15.webp"; //"小雪night";
          break;
      }
      break;
    case 60:
    case 61:
      switch (_icon) {
        case 15:
          path = "lib/images/B36.webp"; //"中雪day";
          break;
        case 15:
          path = "lib/images/B37.webp"; //"中雪night";
          break;
      }
      break;
    case 62:
      switch (_icon) {
        case 16:
          path = "lib/images/B36.webp"; //"大雪day";
          break;
        case 16:
          path = "lib/images/B37.webp"; //"大雪night";
          break;
      }
      break;
    case 63:
      switch (_icon) {
        case 17:
          path = "lib/images/B36.webp"; //"暴雪day";
          break;
        case 17:
          path = "lib/images/B37.webp"; //"暴雪night";
          break;
      }
      break;
    case 64:
    case 65:
      switch (_icon) {
        case 19:
          path = "lib/images/B32.webp"; //"冻雨day";
          break;
        case 19:
          path = "lib/images/B34.webp"; //"冻雨night";
          break;
      }
      break;
    case 66:
      switch (_icon) {
        case 7:
          path = "lib/images/B12.webp"; //"小雨day";
          break;
        case 7:
          path = "lib/images/B13.webp"; //"小雨night";
          break;
      }
      break;
    case 67:
      switch (_icon) {
        case 8:
          path = "lib/images/B12.webp"; //"中雨day";
          break;
        case 8:
          path = "lib/images/B13.webp"; //"中雨night";
          break;
      }
      break;
    case 68:
      switch (_icon) {
        case 9:
          path = "lib/images/B38.webp"; //"大雨day";
          break;
        case 9:
          path = "lib/images/B39.webp"; //"大雨night";
          break;
      }
      break;
    case 69:
    case 70:
      switch (_icon) {
        case 10:
          path = "lib/images/B42.webp"; //"大暴雨day";
          break;
        case 10:
          path = "lib/images/B43.webp"; //"大暴雨night";
          break;
      }
      break;
    case 71:
    case 72:
    case 73:
      switch (_icon) {
        case 14:
          path = "lib/images/B14.webp"; //"小雪day";
          break;
        case 14:
          path = "lib/images/B15.webp"; //"小雪night";
          break;
      }
      break;
    case 74:
    case 75:
      switch (_icon) {
        case 15:
          path = "lib/images/B36.webp"; //"中雪day";
          break;
        case 15:
          path = "lib/images/B37.webp"; //"中雪night";
          break;
      }
      break;
    case 76:
      switch (_icon) {
        case 16:
          path = "lib/images/B36.webp"; //"大雪day";
          break;
        case 16:
          path = "lib/images/B37.webp"; //"大雪night";
          break;
      }
      break;
    case 77:
      switch (_icon) {
        case 15:
          path = "lib/images/B36.webp"; //"雪day";
          break;
        case 15:
          path = "lib/images/B37.webp"; //"雪night";
          break;
      }
      break;
    case 78:
      switch (_icon) {
        case 8:
          path = "lib/images/B42.webp"; //"雨day";
          break;
        case 8:
          path = "lib/images/B41.webp"; //"雨night";
          break;
      }
      break;
    case 79:
      switch (_icon) {
        case 45:
          path = "lib/images/B24.webp"; //"霾day";
          break;
        case 45:
          path = "lib/images/B25.webp"; //"霾night";
          break;
      }
      break;
    case 80:
    case 81:
    case 82:
      switch (_icon) {
        case 1:
          path = "lib/images/B4.webp"; //"多云day";
          break;
        case 31:
          path = "lib/images/B5.webp"; //"多云night";
          break;
      }
      break;
    case 83:
    case 84:
      switch (_icon) {
        case 18:
          path = "lib/images/B16.webp"; //"雾day";
          break;
        case 32:
          path = "lib/images/B19.webp"; //"雾night";
          break;
      }
      break;
    case 85:
      switch (_icon) {
        case 2:
          path = "lib/images/B26.webp"; //"阴day";
          break;
        case 2:
          path = "lib/images/B227.webp"; //"阴night";
          break;
      }
      break;
    case 86:
      switch (_icon) {
        case 3:
          path = "lib/images/B10.webp"; //"阵雨day";
          break;
        case 33:
          path = "lib/images/B11.webp"; //"阵雨night";
          break;
      }
      break;
    case 87:
    case 88:
    case 89:
    case 90:
      switch (_icon) {
        case 4:
          path = "lib/images/B28.webp"; //"雷阵雨day";
          break;
        case 4:
          path = "lib/images/B29.webp"; //"雷阵雨night";
          break;
      }
      break;
    case 91:
      switch (_icon) {
        case 7:
          path = "lib/images/B42.webp"; //"小到中雨day";
          break;
        case 7:
          path = "lib/images/B41.webp"; //"小到中雨night";
          break;
      }
      break;
    case 92:
      switch (_icon) {
        case 9:
          path = "lib/images/B42.webp"; //"中到大雨day";
          break;
        case 9:
          path = "lib/images/B42.webp"; //"中到大雨night";
          break;
      }
      break;
    case 93:
      switch (_icon) {
        case 10:
          path = "lib/images/B42.webp"; //"大到暴雨day";
          break;
        case 10:
          path = "lib/images/B42.webp"; //"大到暴雨night";
          break;
      }
      break;
    case 94:
      switch (_icon) {
        case 15:
          path = "lib/images/B36.webp"; //"小到中雪day";
          break;
        case 15:
          path = "lib/images/B37.webp"; //"小到中雪night";
          break;
      }
      break;
    default:
  }
  return path;
}
