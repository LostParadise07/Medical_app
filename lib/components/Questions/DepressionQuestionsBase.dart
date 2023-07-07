class PersonalityQuestions {
  static List<Question> questions = [
    Question(
      'Little interest or pleasure in doing things',
      [
        'Not at all',
        'Several days',
        'More than half the days',
        'Nearly every day'
      ],
    ),
    Question(
      'Feeling down, depressed, or hopeless',
      [
        'Not at all',
        'Several days',
        'More than half the days',
        'Nearly every day'
      ],
    ),
    Question(
      'Trouble falling or staying asleep, or sleeping too much',
      [
        'Not at all',
        'Several days',
        'More than half the days',
        'Nearly every day'
      ],
    ),
    Question(
      ' Feeling tired or having little energy',
      [
        'Not at all',
        'Several days',
        'More than half the days',
        'Nearly every day'
      ],
    ),
    Question(
      ' Poor appetite or overeating',
      [
        'Not at all',
        'Several days',
        'More than half the days',
        'Nearly every day'
      ],
    ),
    Question(
      'Feeling bad about yourself or that you are a failure or have let yourself or your family down',
      [
        'Not at all',
        'Several days',
        'More than half the days',
        'Nearly every day'
      ],
    ),
    Question(
      'Trouble concentrating on things, such as reading then newspaper or watching television',
      [
        'Not at all',
        'Several days',
        'More than half the days',
        'Nearly every day'
      ],
    ),
    Question(
      'Moving or speaking so slowly that other people could have noticed. Or the opposite being so figety or restless that you have been moving around a lot more than usual',
      [
        'Not at all',
        'Several days',
        'More than half the days',
        'Nearly every day'
      ],
    ),
    Question(
      'Thoughts that you would be better off dead, or of huting yourself',
      [
        'Not at all',
        'Several days',
        'More than half the days',
        'Nearly every day'
      ],
    ),
    // Add more questions here
  ];
}

class Question {
  final String questionText;
  final List<String> options;

  Question(this.questionText, this.options);
}
