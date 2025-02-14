class UserModel {
  String? name;
  // int id;
  String? phone;
  String? email;
  int? numberOfFacilities;
  List<Facility>? facilities;

  UserModel({
    required this.name,
    //  required this.id,
    required this.phone,
    required this.email,
    required this.numberOfFacilities,
    required this.facilities,
  });

  // Convert JSON to User object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      // id: json['id'],

      facilities: (json['facilities'] as List)
          .map((facility) => Facility.fromJson(facility))
          .toList(),
      numberOfFacilities: json['numberOfFacilities'],
    );
  }

  // Convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'numberoffacilities': numberOfFacilities,
      'facilities': facilities!.map((facility) => facility.toJson()).toList(),
    };
  }
}

class Facility {
  String facilityName;
  List<int> systemTypeIds;
  int areaId;
  String locationUrl;

  Facility({
    required this.facilityName,
    required this.systemTypeIds,
    required this.areaId,
    required this.locationUrl,
  });

  // Convert JSON to Facility object
  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      facilityName: json['facilityName'],
      systemTypeIds: List<int>.from(json['systemTypeIds']),
      areaId: json['areaId'],
      locationUrl: json['locationUrl'],
    );
  }

  // Convert Facility object to JSON
  Map<String, dynamic> toJson() {
    return {
      'facilityName': facilityName,
      'systemTypeIds': systemTypeIds,
      'areaId': areaId,
      'locationUrl': locationUrl,
    };
  }
}
