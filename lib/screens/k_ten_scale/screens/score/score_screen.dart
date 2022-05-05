import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lith_app/screens/k_ten_scale/controllers/question_controller.dart';
import 'package:lith_app/screens/patient_dashboard/fitness_app_home_screen.dart';

import '../../constants.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/icons/bgunsplash.jpeg", fit: BoxFit.fill),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                "${_qnController.scoretotal}/${_qnController.questions.length * 5}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(flex: 3),
              const InterpretationTable(),
              const Spacer(flex: 2),
              const Text(
                "Note: This is not intended to provide a diagnosis. Please contact a professional for professional advise.",
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: kSecondaryColor),
              ),
              const Spacer(flex: 2),
              InkWell(
                onTap: () => Get.to(const FitnessAppHomeScreen()),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(kDefaultPadding * 0.75), // 15
                  decoration: const BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text(
                    "Navigate to Dashboard",
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: Colors.black),
                  ),
                ),
              ),
              const Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}

class InterpretationTable extends StatelessWidget {
  const InterpretationTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      color: Colors.white,
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Score',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
            ),
          ),
          DataColumn(
            label: Text(
              'Meaning of Score',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text(
                '10 - 19',
                style: TextStyle(color: Colors.black),
              )),
              DataCell(Text('Likely to be well',
                  style: TextStyle(color: Colors.black))),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('20 - 24', style: TextStyle(color: Colors.black))),
              DataCell(Text('Likely to have a mild disorder',
                  style: TextStyle(color: Colors.black))),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('25 - 29', style: TextStyle(color: Colors.black))),
              DataCell(Text('Likely to have a moderate disorder',
                  style: TextStyle(color: Colors.black))),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('30 - 50', style: TextStyle(color: Colors.black))),
              DataCell(Text('Likely to have a severe disorder',
                  style: TextStyle(color: Colors.black))),
            ],
          ),
        ],
      ),
    );
  }
}
