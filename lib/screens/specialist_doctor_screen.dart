import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/doctor_controller.dart';
import '../controllers/medical_center_controller.dart';
import '../models/medical_center.dart';
import '../models/category.dart';
import '../widgets/doctor_card.dart';

class SpecialistDoctorScreen extends StatelessWidget {
  final DoctorController doctorController = Get.put(DoctorController());
  final MedicalCenterController medicalCenterController =
  Get.put(MedicalCenterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Column(
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.black),
                SizedBox(width: 5),
                Text(
                  "Seattle, USA",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(Icons.person, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                hintText: "Search doctor...",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section
            _buildBanner(),
            SizedBox(height: 20),

            // Categories Section
            _buildCategories(),
            SizedBox(height: 20),

            // Nearby Medical Centers Section
            _buildNearbyMedicalCenters(),
            SizedBox(height: 20),

            // Doctor List Section (dynamic loading)
            _buildDoctorList(),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage('assets/images/1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 16,
            child: Text(
              "Looking for\nSpecialist Doctors?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 16,
            child: Text(
              "Schedule an appointment with our top doctors.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: Text("See All"),
            ),
          ],
        ),
        SizedBox(height: 10),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
          physics: NeverScrollableScrollPhysics(),
          children: categories.map((category) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: category.color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: category.icon != null
                      ? Icon(category.icon, size: 30, color: Colors.white)
                      : Image.asset(
                    category.imagePath!,
                    width: 30,
                    height: 30,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  category.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildNearbyMedicalCenters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nearby Medical Centers",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Obx(() {
          if (medicalCenterController.medicalCenters.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return Container(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: medicalCenterController.medicalCenters.map((center) {
                return _buildMedicalCenterCard(center);
              }).toList(),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildMedicalCenterCard(MedicalCenter center) {
    return Card(
      margin: const EdgeInsets.only(right: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 232,
        height: 180,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  center.imageUrl,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              center.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(center.address),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 14),
                SizedBox(width: 2),
                Text('${center.rating}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorList() {
    return Obx(() {
      if (doctorController.doctors.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }
      return Column(
        children: doctorController.doctors.map((doctor) {
          return DoctorCard(doctor: doctor);
        }).toList(),
      );
    });
  }
}
