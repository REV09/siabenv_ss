class NotificationEvent {
  String title;
  String description;
  String eventDate;
  String schedule;
  bool type;

  NotificationEvent({
    required this.title,
    required this.description,
    required this.eventDate,
    required this.schedule,
    required this.type,
  });
  NotificationEvent.emptyNotificationEvent({
    this.title = "",
    this.description = "",
    this.eventDate = "",
    this.schedule = "",
    this.type = false,
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

  void setType(bool type) {
    this.type = type;
  }

  String getTitle() => title;
  String getDescription() => description;
  String getEventDate() => eventDate;
  String getSchedule() => schedule;
  bool getType() => type;

  factory NotificationEvent.fromJson(Map<String, dynamic> json) =>
      NotificationEvent(
        title: json["title"],
        description: json["description"],
        eventDate: json["eventDate"],
        schedule: json["schedule"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "eventDate": eventDate,
        "schedule": schedule,
      };
}
