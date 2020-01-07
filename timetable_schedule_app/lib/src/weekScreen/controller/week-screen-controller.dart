import 'dart:ffi';

import 'package:timetable_schedule_app/src/graphql-test/query/gueries.dart';
import "package:graphql_flutter/graphql_flutter.dart";
import 'package:timetable_schedule_app/src/graphql/graphql-config.dart';
import 'package:timetable_schedule_app/src/weekScreen/model/lesson-model.dart';

class WeekScreenController {
  Future<List<Lesson>> getLessonsForDay() async {
  // Future<List<Lesson>> getLessonsForDay(double dayNumber) async {
    print('add lesson execution');
    
    
    List<Lesson> lessons = new List<Lesson>();
    QueriesMutations queryMutation = QueriesMutations();
    GraphQLConfiguration graphQLConfig = new GraphQLConfiguration();
    GraphQLClient _client = graphQLConfig.clientToQuery();
    QueryResult result = await _client.query(QueryOptions(
        documentNode: gql(
      // queryMutation.getLessonsByDay(dayNumber),
      queryMutation.getLessonsByDay(),
    )));
    if (!result.hasException) {
      for (var i = 0; i < result.data["getEventsForDay"].length; i++) {
        lessons.add(Lesson(
          name: result.data['getEventsForDay'][i]['name'],
          startDateTime: result.data['getEventsForDay'][i]['startDateTime'],
          finishDateTime: result.data['getEventsForDay'][i]['finishDateTime'],
          place: result.data['getEventsForDay'][i]['place'],
          leaderName: result.data['getEventsForDay'][i]['leaderName'],
        ));
      }

      print('twoja stara' + lessons[0].name);
    }
    print(result.exception);
    return lessons;
  }
}