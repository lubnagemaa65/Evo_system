// models/evo_system.dart
class EvoSystem {
  final int id;
  final String name;
  final String devices;
  final String description;

  EvoSystem({
    required this.id,
    required this.name,
    required this.devices,
    required this.description,
  });

  // Factory method to create an instance from JSON
  factory EvoSystem.fromJson(Map<String, dynamic> json) {
    return EvoSystem(
      id: json['id'],
      name: json['name'],
      devices: json['devices'],
      description: json['description'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'devices': devices,
      'description': description,
    };
  }
}
