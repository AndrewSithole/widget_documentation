import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';

void main() {
  runApp(const MyApp());
}
const primaryColor = Color(0xFF3EB62B);
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  TextStyle textStyle(Set<MaterialState> states){
    return const TextStyle( color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
  }
  Color primaryButtonBackgroundColor(Set<MaterialState> states){
    if(states.contains(MaterialState.disabled)){
      return const Color(0xFFC5E9BF);
    }
    return primaryColor;
  }
  BorderSide secondaryButtonOutlineColor(Set<MaterialState> states){
    if(states.contains(MaterialState.disabled)){
      return const BorderSide(color: Color(0xFFC5E9BF, ), width: 2);
    }
    return const BorderSide(color: primaryColor, width: 2);
  }
  Color primaryButtonForegroundColor(Set<MaterialState> states){
    return Colors.white;
  }

  Color primarySwitchBackgroundColor(Set<MaterialState> states){
    if(states.contains(MaterialState.selected)){
      return primaryColor;
    }
    if(states.contains(MaterialState.disabled)){
      return const Color(0xFFE6E7EB);
    }
    return const Color(0xFFD1D4DB);
  }
  Color radioFillColor(Set<MaterialState> states){
    if(states.contains(MaterialState.selected)){
      return const Color(0xFFFFFFFF);
    }
    if(states.contains(MaterialState.disabled)){
      return const Color(0xFFE6E7EB);
    }
    return const Color(0xFFD1D4DB);
  }
  Color radioOutlineColor(Set<MaterialState> states){
    if(states.contains(MaterialState.selected)){
      return primaryColor;
    }
    if(states.contains(MaterialState.disabled)){
      return const Color(0xFFE6E7EB);
    }
    return const Color(0xFFD1D4DB);
  }
  Color primarySwitchThumbColor(Set<MaterialState> states){
    return const Color(0xFFFFFFFF);
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Montserrat",
        primaryColor: primaryColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith(textStyle),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: primaryColor, width: 1),
                )
              ),
              backgroundColor: MaterialStateProperty.resolveWith(primaryButtonBackgroundColor),
              foregroundColor: MaterialStateProperty.resolveWith(primaryButtonForegroundColor),

            )
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith(textStyle),
              side: MaterialStateProperty.resolveWith(secondaryButtonOutlineColor),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    side: BorderSide(
                        style: BorderStyle.solid,
                        color: primaryColor,
                        width: 1), // <-- this doesn't work at all in shape.
                  )),
              foregroundColor: MaterialStateProperty.resolveWith(primaryButtonBackgroundColor),
            )
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black
          ),
          bodySmall: TextStyle(
              color: Colors.black
          )
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith(primarySwitchThumbColor),
          trackColor: MaterialStateProperty.resolveWith(primarySwitchBackgroundColor),
          trackOutlineColor: MaterialStateProperty.resolveWith(primarySwitchBackgroundColor),
            trackOutlineWidth:MaterialStateProperty.all(1),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith(radioOutlineColor),
          overlayColor: MaterialStateProperty.resolveWith(radioFillColor),
          splashRadius: 0,
          materialTapTargetSize: MaterialTapTargetSize.padded,
          // visualDensity:,
        ),
        toggleButtonsTheme: const ToggleButtonsThemeData(
          fillColor: Color(0xFFFFFFFF),
          color: Color(0xFF6B7380),
          selectedColor: primaryColor,
          borderColor: const Color(0xFFF9F9F9),
          selectedBorderColor: const Color(0xFFF5F5F5),

        ),
        useMaterial3: true,
      ),
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
