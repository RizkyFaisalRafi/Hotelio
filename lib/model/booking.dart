class Booking {
  String id;
  String idHotel;
  String cover;
  List<String> name;
  String location;
  String date;
  int guest;
  String breakfast;
  String checkInTime;
  int night;
  int serviceFee;
  int activities;
  int totalPayment;
  String status;
  bool isDone;

  Booking({
    required this.id,
    required this.idHotel,
    required this.cover,
    required this.name,
    required this.location,
    required this.date,
    required this.guest,
    required this.breakfast,
    required this.checkInTime,
    required this.night,
    required this.serviceFee,
    required this.activities,
    required this.totalPayment,
    required this.status,
    required this.isDone,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        idHotel: json["id_hotel"],
        cover: json["cover"],
        name: List<String>.from(json["name"].map((x) => x)),
        location: json["location"],
        date: json["date"],
        guest: json["guest"],
        breakfast: json["breakfast"],
        checkInTime: json["check_in_time"],
        night: json["night"],
        serviceFee: json["service_fee"],
        activities: json["activities"],
        totalPayment: json["total_payment"],
        status: json["status"],
        isDone: json["is_done"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_hotel": idHotel,
        "cover": cover,
        "name": List<dynamic>.from(name.map((x) => x)),
        "location": location,
        "date": date,
        "guest": guest,
        "breakfast": breakfast,
        "check_in_time": checkInTime,
        "night": night,
        "service_fee": serviceFee,
        "activities": activities,
        "total_payment": totalPayment,
        "status": status,
        "is_done": isDone,
      };
}
