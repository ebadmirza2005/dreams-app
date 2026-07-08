import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/text.dart';
import '../utils/vehicle_form.dart';
import '../utils/vehicle_parts_details.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> with TickerProviderStateMixin{
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => context.go('van-form'),
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff005baa),
                        ),
                        child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  Center(
                    child: TextWidget(text: "Van Inspection Form", textSize: 22),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextWidget(text: "Section 2: Personal Details", textSize: 16)),
                  VehicleForm(),
                  const SizedBox(height: 75),
                ],
              ),
            );
          },
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 550),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                heroTag: "btn_back",
                onPressed: hasPreviousQuestions ? _loadPreviousQuestions : null,
                backgroundColor: hasPreviousQuestions ? Color(0xff005baa) : Colors.grey.shade400,
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              FloatingActionButton(
                heroTag: "btn_next",
                onPressed: _loadNextQuestions,
                backgroundColor: Color(0xff005baa),
                child: hasMoreQuestions
                    ? const Icon(Icons.arrow_forward, color: Colors.white)
                    : const Text(
                  'Done',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
