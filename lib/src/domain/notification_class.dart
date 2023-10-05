class Notification {
  String title;
  String description;
  String eventDate;
  String schedule;

  Notification({
    required this.title,
    required this.description,
    required this.eventDate,
    required this.schedule,
  });
  Notification.emptyNotification({
    this.title = "",
    this.description = "",
    this.eventDate = "",
    this.schedule = "",
  });

  void setTitle(String title) {
    this.title = title;
  }

  void setDescription(String description) {
    this.description = description;
  }

  void setEventDate(String eventDate) {
    this.eventDate = eventDate;
  }

  void setSchedule(String schedule) {
    this.schedule = schedule;
  }

  String getTitle() => title;
  String getDescription() => description;
  String getEventDate() => eventDate;
  String getSchedule() => schedule;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        title: json["title"],
        description: json["description"],
        eventDate: json["eventDate"],
        schedule: json["schedule"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "eventDate": eventDate,
        "schedule": schedule,
      };
}
