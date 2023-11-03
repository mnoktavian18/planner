import 'package:budget_plan/components/plan_tile.dart';
import 'package:budget_plan/pages/create.dart';
import 'package:budget_plan/utils/currency.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<PlanTile> data = [
    const PlanTile(
      planName: 'Plan 1',
      dueDate: 'Jan 2025',
      value: 100000000,
      currentValue: 30000000,
    ),
    const PlanTile(
      planName: 'Plan 2',
      dueDate: 'Jan 2024',
      value: 100000000,
      currentValue: 30000000,
    ),
    const PlanTile(
      planName: 'Plan 3',
      dueDate: 'Jan 2026',
      value: 100000000,
      currentValue: 30000000,
    ),
    const PlanTile(
      planName: 'Plan 3',
      dueDate: 'Jan 2026',
      value: 100000000,
      currentValue: 30000000,
    ),
    const PlanTile(
      planName: 'Plan 3',
      dueDate: 'Jan 2026',
      value: 100000000,
      currentValue: 30000000,
    ),
    const PlanTile(
      planName: 'Plan 3',
      dueDate: 'Jan 2026',
      value: 100000000,
      currentValue: 30000000,
    ),
    const PlanTile(
      planName: 'Plan 3',
      dueDate: 'Jan 2026',
      value: 100000000,
      currentValue: 30000000,
    ),
  ];

  double totalValue = 2000000000;
  double totalCurrentValue = 300000000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: Colors.blue[300],
            ),
            padding: const EdgeInsets.all(30),
            height: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Row(
                  children: [
                    Text(
                      'Hai, Riska Sulvana',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Nilai',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          Currency.format(totalValue),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Realisasi',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w100,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          Currency.format(totalCurrentValue),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.grid_view_rounded,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Rencana Keuangan',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Create(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                      (states) => const Color.fromARGB(248, 227, 242, 253),
                    ),
                  ),
                  child: Text(
                    '+ Tambah Baru',
                    style: TextStyle(
                      color: Colors.blue[700],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: data
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: item,
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
