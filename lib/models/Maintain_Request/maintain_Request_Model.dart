class MaintenanceRequest {
  final int id;
  final int facilityId;
  final List<int> systemIds;
  final String causeOfMaintenance;

  MaintenanceRequest({
    required this.id,
    required this.facilityId,
    required this.systemIds,
    required this.causeOfMaintenance,
  });

  // Factory method to create a MaintenanceRequest from JSON
  factory MaintenanceRequest.fromJson(Map<String, dynamic> json) {
    return MaintenanceRequest(
      id: json['id'],
      facilityId: json['facilityId'],
      systemIds: List<int>.from(json['systemIds']),
      causeOfMaintenance: json['causeOfMaintenance'],
    );
  }

  // Method to convert a MaintenanceRequest to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'facilityId': facilityId,
      'systemIds': systemIds,
      'causeOfMaintenance': causeOfMaintenance,
    };
  }
}
