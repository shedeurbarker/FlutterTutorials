import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultSummary extends StatelessWidget {
  const ResultSummary(this.resultData, {super.key});

  final List<Map<String, Object>> resultData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: resultData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  margin: const EdgeInsets.fromLTRB(0, 0, 15, 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: data['user_answer'] == data['correct_answer']
                        ? const Color.fromARGB(255, 102, 160, 218)
                        : const Color.fromARGB(255, 212, 121, 203),
                  ),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data['user_answer'] as String,
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 227, 145, 239),
                        ),
                      ),
                      Text(
                        data['correct_answer'] as String,
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 102, 160, 218),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
