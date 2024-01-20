import 'package:flutter/material.dart';

class Dummy extends StatefulWidget {
  const Dummy({super.key});

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  String _selectedGoal = 'Gain Muscle';

  Widget _buildProgressIndicator() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF263746),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(3, (index) {
          return Icon(
            index == 1
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: index == 1 ? Colors.orange : Colors.grey,
          );
        }),
      ),
    );
  }

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
                _buildProgressIndicator(),
                const SizedBox(height: 20),
                const Text(
                  'What is your goal?',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF263746)),
                ),
                const SizedBox(height: 20),
                RadioListTile<String>(
                  title: const Text('Lose Fat'),
                  value: 'Lose Fat',
                  groupValue: _selectedGoal,
                  onChanged: (value) {
                    setState(() {
                      _selectedGoal = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Gain Muscle'),
                  value: 'Gain Muscle',
                  groupValue: _selectedGoal,
                  onChanged: (value) {
                    setState(() {
                      _selectedGoal = value!;
                    });
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  child: RadioListTile<String>(
                    title: const Text('Maintain Weight'),
                    value: 'Maintain Weight',
                    groupValue: _selectedGoal,
                    onChanged: (value) {
                      setState(() {
                        _selectedGoal = value!;
                      });
                    },
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
