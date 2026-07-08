import 'package:flutter/material.dart';

import 'vehicle_parts_details.dart';

class VehicleForm extends StatefulWidget {
  const VehicleForm({super.key});

  @override
  State<VehicleForm> createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  int _startIndex = 1;
  final int _totalQuestions = 30;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                int currentQuestionIndex = _startIndex + index;

                if (currentQuestionIndex > _totalQuestions) {
                  return const SizedBox.shrink();
                }

                return Container(
                  width: double.infinity,
                  color: Colors.white,
                  constraints: const BoxConstraints(minHeight: 55),
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                  child: VehiclePartsDetails(index: currentQuestionIndex),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
