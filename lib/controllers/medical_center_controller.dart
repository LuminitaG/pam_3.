import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/medical_center.dart';

class MedicalCenterController extends GetxController {
  var medicalCenters = <MedicalCenter>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMedicalCenters();
  }

  Future<void> loadMedicalCenters() async {
    final String response =
    await rootBundle.loadString('assets/data/medical_centers.json');
    final List<dynamic> data = jsonDecode(response);
    medicalCenters.value =
        data.map((json) => MedicalCenter.fromJson(json)).toList();
  }
}
