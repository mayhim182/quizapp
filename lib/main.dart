import 'package:flutter/material.dart';
import 'Questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quizbrain.dart';


quizBrain quiz=quizBrain();

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  // const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  // const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  int index=0;
  int score=0;

  List<Icon> scoreKeeper=[

  ];

  void checkScore(bool userAnswer){

    setState(() {


    if(userAnswer==quiz.getAnswer()){
      scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          )
      );
    }
    else{
      scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          )
      );
    }
    quiz.increaseQnNumber();

    });

  }

  //when questions are completed
  bool endOfTheQuestions(){
    if(quiz.getQnNumber()>=quiz.totalNumberOfQuestions()-1)
      return true;
    return false;
  }





  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    quiz.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
            ),
          ),
          Expanded(
            child: Padding(padding: EdgeInsets.all(15.0),
            child: TextButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: (){
                  setState(() {
                    if(endOfTheQuestions()){
                      Alert(
                          context: context,
                          title: "End of Quiz",
                          desc: "You have reached end of quiz your score is ",
                          buttons: [
                            DialogButton(
                                child: Text("Reset",
                                  style: TextStyle(color: Colors.white,fontSize: 20),
                                ),
                                onPressed:(){
                                  scoreKeeper.clear();
                                  quiz.setQuestionNumberToZero();
                                }
                            ),
                          ]
                      ).show();
                    }
                  });
                  checkScore(true);
                },
                child: Text('True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                ),
                )
            ),
            ),
          ),
          Expanded(
          child: Padding(padding: EdgeInsets.all(15.0),
            child: TextButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: (){
                  setState(() {
                  if(endOfTheQuestions()){
                    Alert(
                      context: context,
                      title: "End of Quiz",
                      desc: "You have reached end of quiz your score is ",
                      buttons: [
                        DialogButton(
                            child: Text("Reset",
                              style: TextStyle(color: Colors.white,fontSize: 20),
                            ),
                            onPressed:(){
                              scoreKeeper.clear();
                              quiz.setQuestionNumberToZero();
                            }
                        ),
                      ]
                    ).show();
                  }
                  });
                 checkScore(false);
                },
                child: Text('False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
            ),
          ),
        ),
          Row(
            children: scoreKeeper,
          )
      ],
    );
  }
}


//
// question1: 'You can lead a cow down stairs but not up stairs.', false,
// question2: 'Approximately one quarter of human bones are in the feet.', true,
// question3: 'A slug\'s blood is green.', true,


