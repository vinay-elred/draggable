import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool dropped = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Draggable'),
        ),
        body: Column(
          children: [
            Draggable<String>(
              data: 'Data',
              feedback: Material(
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.yellow,
                  child: const Center(child: Text('File Data')),
                ),
              ),
              childWhenDragging: Container(
                height: 200,
                width: 200,
                color: Colors.grey,
              ),
              child: dropped
                  ? const SizedBox.square(
                      dimension: 200,
                    )
                  : Container(
                      height: 200,
                      width: 200,
                      color: Colors.yellow,
                      child: const Center(child: Text('File Data')),
                    ),
            ),
            DragTarget<String>(
              builder: (context, candidateData, rejectedData) {
                return Container(
                  height: 200,
                  width: 200,
                  color: dropped ? Colors.green : Colors.lightGreen,
                  child: Center(
                    child: !dropped
                        ? const Text('Drag Here')
                        : const Text('Data Dropped'),
                  ),
                );
              },
              onWillAccept: (data) => data != null,
              onAccept: (data) {
                dropped = true;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
