import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/question_model.dart';
import '../../config/themes/ui_parameters.dart';

class BoxCards extends StatelessWidget {
  final QuestionPaperModel model;

  const BoxCards({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 4,
      ),
      height: 160,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 136,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Theme.of(context).colorScheme.tertiary,
                boxShadow: const [kDefaultShadow]),
            child: Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(22)),
            ),
          ),
          //For Question Paper Images
          Positioned(
              top: 0,
              right: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  height: 160,
                  width: 200,
                  child: CachedNetworkImage(
                      width: 100,
                      height: 100,
                      imageUrl: model.imageUrl,
                      placeholder: (context, url) => Container(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                              strokeWidth: 1,
                              color: Colors.grey,
                            ),
                          ),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/errorImageCyan.png")))),
          Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                height: 136,
                width: size -
                    200, // set the database image as size of 200 so difference btw them is the size of the sized box
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        model.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
