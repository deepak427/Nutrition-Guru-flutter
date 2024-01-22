import 'package:flutter/material.dart';
import 'package:nutrition_guru/components/my_box_decoration.dart';
import 'package:nutrition_guru/components/progress_indicator.dart';
import 'package:nutrition_guru/models/questions_list.dart';
import 'package:provider/provider.dart';

class DietPlannerPage extends StatefulWidget {
  const DietPlannerPage({super.key});

  @override
  State<DietPlannerPage> createState() => _DietPlannerPageState();
}

class _DietPlannerPageState extends State<DietPlannerPage> {
  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    final questionsList = context.watch<QuestionList>().questionsList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Diet Planner"),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Column(
                children: <Widget>[
                  MyProgressIndicator(
                    totalQuestions: questionsList.length,
                    currentQuestion: questionNumber,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      questionsList[questionNumber].title,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF263746)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: getCustomBoxDecoration(
                        questionsList[questionNumber].selected ==
                            questionsList[questionNumber].options[0]),
                    child: RadioListTile<String>(
                      title: Text(
                        questionsList[questionNumber].options[0],
                        style: TextStyle(
                            color: questionsList[questionNumber].selected ==
                                    questionsList[questionNumber].options[0]
                                ? Colors.orange
                                : Colors.black),
                      ),
                      value: questionsList[questionNumber].options[0],
                      groupValue: questionsList[questionNumber].selected,
                      onChanged: (value) {
                        String nonNullableValue = value ?? "";
                        setState(
                          () {
                            context.read<QuestionList>().changeSelected(
                                nonNullableValue, questionNumber);
                          },
                        );
                      },
                      activeColor: questionsList[questionNumber].selected ==
                              questionsList[questionNumber].options[0]
                          ? Colors.orange
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: getCustomBoxDecoration(
                        questionsList[questionNumber].selected ==
                            questionsList[questionNumber].options[1]),
                    child: RadioListTile<String>(
                      title: Text(
                        questionsList[questionNumber].options[1],
                        style: TextStyle(
                            color: questionsList[questionNumber].selected ==
                                    questionsList[questionNumber].options[1]
                                ? Colors.orange
                                : Colors.black),
                      ),
                      value: questionsList[questionNumber].options[1],
                      groupValue: questionsList[questionNumber].selected,
                      onChanged: (value) {
                        String nonNullableValue = value ?? "";
                        setState(
                          () {
                            context.read<QuestionList>().changeSelected(
                                nonNullableValue, questionNumber);
                          },
                        );
                      },
                      activeColor: questionsList[questionNumber].selected ==
                              questionsList[questionNumber].options[1]
                          ? Colors.orange
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: getCustomBoxDecoration(
                        questionsList[questionNumber].selected ==
                            questionsList[questionNumber].options[2]),
                    child: RadioListTile<String>(
                      title: Text(
                        questionsList[questionNumber].options[2],
                        style: TextStyle(
                            color: questionsList[questionNumber].selected ==
                                    questionsList[questionNumber].options[2]
                                ? Colors.orange
                                : Colors.black),
                      ),
                      value: questionsList[questionNumber].options[2],
                      groupValue: questionsList[questionNumber].selected,
                      onChanged: (value) {
                        String nonNullableValue = value ?? "";
                        setState(
                          () {
                            context.read<QuestionList>().changeSelected(
                                nonNullableValue, questionNumber);
                          },
                        );
                      },
                      activeColor: questionsList[questionNumber].selected ==
                              questionsList[questionNumber].options[2]
                          ? Colors.orange
                          : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: getCustomBoxDecoration(
                        questionsList[questionNumber].selected ==
                            questionsList[questionNumber].other.text),
                    child: RadioListTile<String>(
                      title: TextField(
                        controller: questionsList[questionNumber].other,
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: 'Other',
                        ),
                        cursorColor: Colors.black,
                      ),
                      value: questionsList[questionNumber].other.text,
                      groupValue: questionsList[questionNumber].selected,
                      onChanged: (value) {
                        String nonNullableValue = value ?? "";
                        setState(
                          () {
                            context.read<QuestionList>().changeSelected(
                                nonNullableValue, questionNumber);
                          },
                        );
                      },
                      activeColor: questionsList[questionNumber].selected ==
                              questionsList[questionNumber].other.text
                          ? Colors.orange
                          : Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 8),
                        child: SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (questionNumber != 0) {
                                  questionNumber = questionNumber - 1;
                                }
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 30),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child: const Text('Previous'),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 8),
                        child: SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (questionNumber < questionsList.length - 1) {
                                  questionNumber = questionNumber + 1;
                                } else {
                                  for (var question in questionsList) {
                                    print(question.selected);
                                  }
                                }
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: (questionNumber <
                                      questionsList.length - 1)
                                  ? MaterialStateProperty.all(Colors.orange)
                                  : MaterialStateProperty.all(Colors.purple),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 30),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child: Text(
                                (questionNumber < questionsList.length - 1)
                                    ? "Next"
                                    : "Submit"),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
