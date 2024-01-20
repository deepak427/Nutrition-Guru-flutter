import 'package:flutter/material.dart';
import 'package:nutrition_guru/components/my_box_decoration.dart';
import 'package:nutrition_guru/components/progress_indicator.dart';

class DietPlannerPage extends StatefulWidget {
  const DietPlannerPage({super.key});

  @override
  State<DietPlannerPage> createState() => _DietPlannerPageState();
}

class _DietPlannerPageState extends State<DietPlannerPage> {
  String _selectedGoal = 'Gain Muscle';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Diet Planner"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Column(
              children: <Widget>[
                const MyProgressIndicator(),
                const SizedBox(height: 20),
                const Text(
                  'What is your goal?',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF263746)),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration:
                      getCustomBoxDecoration(_selectedGoal == 'Lose Fat'),
                  child: RadioListTile<String>(
                    title: Text(
                      'Lose Fat',
                      style: TextStyle(
                          color: _selectedGoal == 'Lose Fat'
                              ? Colors.orange
                              : Colors.black),
                    ),
                    value: 'Lose Fat',
                    groupValue: _selectedGoal,
                    onChanged: (value) {
                      setState(() {
                        _selectedGoal = value!;
                      });
                    },
                    activeColor: _selectedGoal == 'Lose Fat'
                        ? Colors.orange
                        : Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration:
                      getCustomBoxDecoration(_selectedGoal == 'Gain Muscle'),
                  child: RadioListTile<String>(
                    title: Text(
                      'Gain Muscle',
                      style: TextStyle(
                          color: _selectedGoal == 'Gain Muscle'
                              ? Colors.orange
                              : Colors.black),
                    ),
                    value: 'Gain Muscle',
                    groupValue: _selectedGoal,
                    onChanged: (value) {
                      setState(() {
                        _selectedGoal = value!;
                      });
                    },
                    activeColor: _selectedGoal == 'Gain Muscle'
                        ? Colors.orange
                        : Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: getCustomBoxDecoration(
                      _selectedGoal == 'Maintain Weight'),
                  child: RadioListTile<String>(
                    title: Text(
                      'Maintain Weight',
                      style: TextStyle(
                          color: _selectedGoal == 'Maintain Weight'
                              ? Colors.orange
                              : Colors.black),
                    ),
                    value: 'Maintain Weight',
                    groupValue: _selectedGoal,
                    onChanged: (value) {
                      setState(() {
                        _selectedGoal = value!;
                      });
                    },
                    activeColor: _selectedGoal == 'Maintain Weight'
                        ? Colors.orange
                        : Colors.black,
                  ),
                ),
                const Spacer(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: const Text('Next'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
