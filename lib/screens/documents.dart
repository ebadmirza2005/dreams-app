import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/button.dart';
import '../utils/floating_action_button.dart';
import '../utils/text.dart';
import '../utils/vehicle_form.dart';
import '../utils/vehicle_parts_details.dart';

class VehicleDocuments extends StatefulWidget {
  const VehicleDocuments({super.key});

  @override
  State<VehicleDocuments> createState() => _VehicleDocumentsState();
}

class _VehicleDocumentsState extends State<VehicleDocuments> with TickerProviderStateMixin{
  late PageController _pageViewController;
  late TabController _tabController;

  int _startIndex = 1;
  final int _totalQuestions = 30;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _loadNextQuestions() {
    if (_startIndex + 10 <= _totalQuestions) {
      setState(() {
        _startIndex += 10;
      });
    } else {
      context.go('/van-form');
    }
  }

  void _loadPreviousQuestions() {
    if (_startIndex - 10 >= 1) {
      setState(() {
        _startIndex -= 10;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool hasMoreQuestions = (_startIndex + 10) <= _totalQuestions;
    bool hasPreviousQuestions = _startIndex > 1;
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButtonWidget(onTap: () => context.go('van-form'),),
                  const SizedBox(height: 10),
                  Center(
                    child: TextWidget(text: "Van Inspection Form", textSize: 22),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextWidget(text: "Section 2: Documents", textSize: 16)),
                  VehicleForm(),
                  const SizedBox(height: 75),
                ],
              ),
            );
          },
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButtonWidget(),
    );
  }
}
