import 'package:date_picker/date_picker_helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Date Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () async {
                final date = await showPlatformDatePicker(context);
                if (date != null) controller.text = date.toString();
              },
              child: AbsorbPointer(
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month_outlined),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
