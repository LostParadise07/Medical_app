import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:mentalapp/components/Questions/DepressionQuestionsBase.dart';

class DepressionQuestionWidget extends StatefulWidget {
  @override
  _DepressionQuestionWidgetState createState() =>
      _DepressionQuestionWidgetState();
}

class _DepressionQuestionWidgetState extends State<DepressionQuestionWidget> {
  List<bool> selectedOptions = List<bool>.filled(6, false);
  int currentQuestionIndex = 0;
  EmojiParser emojiParser = EmojiParser();

  @override
  Widget build(BuildContext context) {
    final question = PersonalityQuestions.questions[currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 93, 116, 231),
      appBar: AppBar(
        title: const Text('PHQ Test'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 5.0,
                    right: 10.0,
                    child: Container(
                      width: 70.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 232, 146, 146),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: LinearProgressIndicator(
                        value: (currentQuestionIndex + 1) /
                            PersonalityQuestions.questions.length,
                        backgroundColor: Colors.transparent,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 82, 107, 228)),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        question.questionText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: question.options.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOptions = List<bool>.filled(
                                    question.options.length, false);
                                selectedOptions[index] = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedOptions[index]
                                    ? Colors.green
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    emojiParser.emojify(getEmoji(index)),
                                    style: const TextStyle(fontSize: 30),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(question.options[index],
                                      style: const TextStyle(fontSize: 14),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 93, 116, 231),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (currentQuestionIndex > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentQuestionIndex--;
                      });
                    },
                    child: const Text('Prev'),
                  ),
                if (currentQuestionIndex <
                    PersonalityQuestions.questions.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentQuestionIndex++;
                        selectedOptions =
                            List<bool>.filled(question.options.length, false);
                      });
                    },
                    child: const Text('Next'),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  String getEmoji(int index) {
    switch (index) {
      case 0:
        return ':smile:';
      case 1:
        return '\u{1F622}';
      case 2:
        return '\u{1F625}';
      case 3:
        return ':sob:';
      case 4:
        return ':angry:';
      default:
        return '';
    }
  }
}
