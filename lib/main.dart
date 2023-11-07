import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:iconsax/iconsax.dart';

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
      theme: AppTheme(context: context).defaultTheme,
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
  late final dateController = TextEditingController();
  late final dropdownController = TextEditingController();
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
    final List<DropdownMenuEntry<ColorLabel>> colorEntries =
    <DropdownMenuEntry<ColorLabel>>[];
    for (final ColorLabel color in ColorLabel.values) {
      colorEntries.add(
        DropdownMenuEntry<ColorLabel>(
            value: color, label: color.label, enabled: color.label != 'Grey'),
      );
    }
    var theme = Theme.of(context);
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
              10.height,
              AppCandidateProfile(
                  fullName: "John Doe", 
                  jobTitle: "Plumber", 
                  rating: 4, 
                  hourlyRate: "R00 p/h",
                nextButton: TertiaryButton(onPressed: (){}, child: Text("Next"), height: 35,),
              ),
              10.height,
              AppExplorationTile(
                title: "My Job Requests",
                count: 0,
                onClick: (){},
              ),
              AppExplorationTile(
                title: "My Job Requests",
                count: 1,
                onClick: (){},
              ),
              const AppExplorationTile(
                title: "My Job Requests",
              ),
              AppDialog(
                  title: "Switching Profiles",
                  content: "Switching your profile from 'Working' to 'Hiring.' Confirm your choice?",
                backgroundColor: Colors.white,
                actions: [
                  SecondaryButton(
                    onPressed: (){},
                    fullWidth: false,
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        BorderSide(
                          color: theme.colorScheme.secondary,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text("No, Cancel",
                      style: TextStyle(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                  PrimaryButton(
                    onPressed: (){},
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16, ),
                    fullWidth: false,
                    child: const Text("Yes, switch"),
                  ),
                ],
              ),
              10.height,
              AppJobAdvertCard(
                jobName: 'Tax Preparation',
                employerName: 'DVT',
                locationName: 'PickMe',
                matchingText: "Your profile matches this job",
                dateTime: DateTime.now().add(const Duration(days: 5)),
                status: JobStatus.applied,
                onNext: () {  },
              ),
              10.height,
              AppJobAdvertCard.applicationsAndMatches(
                jobName: 'Applications',
                employerName: 'DVT',
                locationName: 'PickMe',
                matchingText: "Your profile matches this job",
                dateTime: DateTime.now().add(const Duration(days: 5)),
                onNext: () {  },
                totalApplications: 2,
              ),
              10.height,
              const AppWalletTile(
                title: "Available Tokens",
                amount: "00.00",
              ),
              10.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                      children: [
                        AppSectionCard.small(title: "Buy",
                          color: const Color(0xFFF17E2C),
                          icon: const Icon(Iconsax.card_receive, color: Colors.white, size: 20,)
                        ),
                        10.height,
                        const AppSectionCard(
                            icon: Icon(Iconsax.wallet_money, color: Colors.white, size: 20,),
                            title: "Pickme Invest",
                          color: const Color(0xFF23A8B3),
                        ),
                      ]),
                  10.width,
                  Column(
                      children: [
                        const AppSectionCard(
                          icon: Icon(Iconsax.wallet_2, color: Colors.white, size: 20,),
                          title: "My Wallet",
                          color: const Color(0xFF3EB62B),
                        ),                        10.height,
                        AppSectionCard.small(
                          icon: const Icon(Iconsax.card_send, color: Colors.white, size: 20,),
                          title: "Pay",
                          color: const Color(0xFFF44F4E),
                        ),
                      ]),
                ],
              ),
              10.height,
               AppJobCard(
                jobName: 'Tax Preparation',
                employerName: 'DVT',
                locationName: 'PickMe',
                dateTime: DateTime.now().add(const Duration(days: 5)),
                status: JobStatus.applied,
                onNext: () {  },
              ),
              10.height,
               AppEmployeeJobCard(
                jobName: 'Tax Preparation',
                employeeName: 'Andrew Test',
                locationName: 'PickMe',
                dateTime: DateTime.now().add(const Duration(days: 5)),
                status: JobStatus.applied,
                onNext: () {  },
              ),
              10.height,
               AppJobCard(
                jobName: 'Cancelled Job',
                employerName: 'DVT',
                locationName: 'PickMe',
                dateTime: DateTime.now().add(const Duration(days: 3)),
                status: JobStatus.cancelled,
                onNext: () {  },
              ),
              10.height,
              const AppSubscriptionPlan(
                price: 'R 20.00',
                subscriptionType: 'once off',
                entityType: EntityType.individual,
                includedItems: [
                  "Test string 1",
                  "Test string ",
                ],
              ),
              10.height,
              const AppSubscriptionPlan(
                price: 'R 20.00',
                subscriptionType: 'once off',
                entityType: EntityType.business,
                includedItems: [
                  "Test string 1",
                  "Test string ",
                ],
              ),
              10.height,
              10.height,
              const AppSubscriptionPlan(
                price: 'R 20.00',
                subscriptionType: 'once off',
                entityType: EntityType.individual,
                selected: true,
                includedItems: [
                  "Test string 1",
                  "Test string ",
                ],
              ),
              10.height,
              const AppSubscriptionPlan(
                price: 'R 20.00',
                subscriptionType: 'once off',
                entityType: EntityType.business,
                selected: true,
                includedItems: [
                  "Test string 1",
                  "Test string ",
                ],
              ),
              10.height,
              AppTabBar(
                viewHeight:40,
                tabs: const <Widget>[
                  Text("Segment 1"),
                  Text("Segment 2"),
                  Text("Segment 3"),
                ],
                views: const <Widget>[
                  Center(
                    child: Text("Segment 1 content here"),
                  ),
                  Center(
                    child: Text("Segment 2 content here"),
                  ),
                  Center(
                    child: Text("Segment 3 content here"),
                  ),
                ],
              ),
              10.height,
              const AppImageAvatar(),
              10.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppTextAvatar(text: "UN"),
                  10.width,
                  AppTextAvatar.medium(text: "UN"),
                  10.width,
                  AppTextAvatar.small(text: "UN"),
                ],
              ),
              10.height,
              AppDropdownMenu(
                controller: dropdownController,
                enableFilter: true,
                dropdownMenuEntries: colorEntries,
                width: MediaQuery.of(context).size.width-16,
              ),
              10.height,
              DateTextBox(
                  controller:dateController,
                  labelText: "Enter date",
                  hint: "dd/mm/yyyy",
                  onDateSelected: (DateTime? selectedDate) {
                    dateController.text = "${selectedDate!.day}/${selectedDate.month}/${selectedDate.year}";
                  }),
              AppDatePickerFormField(
                  // controller:dateController,
                  // labelText: "Enter date",
                  // hint: "dd/mm/yyyy",
                  onDateSelected: (DateTime? selectedDate) {
                    // dateController.text = "${selectedDate!.day}/${selectedDate.month}/${selectedDate.year}";
                  },
                firstDate: DateTime.now().addYears(numberOfYears: -100),
                lastDate: DateTime.now().addYears(numberOfYears: 100),),
              const SizedBox(height: 10,),
              AppTextField(
                labelText: "Test0",
                // hint: "Test",
                textFieldType: TextFieldType.NUMBER,),
              const SizedBox(height: 10,),
              AppTextField(
                labelText: "Test0",
                prefixIcon: const Icon(Icons.search),
                textFieldType: TextFieldType.NUMBER,),
              const SizedBox(height: 10,),
              AppTextField(
                labelText: "Test0",
                suffix: const Icon(Icons.access_alarm),
                textFieldType: TextFieldType.NUMBER,),
              const SizedBox(height: 10,),
              AppTextField(
                enabled: false,
                labelText: "Test0",
                // hint: "Test",
                textFieldType: TextFieldType.NUMBER,),
              const SizedBox(height: 10,),
              OTPInput(onSubmitted: (int pin){
                debugPrint(pin.toString());
              },),
              AppStarRating(rating: 3, onChanged: (int index)=>debugPrint("Clicked index: $index"),),
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
              Row(
                children: [
                  const Expanded(child: Center(child: NotificationBadge(count: 10,))),
                  Expanded(child: Center(child: NotificationBadge.small())),
                ],
              ),
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
                  Container(width: (MediaQuery.of(context).size.width - 36)/2, child: const Center(child: Text("data"))),
                  Container(width: (MediaQuery.of(context).size.width - 36)/2, child: const Center(child: Text("Halla"))),
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
              PrimaryButton.fullWidth(
                  onPressed: null,
                  child: const Text(
                      "Full Width disabled")),
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
                          "Secondary Full Width"),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_forward)
                    ],
                  )),
              const SizedBox(height: 10,),
              TertiaryButton(onPressed: (){},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Tertiary Button"),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_forward)
                    ],
                  )),
              const SizedBox(height: 10,),
              SecondaryButton.fullWidth(onPressed: null,
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
              SecondaryButton(
                  onPressed: (){},
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
enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}
