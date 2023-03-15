class HomeModel {
  int? battery;
  String? image;
  List<String>? qrlist;
  int? speed;
  int? startTimeSecond;
  List<int>? temperature;

  HomeModel(
      {this.battery,
      this.image,
      this.qrlist,
      this.speed,
      this.startTimeSecond,
      this.temperature});

  HomeModel.fromJson(Map<String, dynamic> json) {
    battery = json['battery'];
    image = json['image'];
    qrlist = json['qrlist'].cast<String>();
    speed = json['speed'];
    startTimeSecond = json['startTimeSecond'];
    temperature = json['temperature'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['battery'] = this.battery;
    data['image'] = this.image;
    data['qrlist'] = this.qrlist;
    data['speed'] = this.speed;
    data['startTimeSecond'] = this.startTimeSecond;
    data['temperature'] = this.temperature;
    return data;
  }
}
