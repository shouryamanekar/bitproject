class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;
  final double numericValue;

  Answer(this.answerText, this.isCorrect, this.numericValue);
}

List<Question> getQuestion() {
  List<Question> list = [];

  list.add(
    Question(
      "What is your age?",
      [
        Answer("10-13 years", true, 12),
        Answer("14-16 years", true, 15),
        Answer("17-19 years", true, 18),
        Answer("20-29 years", true, 25),
        Answer("30-39 years", true, 35),
        Answer("40+ years", true, 40),
      ],
    ),
  );

  list.add(
    Question(
      "Have you ever had thoughts of harming yourself or others?",
      [
        Answer("0: Never", true, 0),
        Answer("0.25: Rarely", true, 0.25),
        Answer("0.5: Sometimes", true, 0.5),
        Answer("0.75: Often", true, 0.75),
        Answer("1: Always", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "Have you ever attempted to harm yourself or others?",
      [
        Answer("0: Never", true, 0),
        Answer("0.25: Rarely", true, 0.25),
        Answer("0.5: Sometimes", true, 0.5),
        Answer("0.75: Often", true, 0.75),
        Answer("1: Always", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "Have you ever sought help or support for thoughts of self-harm or harm to others? If so, what type of help or support have you received?",
      [
        Answer("0: Never sought help", true, 0),
        Answer("0.25: Talked to a friend or family member", true, 0.25),
        Answer("0.5: Sought professional counseling or therapy", true, 0.5),
        Answer("0.75: Participated in a support group", true, 0.75),
        Answer("1: Received medical treatment", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "Have you ever lost someone who harmed themselves or others?",
      [
        Answer("0: No", true, 0),
        Answer("1: Yes", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "Do you feel comfortable talking about self-harm or harm to others with friends, family members, or mental health professionals?",
      [
        Answer("0: Not at all", true, 0),
        Answer("0.25: Somewhat uncomfortable", true, 0.25),
        Answer("0.5: Neutral", true, 0.5),
        Answer("0.75: Somewhat comfortable", true, 0.75),
        Answer("1: Very comfortable", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "How often do you experience thoughts of self-harm or harm to others?",
      [
        Answer("0: Never", true, 0),
        Answer("0.25: Rarely", true, 0.25),
        Answer("0.5: Sometimes", true, 0.5),
        Answer("0.75: Often", true, 0.75),
        Answer("1: Always", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "Have you experienced any recent life changes or events that may have contributed to your thoughts of self-harm or harm to others?",
      [
        Answer("0: No recent life changes or events", true, 0),
        Answer("0.25: Change in relationship status", true, 0.25),
        Answer("0.5: Job loss or financial difficulty", true, 0.5),
        Answer("0.75: Bereavement or loss of a loved one", true, 0.75),
        Answer("1: Other major life changes or events", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "How has your experience with thoughts of self-harm or harm to others affected your daily life and functioning?",
      [
        Answer("0: No impact", true, 0),
        Answer("0.25: Mild impact", true, 0.25),
        Answer("0.5: Moderate impact", true, 0.5),
        Answer("0.75: Severe impact", true, 0.75),
        Answer("1: Very severe impact", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "Have you ever experienced any stigmatization or discrimination as a result of your thoughts of self-harm or harm to others?",
      [
        Answer("0: No", true, 0),
        Answer("1: Yes", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "How would you rate your access to mental health resources and support for thoughts of self-harm or harm to others?",
      [
        Answer("0: Poor access", true, 0),
        Answer("0.25: Limited access", true, 0.25),
        Answer("0.5: Adequate access", true, 0.5),
        Answer("0.75: Good access", true, 0.75),
        Answer("1: Excellent access", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "Are there any specific triggers that exacerbate your thoughts of self-harm or harm to others?",
      [
        Answer("0: No triggers", true, 0),
        Answer("0.25: Stressful situations", true, 0.25),
        Answer("0.5: Certain people or situations", true, 0.5),
        Answer("0.75: Substance use or abuse", true, 0.75),
        Answer("1: Other specific triggers", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "Gender",
      [
        Answer("0: Prefer not to say", true, 0),
        Answer("0.25: Other", true, 0.25),
        Answer("0.5: Non-Binary", true, 0.5),
        Answer("0.75: Female", true, 0.75),
        Answer("1: Male", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "How satisfied are you with your overall academic performance and progress?",
      [
        Answer("0: No progress", true, 0),
        Answer("0.25: Disappointed", true, 0.25),
        Answer("0.5: Satisfied but could do better", true, 0.5),
        Answer("0.75: Pretty Much Satisfied", true, 0.75),
        Answer("1: Extremely Satisfied", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "How supported do you feel in terms of mentorship and guidance in your academic and career pursuits?",
      [
        Answer("0: No Support", true, 0),
        Answer("0.25: Minimal Support", true, 0.25),
        Answer("0.5: Somewhat supported", true, 0.5),
        Answer("0.75: Supported", true, 0.75),
        Answer("1: Well Supported", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "Are you confident in your ability to achieve your career goals?",
      [
        Answer("0: No", true, 0),
        Answer("1: Yes", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "How would you rate your overall level of stress and emotional well-being in relation to your academic and career journey?",
      [
        Answer("0: Very Stressful", true, 0),
        Answer("0.25: Stressful", true, 0.25),
        Answer("0.5: Somewhat Stressful", true, 0.5),
        Answer("0.75: Less Stressful", true, 0.75),
        Answer("1: No Stress", true, 1),
      ],
    ),
  );

  list.add(
    Question(
      "How fulfilling have your internship experiences been in terms of personal growth and learning?",
      [
        Answer("0: No experience yet", true, 0),
        Answer("0.25: Less Fulfilling", true, 0.25),
        Answer("0.5: Somewhat Fulfilling", true, 0.5),
        Answer("0.75: Pretty Much Fulfilling", true, 0.75),
        Answer("1: Very Fulfilling", true, 1),
      ],
    ),
  );

  return list.sublist(0, 13);
}