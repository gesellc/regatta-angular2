import 'dart:async';
import 'dart:html' show window;

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:ng_bootstrap/ng_bootstrap.dart';

import 'event_assistants_list_component.dart';
import 'models/event.dart';
import 'models/sailing_club.dart';
import 'models/person.dart';
import 'package:frontend/services/event_service.dart';
import 'package:frontend/services/sailing_club_service.dart';
import 'package:frontend/services/person_service.dart';

@Component(
    selector: 'my-event-detail',
    templateUrl: 'event_detail_component.html',
    styleUrls: const ['event_detail_component.css'],
    directives: const [BS_DIRECTIVES, EventAssistantsListComponent])
class EventDetailComponent implements OnInit {
  Event event;
  List<SailingClub> sailingClubs;
  List<Person> persons;

  final EventService _eventService;
  final SailingClubService _sailingClubService;
  final PersonService _personService;
  //final Router _router;
  final RouteParams _routeParams;

  EventDetailComponent(this._eventService, this._sailingClubService,
      this._personService, /* this._router,*/ this._routeParams);

  Future<List<Person>> getPersons([String search = '']) async =>
      _personService.getPersons(search != '' ? {'search': search} : null);

  Future<Null> getEvent() async {
    final int id = int.parse(_routeParams.get('id'));
    event = await (_eventService.getEvent(id));
    sailingClubs = await (_sailingClubService.getSailingClubs());
    persons = await (_personService.getPersons());
  }

  @override
  void ngOnInit() {
    getEvent();
  }

  Future<Null> onSubmit() async {
    await _eventService.update(event);
    goBack();
  }

  void goBack() {
    window.history.back();
  }

  bool addAssistant(String assistantUrl) => event.assistants.add(assistantUrl);

  bool deleteAssistant(Person assistant) => event.assistants.remove(assistant);
}
