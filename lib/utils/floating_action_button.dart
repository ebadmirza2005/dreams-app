import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  State<FloatingActionButtonWidget> createState() => _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState extends State<FloatingActionButtonWidget> with TickerProviderStateMixin{
  int _startIndex = 1;
  final int _totalQuestions = 30;

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 550),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.extended(
              shape: CircleBorder(),
              heroTag: "btn_back",
              onPressed: hasPreviousQuestions ? _loadPreviousQuestions : null,
              backgroundColor: hasPreviousQuestions ? Color(0xff005baa) : Colors.grey.shade400,
              label: const Icon(Icons.arrow_back, color: Colors.white),
            ),
            FloatingActionButton.extended(
              shape: hasMoreQuestions ? CircleBorder() : null,
              heroTag: "btn_next",
              onPressed: _loadNextQuestions,
              backgroundColor: Color(0xff005baa),
              label: hasMoreQuestions
                  ? const Icon(Icons.arrow_forward, color: Colors.white)
                  : const Text('Done', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
