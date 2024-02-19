import 'dart:math';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mibenv/src/domain/notification_class.dart';

class ServiceRestNotification {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  Future<List<NotificationEvent>> getNotificationsDay() async {
    bool test = Random().nextBool();
    List<NotificationEvent> notificationsList = List.empty(growable: true);
    for (var i = 0; i < 5; i++) {
      String information =
          "Descripcion de prueba de informacion para la tarjeta "
          " de notificaciones sobre eventos y avisos de la BENV de manera"
          " extendida la idea es que la descripcion sea tan largan que no se pueda"
          " visualizar de manera completa en la tarjeta tradicional de avisos y "
          " en teoria esto ya deberia ser suficiente para poder ajustarlo a la"
          " tarjeta y que no se pueda visualizar completo";
      String title = "Evento de prueba";
      String eventDate = "28 de octubre de 2023";
      String scheduleEvent = "14:00-17:00";
      bool typeEvent = Random().nextBool();

      Map<String, dynamic> jsonEvent = {
        "title": title,
        "description": information,
        "eventDate": eventDate,
        "schedule": scheduleEvent,
        "type": typeEvent
      };
      notificationsList.add(NotificationEvent.fromJson(jsonEvent));
    }
    if (test) {
      return notificationsList;
    } else {
      notificationsList.clear();
      return notificationsList;
    }
  }
}
