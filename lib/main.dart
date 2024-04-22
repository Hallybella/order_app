import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:order_app/app/app.locator.dart';
import 'package:order_app/core/controllers/state_controller.dart';
import 'package:order_app/order_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeState();
  runApp(const OrderApp());
}

initializeState() async {
  await setupLocator();
  Get.put(StateController());
  await ScreenUtil.ensureScreenSize();
}
