import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xtpay/app/widgets/orange_button.dart';
import '../controllers/edit_user_profile_controller.dart';

class EditUserProfileView extends GetView<EditUserProfileController> {
  final EditUserProfileController editUserProfileController = Get.put(EditUserProfileController());
  EditUserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          // Background linear-gradient as requested
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [-0.1483, 0.8855],
            colors: [Color(0xFFFF5D00), Color(0xFFFFFFFF)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _buildProfileHeader(),
                      const SizedBox(height: 30),
                      _buildLabel("First Name"),
                      _buildInputField(editUserProfileController.firstNameController, "Enter first name"),
                      _buildLabel("Phone Number"),
                      _buildInputField(editUserProfileController.phoneController, "Enter phone number"),
                      _buildLabel("D.O.B"),
                      _buildInputField(editUserProfileController.dobController, "dd/mm/yyyy"),
                      const SizedBox(height: 50),
                      OrangeButton(label: "Update",horizontalPadding: 5, onTap:() => editUserProfileController.onUpdateProfile())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1D232E)),
            onPressed: () => Get.back(),
          ),
          const Expanded(
            child: Text(
              "Edit Account Details",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 48), // Balancing width for centered title
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('asserts/images/userprofile user image.png'),
          ),
          ElevatedButton(
            onPressed: editUserProfileController.onChangeProfileImage,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF2F4FA),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            child: const Text(
              "Change",
              style: TextStyle(color: Color(0xFF060C8D), fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF323232)),
      ),
    );
  }

  Widget _buildInputField(TextEditingController textController, String hint) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
