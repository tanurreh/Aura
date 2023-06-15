import 'package:Aura/app/data/enums.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  Rx<Notifications> _notification = Rx<Notifications>(Notifications.All);
  Notifications get selectedNotifications => _notification.value;

  void updateSelectedNotification(Notifications value) {
    _notification.value = value;
  }
}
