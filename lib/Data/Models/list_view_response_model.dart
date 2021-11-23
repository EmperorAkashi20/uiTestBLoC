import 'dart:convert';

AirConditionerResponseModel airConditionerResponseModelFromJson(String str) =>
    AirConditionerResponseModel.fromJson(json.decode(str));

String airConditionerResponseModelToJson(AirConditionerResponseModel data) =>
    json.encode(data.toJson());

class AirConditionerResponseModel {
  AirConditionerResponseModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory AirConditionerResponseModel.fromJson(Map<String, dynamic> json) =>
      AirConditionerResponseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.categoryName,
    this.description,
    this.imageUrl,
    this.services,
  });

  String? categoryName;
  String? description;
  String? imageUrl;
  List<Service>? services;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categoryName: json["category_name"],
        description: json["description"],
        imageUrl: json["image_url"],
        services: List<Service>.from(
            json["services"].map((x) => Service.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "description": description,
        "image_url": imageUrl,
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
      };
}

class Service {
  Service({
    this.serviceName,
    this.rate,
    this.description,
    this.imageUrl,
  });

  String? serviceName;
  int? rate;
  String? description;
  String? imageUrl;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceName: json["service_name"],
        rate: json["rate"],
        description: json["description"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "service_name": serviceName,
        "rate": rate,
        "description": description,
        "image_url": imageUrl,
      };
}
