import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/models/question_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../config/themes/ui_parameters.dart';
import '../../controller/question_data/question_paper_controller.dart';
import '../questions/question_page.dart';
import 'home_screen.dart';

class SearchBox extends StatefulWidget {
  SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final QuestionPaperController _questionPaperController = Get.find();

  final TextEditingController _controller = TextEditingController();

  final FocusNode _textFieldFocusNode = FocusNode();

  // Create a list to hold the filtered question papers
  List<QuestionPaperModel> _filteredPapers = [];

  // Method to update the filtered list based on the search query
  void _updateFilteredList(String query) {
    if (query.isEmpty) {
      // If the search query is empty, show all papers
      _filteredPapers = [];
    } else {
      // Filter the papers that contain the search query in the title
      _filteredPapers = _questionPaperController.allPapers.where((paper) {
        final title = paper.title.toLowerCase();
        return title.contains(query.toLowerCase());
      }).toList();
    }
    setState(() {}); // Update the UI after filtering
  }

  // Flag to show/hide the list view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back(result: () => const HomeScreen());
            },
            padding: const EdgeInsets.only(left: kDefaultPadding),
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Theme.of(context).colorScheme.background,
            )),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context)
                      .colorScheme
                      .background
                      .withOpacity(0.3)),
              child: GestureDetector(
                onTap: () {},
                child: TextField(
                  controller: _controller,
                  focusNode: _textFieldFocusNode,
                  onChanged: _updateFilteredList,
                  style: Theme.of(context).textTheme.titleMedium,
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Container(
                          padding: EdgeInsets.only(top: 10),
                          child: FaIcon(FontAwesomeIcons.magnifyingGlass)),
                      suffixIconColor: Theme.of(context).colorScheme.background,
                      hintText: 'Search',
                      suffixIcon: Container(
                          padding: EdgeInsets.only(left: 15),
                          child: IconButton(
                              onPressed: () {
                                _controller.clear();
                              },
                              icon: FaIcon(FontAwesomeIcons.xmark))),
                      prefixIconColor: Theme.of(context).colorScheme.background,
                      hintStyle: const TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Obx(() {
              if (_questionPaperController.isLoadingData.value) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ), // Display a circular progress indicator
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                      itemCount: _filteredPapers.length,
                      itemBuilder: (context, int index) {
                        return GestureDetector(
                          onTap: () {
                            _textFieldFocusNode.unfocus();
                            Get.to(
                                () => QuestionSubjectPage(
                                      model: _filteredPapers[index],
                                    ),
                                popGesture: true);
                          },
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding + 10),
                            title: Text(
                              _filteredPapers[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontSize: 20),
                            ),
                          ),
                        );
                      }),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

/*class SearchBox extends StatelessWidget {
  final QuestionPaperController _questionPaperController = Get.find();
  SearchBox({
    super.key, //required this.onChanged,
  });
  // final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(kDefaultPadding),
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.4)),
      child: GestureDetector(
        onTap: () {
          
        },
        child: TextField(
          // onChanged: onChanged,
          style: Theme.of(context).textTheme.titleMedium,
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              suffix: const FaIcon(FontAwesomeIcons.magnifyingGlass),
              suffixIconColor: Theme.of(context).colorScheme.background,
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
ListView.builder(
              itemCount: _questionPaperController.allPapers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(
                        () => QuestionSubjectPage(
                              model: _questionPaperController.allPapers[index],
                            ),
                        popGesture: true);
                  },
                  child: ListTile(
                    title: Text(
                      _questionPaperController.allPapers[index].title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                );
              });*/