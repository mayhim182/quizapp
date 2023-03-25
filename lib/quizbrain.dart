
import 'package:quizapp/Questions.dart';

class quizBrain{
  //Note the underscore is used for declaring private variables here in dart
  int _questionNumber=0;
  List<Questions> _store=[Questions('Some cats are actually allergic to humans', true),
    Questions('You can lead a cow down stairs but not up stairs.', false),
    Questions('Approximately one quarter of human bones are in the feet.', true),
    Questions('A slug\'s blood is green.', true),
    Questions('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Questions
      ('It is illegal to pee in the Ocean in Portugal.', true),
    Questions(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Questions(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Questions(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Questions(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Questions('Google was originally called \"Backrub\".', true),
    Questions(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Questions(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  //to increment question number by 1

  void increaseQnNumber(){
    if(this._questionNumber>=_store.length-1){
      return ;
    }
    this._questionNumber++;
  }



  //Writing getter methods


  //To get question text
  String getQuestionText(){
    return _store[_questionNumber].questionText;
  }

  //To ger question's answer
  bool getAnswer(){
    return _store[_questionNumber].answerBool;
  }

  //To get index or rather say question number
  int getQnNumber(){
    return this._questionNumber;
  }

  //For getting total number of questions
  int totalNumberOfQuestions(){
    return this._store.length;
  }

  //Setter methods are implemented here

  void setQuestionNumberToZero(){
    this._questionNumber=0;
  }









  //TODO: Write setter methods

}
