import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_quiz2023/answer_button.dart';
import 'package:flutter_quiz2023/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });
  //有状态组件从父组件获取有参函数地址的方法
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    //在有状态组件的Widget类里获取父组件地址后，通过State类里的widget直接调用
    //这里的widget是内置用法，类似于this
    //在子组件里调用函数，传入答题者的答案，真正函数运行是在父组件里定义好的
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++; // increments the value by 1
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            //这是一个常用写法，通过扩展操作符和map函数将Iterable列表里的元素用小组件展现出来
            //使用扩展操作符（...）将一个 List 中的所有元素插入到另一个 List 中，比如将[3,4]插入[1,2],不用扩展操作符就变成[1,2,[3,4]],使用扩展操作符插入后就是[1,2,3,4]
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
