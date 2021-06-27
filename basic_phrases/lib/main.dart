import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(PhrasesApp());
}

class PhrasesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Phrases',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhrasesPage(title: "Basic Phrases"),
    );
  }
}

class PhrasesPage extends StatefulWidget {
  PhrasesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PhrasesPageState createState() => _PhrasesPageState();
}

class _PhrasesPageState extends State<PhrasesPage> {
  @override
  Widget build(BuildContext context) {
    double bgOpacity = 0.8;

    List<String> texts = [
      "Salut",
      "Hallo",
      "Mă numesc",
      "Ich heisse",
      "Cum ești?",
      "Wie geht es dir?",
      "Sunt bine",
      "Mir geht es gut",
    ];

    FlutterTts flutterTts = FlutterTts();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 25.0,
              mainAxisSpacing: 25.0,
          ),
          padding: const EdgeInsets.all(25.0),
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () async {
                index.isEven ? await flutterTts.setLanguage("ro") : await flutterTts.setLanguage("de");
                await flutterTts.speak(texts[index]);
              },
              child: Container(
                child: Align(
                  alignment: Alignment.center,
                    child: Text(
                      texts[index],
                      style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                      ),
                    ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    begin: index.isEven ? Alignment.centerLeft : Alignment.topCenter,
                    end: index.isEven ? Alignment.centerRight : Alignment.bottomCenter,
                    stops: [
                      0,
                      0.32,
                      0.34,
                      0.65,
                      0.67,
                      1,
                    ],
                    colors: [
                      index.isEven ? Colors.blue.withOpacity(bgOpacity) : Colors.black.withOpacity(bgOpacity),
                      index.isEven ? Colors.blue.withOpacity(bgOpacity) : Colors.black.withOpacity(bgOpacity),
                      index.isEven ? Colors.yellow.withOpacity(bgOpacity) : Colors.red.withOpacity(bgOpacity),
                      index.isEven ? Colors.yellow.withOpacity(bgOpacity) : Colors.red.withOpacity(bgOpacity),
                      index.isEven ? Colors.red.withOpacity(bgOpacity) : Colors.yellow.withOpacity(bgOpacity),
                      index.isEven ? Colors.red.withOpacity(bgOpacity) : Colors.yellow.withOpacity(bgOpacity),
                    ],
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}
