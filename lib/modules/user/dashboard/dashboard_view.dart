import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_app/core/models/order_model.dart';
import 'package:order_app/core/models/user_model.dart';
import 'package:order_app/core/shared/order_card.dart';
import 'package:order_app/core/state/loader_view.dart';
import 'package:order_app/modules/user/dashboard/dashboard_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DashboardScreen extends StatelessWidget {
  final AppUser? user;

  const DashboardScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
        onViewModelReady: (viewModel) => viewModel.init(),
        viewModelBuilder: () => DashboardViewModel(),
        builder: (context, model, child) => LoaderView(
            loading: model.isBusy,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  "Welcome, ${user?.email}",
                  style: GoogleFonts.comfortaa(
                    decoration: TextDecoration.none,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Orders",
                            style: GoogleFonts.comfortaa(
                              decoration: TextDecoration.none,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => model.gotoOrder(),
                        child: OrderDetailsCard(
                          orderId: "ORD12345",
                          orderDate: DateTime.now(),
                          item: "T-Shirt",
                          quantity: 2,
                          price: 19.99,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
