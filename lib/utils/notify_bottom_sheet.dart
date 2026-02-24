import 'all_imports.dart';

class NotifyBottomSheet extends StatefulWidget {
  const NotifyBottomSheet({super.key});

  @override
  NotifyBottomSheetState createState() => NotifyBottomSheetState();
}

class NotifyBottomSheetState extends State<NotifyBottomSheet> {
  List<Map<String, dynamic>> schedule = [
    {'day': 'Mon', 'date': '1 Dec 2023', 'yes': false, 'no': false},
    {'day': 'Tue', 'date': '2 Dec 2023', 'yes': false, 'no': false},
    {'day': 'Wed', 'date': '3 Dec 2023', 'yes': false, 'no': false},
    {'day': 'Thu', 'date': '4 Dec 2023', 'yes': false, 'no': false},
    {'day': 'Fri', 'date': '5 Dec 2023', 'yes': false, 'no': false},
    {'day': 'Sat', 'date': '6 Dec 2023', 'yes': false, 'no': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Notify',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, color: Colors.red),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Today your children is going to School?',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListView.builder(
              itemCount: schedule.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = schedule[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${item['day']}  ${item['date']}'),
                    Row(
                      children: [
                        Checkbox(
                          value: item['yes'],
                          onChanged: (value) {
                            setState(() {
                              item['yes'] = value!;
                              if (value) item['no'] = false;
                            });
                          },
                          activeColor: Colors.green, // Active color
                          // inactiveColor: Colors.grey, // Inactive color
                        ),
                        const Text('Yes'),
                        Checkbox(
                          value: item['no'],
                          onChanged: (value) {
                            setState(() {
                              item['no'] = value!;
                              if (value) item['yes'] = false;
                            });
                          },
                          activeColor: Colors.red, // Active color
                          // inactiveColor: Colors.grey, // Inactive color
                        ),
                        const Text('No'),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.green,
            ),
            onPressed: () {
              Navigator.pop(context);
              // Add your submit logic here
            },
            child: const Text('Submit', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }}