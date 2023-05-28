import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  //在构造函数中，初始化startQuiz地址就是Quiz类里的_switchScreen函数地址
  const StartScreen(this.startQuiz, {super.key});
  //在Quiz里设置函数返回类型为void，这里要接收函数的地址，使用void Function（） XXX
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter the fun way!',
            //直接使用谷歌第三方库设置字体
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
            ),
          ),
          //通过SizedBox设置组件间的空白间距
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            //通过styleFrom设置按钮的样式
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
