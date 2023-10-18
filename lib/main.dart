import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().defaultTheme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);
  bool value = false;
  RadioOption selected = const RadioOption(title:"Andrew", value: 1);
  List<bool> selectedToggleButtons = [true,false];
  int? selectedIndex;
  int sliderNumber = 20;

  @override
  void initState() {
    super.initState();
  }
  void _incrementCounter() {

  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StarRating(value: 3, onChanged: (int index)=>debugPrint("Clicked index: $index"),),
              const SizedBox(height: 10,),
              CustomSlider(currentSliderValue: sliderNumber.toDouble(), onChanged: (double number)=>setState(() {
                sliderNumber = number.round();
              }),),
              const SizedBox(height: 10,),
              StatusBadge.success("Success Badge"),
              StatusBadge.warning("Warning Badge"),
              StatusBadge.danger("Alert Badge"),
              StatusBadge.info("Info Badge"),
              const SizedBox(height: 10,),
              ChipGroup(
                inputs: [
                  ChipOption(label: "Skill 1", id: 1),
                  ChipOption(label: "Skill 2", id: 2),
                  ChipOption(label: "Skill 3", id: 3),
                  ChipOption(label: "Skill 4", id: 4),
                  ChipOption(label: "Skill 5", id: 5),
                  ChipOption(label: "Skill 6", id: 6),
                  ChipOption(label: "Skill 7", id: 7),
                ],
                onSelected: null,
                onDeleted: (){},
              ),
              const SizedBox(height: 10,),
              NumberStepper(number: 3, incrementFunction: (){}, subtractFunction: (){}),
              const SizedBox(height: 10,),
              ProfileToggle(
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < selectedToggleButtons.length; i++) {
                      selectedToggleButtons[i] = i == index;
                    }
                  });
                },
                selected: selectedToggleButtons,
                children: [
                  Container(width: (MediaQuery.of(context).size.width - 36)/2, child: Center(child: Text("data"))),
                  Container(width: (MediaQuery.of(context).size.width - 36)/2, child: Center(child: Text("Halla"))),
                  ],
              ),
              const SizedBox(height: 10,),
              PrimaryButton(onPressed: (){},
                  child: const Text(
                    "Full Width")),
              const SizedBox(height: 10,),
              PrimaryButton(onPressed: (){},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Full Width icon"),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_forward)
                    ],
                  )),
              const SizedBox(height: 10,),
              const PrimaryButton(onPressed: null,
                  child: Text(
                      "Disabled primary button")),
              const SizedBox(height: 10,),
              PrimaryButton.halfWidth(onPressed: null,
                  child: const Text(
                      "Full Width")),
              const SizedBox(height: 10,),
              PrimaryButton.small(onPressed:(){},child: const Text("Small button", style: TextStyle(fontSize: 14),)),
              const SizedBox(height: 10,),
              PrimaryButton.icon(onPressed: (){},
                  child: const Icon(Icons.add)),
              const SizedBox(height: 10,),
              PrimaryButton.smallIcon(onPressed: (){},
                  child: const Icon(Icons.add)),
              const SizedBox(height: 10,),
              SecondaryButton(onPressed: (){},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Full Width"),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_forward)
                    ],
                  )),
              const SizedBox(height: 10,),
              const SecondaryButton(onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Full Width"),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_forward)
                    ],
                  )),
              const SizedBox(height: 10,),
              SecondaryButton.halfWidth(onPressed: (){},
                  child: const Text(
                      "Half Width")),
              const SizedBox(height: 10,),
              PrimarySwitch(value: value, onChanged: (bool val){
                setState(() {
                  value = val;
                });
              }),
              const PrimarySwitch(value: false, onChanged: null),
              const SizedBox(height: 10,),
              RadioButtonList(
                  selected: selected,
                  options: const [
                RadioOption(title:"Andrew", value: 1),
                RadioOption(title:"Kim", value: 2),
              ], onChanged: (value){
                    setState(() {
                      selected = value;
                    });
              }),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
