import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/desktop/screens/admin_dashboard/widgets/line_chart.dart';
import 'package:portfolio/desktop/screens/admin_dashboard/widgets/live_clock.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:portfolio/desktop/screens/admin_dashboard/widgets/background.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Widget card({required Color color, Widget? child}) {
      return Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey)
        ),
        child: child,
      );
    }

Widget calendarCard() {
  return TableCalendar(
    rowHeight: 30,
    firstDay: DateTime.utc(2020, 1, 1),
    lastDay: DateTime.utc(2030, 12, 31),
    focusedDay: DateTime.now(),
    headerStyle: const HeaderStyle(
      titleCentered: true,
      formatButtonVisible: false,
      titleTextStyle: TextStyle(fontSize: 15, color: Colors.white),
      leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
      rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
    ),
    calendarStyle: const CalendarStyle(
      todayDecoration: BoxDecoration(
        color: Colors.deepOrange,
        shape: BoxShape.circle,
      ),
      selectedDecoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      defaultTextStyle: TextStyle(color: Colors.white),
      weekendTextStyle: TextStyle(color: Colors.white),
      outsideTextStyle: TextStyle(color: Colors.grey),
    ),
    daysOfWeekStyle: const DaysOfWeekStyle(
      weekdayStyle: TextStyle(color: Colors.white),
      weekendStyle: TextStyle(color: Colors.white),
    ),
  );
}


    return Background(
      children: [
        Expanded(
          flex: 1,
          child: card(
            color: Colors.indigo,
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: card(
                  color: Colors.blueGrey,
                  child: const Center(
                    child: Text(
                      "Dashboard Header",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 11,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [

                          Expanded(
                            child: card(
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withValues(alpha: 0.4),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey)
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          Icon(
                                            Icons.people,
                                            color: Colors.deepOrange,
                                            size: 40,
                                          ),

                                          const SizedBox(height: 8),

                                          const Text(
                                            "18534+",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          const Text(
                                            "No. of Visitors",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withValues(alpha: 0.4),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey)
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          Icon(
                                            Icons.notifications_none,
                                            color: Colors.deepOrange,
                                            size: 40,
                                          ),

                                          const SizedBox(height: 8),

                                          const Text(
                                            "23+",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          const Text(
                                            "New Messages",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withValues(alpha: 0.4),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.access_time, color: Colors.deepOrange, size: 40),

                                          const SizedBox(height: 8),

                                          Align(alignment: Alignment.center, child: LiveClock()),
                                          
                                          const Text(
                                            "Live Clock",
                                            style: TextStyle(color: Colors.white, fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  
                                ],
                              )
                            )
                          ),

                          Expanded(
                            flex: 2, 
                            child: card(
                              color: Colors.transparent,
                              child: viewsLineChart()
                            )
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 5,
                            child: card(
                              color: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: calendarCard(),
                              ),
                            ),
                          ),
                          Expanded(flex: 4, child: card(color: Colors.brown)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
