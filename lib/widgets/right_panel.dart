import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';
class RightPanel extends StatelessWidget {
  const RightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CalendarCard(),
        SizedBox(height: 20),
        BirthdayCard(),
        SizedBox(height: 20),
        AnniversaryCard(),
      ],
    );
  }
}

class CalendarCard extends StatefulWidget {
  const CalendarCard({super.key});

  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2035, 12, 31),
        focusedDay: focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(selectedDay, day);
        },
        onDaySelected: (selected, focused) {
          setState(() {
            selectedDay = selected;
            focusedDay = focused;
          });
        },

        headerStyle: const HeaderStyle(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          formatButtonVisible: false,
          leftChevronIcon: Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          rightChevronIcon: Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
        ),

        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.white70),
          weekendStyle: TextStyle(color: Colors.white70),
        ),

        calendarStyle: CalendarStyle(
          defaultTextStyle: const TextStyle(color: Colors.white),
          weekendTextStyle: const TextStyle(color: Colors.white),
          outsideTextStyle: const TextStyle(color: Colors.white24),

          todayDecoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),

          selectedDecoration: BoxDecoration(
            color: AppColors.purple,
            shape: BoxShape.circle,
          ),

          cellMargin: const EdgeInsets.all(4),
        ),
      ),
    );
  }
}

class BirthdayCard extends StatelessWidget {
  const BirthdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [

          const Text(
            "Today's Birthday",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          const CircleAvatar(
            radius: 30,
            backgroundImage:
            NetworkImage(
              "https://i.pravatar.cc/150?img=15",
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "2 Birthdays Today",
            style: TextStyle(color: Colors.white),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Birthday Wishing"),
            ),
          )
        ],
      ),
    );
  }
}

class AnniversaryCard extends StatelessWidget {
  const AnniversaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [

          const Text(
            "Anniversary",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          const CircleAvatar(
            radius: 30,
            backgroundImage:
            NetworkImage(
              "https://i.pravatar.cc/150?img=22",
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            "3 Anniversaries",
            style: TextStyle(color: Colors.white),
          ),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Anniversary Wishing"),
            ),
          )
        ],
      ),
    );
  }
}