

import 'package:meta/meta.dart';
import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
    int cityMpg;
    String welcomeClass;
    int combinationMpg;
    int cylinders;
    double displacement;
    Drive drive;
    FuelType fuelType;
    int highwayMpg;
    Make make;
    String model;
    Transmission transmission;
    int year;

    Welcome({
        required this.cityMpg,
        required this.welcomeClass,
        required this.combinationMpg,
        required this.cylinders,
        required this.displacement,
        required this.drive,
        required this.fuelType,
        required this.highwayMpg,
        required this.make,
        required this.model,
        required this.transmission,
        required this.year,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        cityMpg: json["city_mpg"],
        welcomeClass: json["class"],
        combinationMpg: json["combination_mpg"],
        cylinders: json["cylinders"],
        displacement: json["displacement"]?.toDouble(),
        drive: driveValues.map[json["drive"]]!,
        fuelType: fuelTypeValues.map[json["fuel_type"]]!,
        highwayMpg: json["highway_mpg"],
        make: makeValues.map[json["make"]]!,
        model: json["model"],
        transmission: transmissionValues.map[json["transmission"]]!,
        year: json["year"],
    );

    Map<String, dynamic> toJson() => {
        "city_mpg": cityMpg,
        "class": welcomeClass,
        "combination_mpg": combinationMpg,
        "cylinders": cylinders,
        "displacement": displacement,
        "drive": driveValues.reverse[drive],
        "fuel_type": fuelTypeValues.reverse[fuelType],
        "highway_mpg": highwayMpg,
        "make": makeValues.reverse[make],
        "model": model,
        "transmission": transmissionValues.reverse[transmission],
        "year": year,
    };
}

enum Drive {
    RWD
}

final driveValues = EnumValues({
    "rwd": Drive.RWD
});

enum FuelType {
    DIESEL,
    GAS
}

final fuelTypeValues = EnumValues({
    "diesel": FuelType.DIESEL,
    "gas": FuelType.GAS
});

enum Make {
    MERCEDES_BENZ
}

final makeValues = EnumValues({
    "mercedes-benz": Make.MERCEDES_BENZ
});

enum Transmission {
    A
}

final transmissionValues = EnumValues({
    "a": Transmission.A
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
