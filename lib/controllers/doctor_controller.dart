import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/doctor.dart';

class DoctorController extends GetxController {
  var doctors = <Doctor>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDoctors();
  }

  Future<void> loadDoctors() async {
    final String response =
    await rootBundle.loadString('assets/data/doctors.json');
    final List<dynamic> data = jsonDecode(response);
    doctors.value = data.map((json) => Doctor.fromJson(json)).toList();
  }
}
