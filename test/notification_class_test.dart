import 'package:flutter_test/flutter_test.dart';
import 'package:mibenv/src/domain/notification_class.dart';

void main() {
  test("Prueba de unidad de metodos setTitle y getTitle", () {
    NotificationEvent eventNotification =
        NotificationEvent.emptyNotificationEvent();
    eventNotification.setTitle("Titulo de prueba");
    expect(eventNotification.getTitle(), "Titulo de prueba");
  });

  test("Prueba de unidad de metodos setDescription y getDescription", () {
    NotificationEvent eventNotification =
        NotificationEvent.emptyNotificationEvent();
    eventNotification.setDescription("Descripcion de prueba");
    expect(eventNotification.getDescription(), "Descripcion de prueba");
  });

  test("Prueba de unidad de metodos setEventDate y getEventDate", () {
    NotificationEvent eventNotification =
        NotificationEvent.emptyNotificationEvent();
    eventNotification.setEventDate("28 de octubre de 2023");
    expect(eventNotification.getEventDate(), "28 de octubre de 2023");
  });

  test("Prueba de unidad de metodos setSchedule y getSchedule", () {
    NotificationEvent eventNotification =
        NotificationEvent.emptyNotificationEvent();
    eventNotification.setSchedule("12:00 - 16:00");
    expect(eventNotification.getSchedule(), "12:00 - 16:00");
  });

  test("Prueba de unidad del metodo fromJson", () {
    Map<String, String> jsonEvent = {
      "title": "Titulo de prueba",
      "description": "Descripcion de prueba",
      "eventDate": "28 de octubre de 2023",
      "schedule": "12:00 - 16:00",
    };
    List<bool> validations = List.empty(growable: true);
    NotificationEvent eventNotification = NotificationEvent.fromJson(jsonEvent);
    validations
        .add(eventNotification.getTitle() == "Titulo de prueba" ? true : false);
    validations.add(
      eventNotification.getDescription() == "Descripcion de prueba"
          ? true
          : false,
    );
    validations.add(
      eventNotification.getEventDate() == "28 de octubre de 2023"
          ? true
          : false,
    );
    validations
        .add(eventNotification.getSchedule() == "12:00 - 16:00" ? true : false);
    bool finalValidation = false;
    for (var validation in validations) {
      if (validation == false) {
        finalValidation = false;
        break;
      } else {
        finalValidation = true;
      }
    }
    expect(finalValidation, true);
  });

  test("Prueba de unidad del metodo toJson", () {
    NotificationEvent eventNotification = NotificationEvent(
        title: "Titulo de prueba",
        description: "Descripcion de prueba",
        eventDate: "28 de octubre de 2023",
        schedule: "12:00 - 16:00",
        type: true);
    Map<String, dynamic> jsonEvent = eventNotification.toJson();
    bool validateJson = false;
    if (jsonEvent["title"] == "Titulo de prueba" &&
        jsonEvent["description"] == "Descripcion de prueba" &&
        jsonEvent["eventDate"] == "28 de octubre de 2023" &&
        jsonEvent["schedule"] == "12:00 - 16:00") {
      validateJson = true;
    }
    expect(validateJson, true);
  });
}
