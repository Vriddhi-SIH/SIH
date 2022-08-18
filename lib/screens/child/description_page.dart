// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2022/controllers/controllers.dart';
import 'package:sih_2022/controllers/quiz_paper/quiz_papers_controller.dart';
import 'package:sih_2022/models/quiz_paper_model.dart';

class DescriptionPage extends GetView<QuizPaperController> {
  const DescriptionPage({Key? key, required this.model}) : super(key: key);

  final QuizPaperModel model;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ElevatedButton(
          child: Text("Give Test"),
          onPressed: () {
            controller.navigatoQuestions(paper: model);
          },
        ),
      ),
    );
  }
}
