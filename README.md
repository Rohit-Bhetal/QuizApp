
# QuizApp Flutter(Dropped)

QuizApp is an innovative and engaging quiz application built with Flutter, providing a seamless and interactive experience for users across various platforms, including iOS, Android, and web. 



## Authors

- [@RohitBhetal](https://github.com/Rohit-Bhetal)


## Features

- Light/dark mode toggle
- User Authentication
- Diverse Quiz Categories
- Cross platform


## Installation

https://github.com/Rohit-Bhetal/QuizApp.git

```bash
flutter clean
flutter packages get
flutter packages upgrade
```

### Firebase Configuration
Reconfigure this variables with your firebase config's

```bash
static const FirebaseOptions android = FirebaseOptions(
    apiKey: '',
    appId: '',
    messagingSenderId: '',
    projectId: '',
    storageBucket: '',
  );

```
## Screenshots



### LightMode
![Group 2(1)](https://github.com/Rohit-Bhetal/QuizApp/assets/96344296/e1fae4a4-2171-4785-84c0-f1b5112e5670)


### DarkMode
![Group 2](https://github.com/Rohit-Bhetal/QuizApp/assets/96344296/a9ea9190-baa1-41b1-83b9-985b6f83b751)

## FireStore Config
Make sure that firestore has this documents with variable like this so that New QuizModel Card can be created :

Firestore Database file Structure
```bash
  questionPaper
          |-->ppr1
          |-->ppr2
          |-->ppr3
                |-->{String id;String title;String imageUrl;String description;int timeSeconds;}
          |-->....

  users
    |-->email_1
    |--email_2
    |--email_3
          |-->{name,email,profilePic}
                

```
Question Paper/Card Model
```bash
class QuestionPaperModel {
    String id;
    String title;
    String imageUrl;
    String description;
    int timeSeconds;
  List<Question> questions;

  QuestionPaperModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.timeSeconds,
    required this.questions,
  });
```

## Conclusion
I dropped the project as Im busy with my ML/DL learning and WebD works so If this intrests you Contribute to it.

