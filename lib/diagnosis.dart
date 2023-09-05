import 'package:flutter/material.dart';
import 'package:bitproject/questions.dart';
import 'package:bitproject/ml_model_integration.dart';

class Diagnosis extends StatefulWidget {
  @override
  State<Diagnosis> createState() => _DiagnosisState();
}

class _DiagnosisState extends State<Diagnosis> {
  List<Question> questionList = getQuestion();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;
  List<double> mlModelOutput = [];

  @override
  void initState() {
    super.initState();
    MLModelIntegration.loadModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "BIT-FIT Mental Diagnosis",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            _questionWidget(),
            _answerList(),
            _nextButton(),
          ],
        ),
      ),
    );
  }

  Widget _questionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: const TextStyle(
            color: Colors.teal,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: const TextStyle(
              color: Colors.teal,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
      )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = selectedAnswer == answer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        child: Text(answer.answerText),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: isSelected ? Colors.green : Colors.white,
          foregroundColor: Colors.black,
        ),
        onPressed: () {
          if (selectedAnswer == null) {
            setState(() {
              selectedAnswer = answer;
              if (answer.isCorrect) {
                score++;
              }
            });
          }
        },
      ),
    );
  }


  Widget _nextButton() {
    bool isLastQuestion = currentQuestionIndex == questionList.length - 1;

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        child: Text(isLastQuestion ? "Submit" : "Next"),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
        onPressed: () {
          if (isLastQuestion) {
            showDialog(
              context: context,
              builder: (_) => _showScoreDialog(),
            );
          } else {
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
      ),
    );
  }

  Widget _showScoreDialog() {
    return FutureBuilder<List<double>>(
      future: MLModelIntegration.runInference(getAnswerValues()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Failed to process the result."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        } else {
          mlModelOutput = snapshot.data!;
          String resultText = "";

          if (mlModelOutput.isNotEmpty) {
            double outputValue = mlModelOutput[0];

            if (outputValue >= 0 && outputValue <= 0.35) {
              resultText = "NO RISK";
            } else if (outputValue > 0.35 && outputValue <= 0.70) {
              resultText = "MODERATE RISK";
            } else if (outputValue > 0.70 && outputValue <= 1) {
              resultText = "HIGH RISK";
            } else {
              resultText = "Invalid result";
            }
          } else {
            resultText = "No result";
          }

          return AlertDialog(
            title: Text(resultText),
            content: ElevatedButton(
              child: const Text("Restart"),
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                  selectedAnswer = null;
                  mlModelOutput.clear();
                });
              },
            ),
          );
        }
      },
    );
  }

  List<double> getAnswerValues() {
    List<double> answerValues = [];

    for (int i = 0; i <= 12; i++) {
      var question = questionList[i];
      var answer = question.answersList.firstWhere((answer) => answer.isCorrect);
      answerValues.add(answer.numericValue);
    }

    return answerValues;
  }
}
