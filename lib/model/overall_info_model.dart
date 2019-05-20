class OverallInfoEntity {
	List<OverallInfoInfo> info;

	OverallInfoEntity({this.info});

	OverallInfoEntity.fromJson(Map<String, dynamic> json) {
		if (json['info'] != null) {
			info = new List<OverallInfoInfo>();
			(json['info'] as List).forEach((v) { info.add(new OverallInfoInfo.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.info != null) {
      data['info'] = this.info.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class OverallInfoInfo {
	String name;
	int index;
	List<OverallInfoInfoDevice> device;

	OverallInfoInfo({this.name, this.index, this.device});

	OverallInfoInfo.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		index = json['index'];
		if (json['device'] != null) {
			device = new List<OverallInfoInfoDevice>();
			(json['device'] as List).forEach((v) { device.add(new OverallInfoInfoDevice.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['index'] = this.index;
		if (this.device != null) {
      data['device'] = this.device.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class OverallInfoInfoDevice {
	String name;
	int dim;
	int state;
	String type;
	int id;
	int power;
	int speed;
	int mode;
// ignore: non_constant_identifier_names
	int set_temp;
// ignore: non_constant_identifier_names
	int room_temp;

// ignore: non_constant_identifier_names
	OverallInfoInfoDevice({this.name, this.dim, this.state, this.type,this.id,this.mode,this.power,this.room_temp,this.set_temp,this.speed});

	OverallInfoInfoDevice.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		dim = json['dim'];
		state = json['state'];
		type = json['type'];
		id = json['id'];
		power=json['power'];
    speed=json['speed'];
    mode=json['mode'];
    set_temp=json['set_temp'];
    room_temp=json['room_temp'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['dim'] = this.dim;
		data['state'] = this.state;
		data['type'] = this.type;
		data['power'] = this.power;
    data['speed'] = this.speed;
    data['mode'] = this.mode;
    data['set_temp'] = this.set_temp;
    data['room_temp'] = this.room_temp;
    data['id'] = this.id;

		return data;
	}
}
