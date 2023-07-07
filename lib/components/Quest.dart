import 'package:flutter/material.dart';
import 'homepage.dart';

class Question {
  final String questionText;
  final List<String> options;

  Question({required this.questionText, required this.options});
}

class Questpage extends StatefulWidget {
  const Questpage({Key? key}) : super(key: key);

  @override
  _QuestpageState createState() => _QuestpageState();
}

class _QuestpageState extends State<Questpage> {
  bool nav = true;
  bool showQuestions = false;
  bool showLimitedQuestions = false;
  int currentQuestionIndex = 0;
  int? selectedOptionIndex;
  int questionsAnswered = 0;

  @override
  void initState() {
    super.initState();
    _showContinueDialog();
  }

  void _showContinueDialog() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Continue in 3 days?'),
            content: Text('Do you want to continue this screen in 3 days?'),
            actions: [
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    showQuestions = true;
                    showLimitedQuestions = false;
                  });
                },
              ),
              TextButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    showLimitedQuestions = true;
                    showLimitedQuestions = true;
                  });
                },
              ),
            ],
          );
        },
      );
    });
  }

  List<Question> questions = [
    Question(
      questionText: 'Question 1',
      options: [
        'I do not feel sad.',
        'I feel sad',
        'I am sad all the time and I can not snap out of it.',
        'I am so sad and unhappy that I can not stand it',
      ],
    ),
    Question(
      questionText: 'Question 2',
      options: [
        'I am not particularly discouraged about the future.',
        'I feel discouraged about the future.',
        'I feel I have nothing to look forward to.',
        'I feel the future is hopeless and that things cannot improve.',
      ],
    ),
    Question(
      questionText: 'Question 3',
      options: [
        'I do not feel like a failure.',
        'I feel I have failed more than the average person.',
        'As I look back on my life, all I can see is a lot of failures.',
        'I feel I am a complete failure as a person.',
      ],
    ),
    Question(
      questionText: 'Question 4',
      options: [
        'I get as much satisfaction out of things as I used to.',
        'I don\'t enjoy things the way I used to.',
        'I don\'t get real satisfaction out of anything anymore.',
        'I am dissatisfied or bored with everything.',
      ],
    ),
    Question(
      questionText: 'Question 5',
      options: [
        'I don\'t feel particularly guilty',
        'I feel guilty a good part of the time.',
        'I feel quite guilty most of the time.',
        'I feel guilty all of the time.',
      ],
    ),
    Question(
      questionText: 'Question 6',
      options: [
        'I don\'t feel I am being punished.',
        'I feel I may be punished.',
        'I expect to be punished.',
        'I feel I am being punished.',
      ],
    ),
    Question(
      questionText: 'Question 7',
      options: [
        'I don\'t feel disappointed in myself.',
        'I am disappointed in myself.',
        'I am disgusted with myself.',
        'I hate myself.',
      ],
    ),
    Question(
      questionText: 'Question 8',
      options: [
        'I don\'t feel I am any worse than anybody else.',
        'I am critical of myself for my weaknesses or mistakes.',
        'I blame myself all the time for my faults.',
        'I blame myself for everything bad that happens.',
      ],
    ),
    Question(
      questionText: 'Question 9',
      options: [
        'I don\'t have any thoughts of killing myself.',
        'I have thoughts of killing myself, but I would not carry them out.',
        'I would like to kill myself.',
        'I would kill myself if I had the chance.',
      ],
    ),
    Question(
      questionText: 'Question 10',
      options: [
        'I don\'t cry any more than usual.',
        'I cry more now than I used to.',
        'I cry all the time now.',
        'I used to be able to cry, but now I can\'t cry even though I want to.',
      ],
    ),
    Question(
      questionText: 'Question 11',
      options: [
        'I am no more irritated by things than I ever was.',
        'I am slightly more irritated now than usual.',
        'I am quite annoyed or irritated a good deal of the time.',
        'I feel irritated all the time.',
      ],
    ),
    Question(
      questionText: 'Question 12',
      options: [
        'I have not lost interest in other people.',
        'I am less interested in other people than I used to be.',
        'I have lost most of my interest in other people.',
        'I have lost all of my interest in other people.',
      ],
    ),
    Question(
      questionText: 'Question 13',
      options: [
        'I make decisions about as well as I ever could.',
        'I put off making decisions more than I used to.',
        'I have greater difficulty in making decisions more than I used to.',
        'I can\'t make decisions at all anymore.',
      ],
    ),
    Question(
      questionText: 'Question 14',
      options: [
        'I don\'t feel that I look any worse than I used to.',
        'I am worried that I am looking old or unattractive.',
        'I feel there are permanent changes in my appearance that make me look unattractive.',
        'I believe that I look ugly.',
      ],
    ),
    Question(
      questionText: 'Question 15',
      options: [
        'I can work about as well as before.',
        'It takes an extra effort to get started at doing something.',
        'I have to push myself very hard to do anything.',
        'I can\'t do any work at all.',
      ],
    ),
    Question(
      questionText: 'Question 16',
      options: [
        'I can sleep as well as usual.',
        'I don\'t sleep as well as I used to.',
        'I wake up 1-2 hours earlier than usual and find it hard to get back to sleep.',
        'I wake up several hours earlier than I used to and cannot get back to sleep.',
      ],
    ),
    Question(
      questionText: 'Question 17',
      options: [
        'I don\'t get more tired than usual.',
        'I get tired more easily than I used to.',
        'I get tired from doing almost anything.',
        'I am too tired to do anything.',
      ],
    ),
    Question(
      questionText: 'Question 18',
      options: [
        'My appetite is no worse than usual.',
        'My appetite is not as good as it used to be.',
        'My appetite is much worse now.',
        'I have no appetite at all anymore.',
      ],
    ),
    Question(
      questionText: 'Question 19',
      options: [
        'I haven\'t lost much weight, if any, lately.',
        'I have lost more than five pounds.',
        'I have lost more than ten pounds.',
        'I have lost more than fifteen pounds.',
      ],
    ),
    Question(
      questionText: 'Question 20',
      options: [
        'I am no more worried about my health than usual.',
        'I am worried about physical problems like aches, pains, upset stomach, or constipation.',
        'I am very worried about physical problems and it\'s hard to think of much else.',
        'I am so worried about my physical problems that I cannot think of anything else.',
      ],
    ),
    Question(
      questionText: 'Question 21',
      options: [
        'I have not noticed any recent change in my interest in sex.',
        'I am less interested in sex than I used to be.',
        'I have almost no interest in sex.',
        'I have lost interest in sex completely.',
      ],
    ),
  ];

  void nextQuestion() {
    if (selectedOptionIndex != null) {
      setState(() {
        questionsAnswered++;
        if (currentQuestionIndex < questions.length - 1) {
          currentQuestionIndex++;
          selectedOptionIndex = null;
        } else {
          // All questions have been answered
          // Perform any necessary actions or navigate to a new screen
          _showSummaryDialog();
        }
      });
    }
  }

  void _showSummaryDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quiz Summary'),
          content: Text(
              'You have answered $questionsAnswered out of ${questions.length} questions.'),
          actions: [
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                // Add your logic to submit the answers
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 109, 210, 237),
      appBar: nav
          ? AppBar(
              backgroundColor: const Color.fromARGB(255, 72, 72, 72),
              shadowColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    // handle favorite functionality
                  },
                ),
                PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Option 1'),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text('Option 2'),
                    ),
                    const PopupMenuItem(
                      value: 3,
                      child: Text('Option 3'),
                    ),
                    const PopupMenuItem(
                      value: 3,
                      child: Text('Option 4'),
                    ),
                  ],
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 25,
                  ),
                  onSelected: (value) {
                    // Handle selection of menu options here
                  },
                ),
              ],
            )
          : AppBar(
              backgroundColor: const Color.fromARGB(255, 72, 72, 72),
              shadowColor: Colors.transparent,
              leading: Container(),
            ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            setState(() {
              nav = !nav;
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.89,
            child: showQuestions
                ? Column(
                    children: [
                      Text(
                        questions[currentQuestionIndex].questionText,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: showLimitedQuestions
                            ? 7
                            : questions[currentQuestionIndex].options.length,
                        itemBuilder: (context, index) {
                          return RadioListTile(
                            title: Text(
                                questions[currentQuestionIndex].options[index]),
                            value: index,
                            groupValue: selectedOptionIndex,
                            onChanged: (value) {},
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        child: Text(currentQuestionIndex == questions.length - 1
                            ? 'Submit'
                            : 'Next Question'),
                        onPressed: () {
                          nextQuestion();
                        },
                      ),
                    ],
                  )
                : Container(),
          ),
        ),
      ),
    );
  }
}
