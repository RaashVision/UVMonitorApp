class OpenUVApiResult {
  Result result;

  OpenUVApiResult({this.result});

  OpenUVApiResult.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  double uv;
  String uvTime;
  double uvMax;
  String uvMaxTime;
  double ozone;
  String ozoneTime;
 // SafeExposureTime safeExposureTime;
 // SunInfo sunInfo;

  Result(
      {this.uv,
      this.uvTime,
      this.uvMax,
      this.uvMaxTime,
      this.ozone,
      this.ozoneTime,
      //this.safeExposureTime,
     // this.sunInfo
      });

  Result.fromJson(Map<String, dynamic> json) {
    uv = json['uv'] == 0 ?0.0 :json['uv'];
    uvTime = json['uv_time'];
    uvMax = json['uv_max'];
    uvMaxTime = json['uv_max_time'];
    ozone = json['ozone'];
    ozoneTime = json['ozone_time'];
    // safeExposureTime = json['safe_exposure_time'] != null
    //     ? new SafeExposureTime.fromJson(json['safe_exposure_time'])
    //     : null;
    // sunInfo = json['sun_info'] != null
    //     ? new SunInfo.fromJson(json['sun_info'])
    //     : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uv'] = this.uv;
    data['uv_time'] = this.uvTime;
    data['uv_max'] = this.uvMax;
    data['uv_max_time'] = this.uvMaxTime;
    data['ozone'] = this.ozone;
    data['ozone_time'] = this.ozoneTime;
    // if (this.safeExposureTime != null) {
    //   data['safe_exposure_time'] = this.safeExposureTime.toJson();
    // }
    // if (this.sunInfo != null) {
    //   data['sun_info'] = this.sunInfo.toJson();
    // }
    return data;
  }
}

class SafeExposureTime {
  int st1;
  int st2;
  int st3;
  int st4;
  int st5;
  int st6;

  SafeExposureTime(
      {this.st1, this.st2, this.st3, this.st4, this.st5, this.st6});

  SafeExposureTime.fromJson(Map<String, dynamic> json) {
    st1 = json['st1'];
    st2 = json['st2'];
    st3 = json['st3'];
    st4 = json['st4'];
    st5 = json['st5'];
    st6 = json['st6'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['st1'] = this.st1;
    data['st2'] = this.st2;
    data['st3'] = this.st3;
    data['st4'] = this.st4;
    data['st5'] = this.st5;
    data['st6'] = this.st6;
    return data;
  }
}

class SunInfo {
  SunTimes sunTimes;
  SunPosition sunPosition;

  SunInfo({this.sunTimes, this.sunPosition});

  SunInfo.fromJson(Map<String, dynamic> json) {
    sunTimes = json['sun_times'] != null
        ? new SunTimes.fromJson(json['sun_times'])
        : null;
    sunPosition = json['sun_position'] != null
        ? new SunPosition.fromJson(json['sun_position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sunTimes != null) {
      data['sun_times'] = this.sunTimes.toJson();
    }
    if (this.sunPosition != null) {
      data['sun_position'] = this.sunPosition.toJson();
    }
    return data;
  }
}

class SunTimes {
  String solarNoon;
  String nadir;
  String sunrise;
  String sunset;
  String sunriseEnd;
  String sunsetStart;
  String dawn;
  String dusk;
  String nauticalDawn;
  String nauticalDusk;
  String nightEnd;
  String night;
  String goldenHourEnd;
  String goldenHour;

  SunTimes(
      {this.solarNoon,
      this.nadir,
      this.sunrise,
      this.sunset,
      this.sunriseEnd,
      this.sunsetStart,
      this.dawn,
      this.dusk,
      this.nauticalDawn,
      this.nauticalDusk,
      this.nightEnd,
      this.night,
      this.goldenHourEnd,
      this.goldenHour});

  SunTimes.fromJson(Map<String, dynamic> json) {
    solarNoon = json['solarNoon'];
    nadir = json['nadir'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    sunriseEnd = json['sunriseEnd'];
    sunsetStart = json['sunsetStart'];
    dawn = json['dawn'];
    dusk = json['dusk'];
    nauticalDawn = json['nauticalDawn'];
    nauticalDusk = json['nauticalDusk'];
    nightEnd = json['nightEnd'];
    night = json['night'];
    goldenHourEnd = json['goldenHourEnd'];
    goldenHour = json['goldenHour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['solarNoon'] = this.solarNoon;
    data['nadir'] = this.nadir;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['sunriseEnd'] = this.sunriseEnd;
    data['sunsetStart'] = this.sunsetStart;
    data['dawn'] = this.dawn;
    data['dusk'] = this.dusk;
    data['nauticalDawn'] = this.nauticalDawn;
    data['nauticalDusk'] = this.nauticalDusk;
    data['nightEnd'] = this.nightEnd;
    data['night'] = this.night;
    data['goldenHourEnd'] = this.goldenHourEnd;
    data['goldenHour'] = this.goldenHour;
    return data;
  }
}

class SunPosition {
  double azimuth;
  double altitude;

  SunPosition({this.azimuth, this.altitude});

  SunPosition.fromJson(Map<String, dynamic> json) {
    azimuth = json['azimuth'];
    altitude = json['altitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['azimuth'] = this.azimuth;
    data['altitude'] = this.altitude;
    return data;
  }
}