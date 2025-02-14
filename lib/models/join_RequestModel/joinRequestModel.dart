class JoinRequestModel {
  String name;
  String phone;
  String email;
  int numberOfFacilities;
  List<Facility> facilities;

  JoinRequestModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.numberOfFacilities,
    required this.facilities,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
        'numberOfFacilities': numberOfFacilities,
        'facilities': facilities.map((f) => f.toJson()).toList(),
      };
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

  Map<String, dynamic> toJson() => {
        'facilityName': facilityName,
        'systemTypeIds': systemTypeIds,
        'areaId': areaId,
        'locationUrl': locationUrl,
      };
}
