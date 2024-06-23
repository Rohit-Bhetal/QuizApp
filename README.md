
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

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)

### LightMode
![WhatsApp Image 2024-06-23 at 15 57 07_7153f6ce](https://github.com/Rohit-Bhetal/QuizApp/assets/96344296/04ebbadb-d636-4378-aeee-2654089e7bae)

![WhatsApp Image 2024-06-23 at 15 42 44_1c081e13](https://github.com/Rohit-Bhetal/QuizApp/assets/96344296/a8f76577-163c-4749-acf0-49f8e76f5eb4)

![Uploading WhatsApp Image 2024-06-23 at 15.42.43_e08c4d87.jpg…]()

![WhatsApp Image 2024-06-23 at 15 42 43_8c865556](https://github.com/Rohit-Bhetal/QuizApp/assets/96344296/ef62e1d8-7499-4549-bb31-9538ae0fff8c)

### DarkMode

![WhatsApp Image 2024-06-23 at 15 42 43_2ca28cd4](https://github.com/Rohit-Bhetal/QuizApp/assets/96344296/07d6dc2d-25b2-4315-8cd2-46e741210e08)

![WhatsApp Image 2024-06-23 at 15 42 42_6423bcab](https://github.com/Rohit-Bhetal/QuizApp/assets/96344296/bce18a1c-ce2c-414c-b75f-9bcd52c3ead1)

![WhatsApp Image 2024-06-23 at 15 42 42_0d169817](https://github.com/Rohit-Bhetal/QuizApp/assets/96344296/9a07a80f-bc65-4eac-aee5-258ff79bd97e)


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

