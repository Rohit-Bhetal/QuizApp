import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class QuestionHolder extends StatelessWidget {
  const QuestionHolder({super.key});

  @override
  Widget build(BuildContext context) {
    var line = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Theme.of(context).colorScheme.primary,
      ),
      width: double.infinity,
      height: 10.0,
    );
    var answer = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.primary,
      ),
      width: double.infinity,
      height: 40.0,
    );
    return Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: EasySeparatedColumn(
            children: [
              EasySeparatedColumn(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    line,
                    line,
                    line,
                    line
                  ],
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  }),
              SizedBox(
                height: 10,
              ),
              answer,
              answer,
              answer,
              answer
            ],
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 20,
              );
            },
          ),
        ));
  }
}
