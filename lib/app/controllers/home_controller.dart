import 'package:Aura/app/data/enums.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // RxInt _selectedtime = 0.obs;
  // int get selectedTime => _selectedtime.value;

  // RxInt _selectedComparison = 0.obs;
  //   int get selectedSubcategory => _selectedComparison.value;

  // void updateTimeIndex(int index) {
  //   _selectedtime.value = index;
  //   update();
  // }

  // void updateComparisonIndex(int index) {
  //   _selectedComparison.value = index;
  //   update();
  // }

  Rx<Time> _time = Rx<Time>(Time.Week);
  Time get selectedTime => _time.value;

  void updateTime(Time time) {
    _time.value = time;
  }

  Rx<Comparison> _comparison = Rx<Comparison>(Comparison.None);
  Comparison get selectedComparison => _comparison.value;

  void updateComparison(Comparison value) {
    _comparison.value = value;
  }
}
