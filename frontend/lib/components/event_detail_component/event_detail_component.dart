import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

import 'package:frontend/components/event_assistants_list_component/event_assistants_list_component.dart';
import 'package:frontend/store/regatta_store.dart';
import 'package:frontend/store/regatta_action.dart';
import 'package:frontend/models/event.dart';

@Component(
    selector: 'my-event-detail',
    templateUrl: 'event_detail_component.html',
    styleUrls: const ['event_detail_component.css'],
    directives: const [materialDirectives, EventAssistantsListComponent],
    providers: const [materialProviders])
class EventDetailComponent {
  final RegattaStore _store;

  EventDetailComponent(this._store);

  Event get event => _store.state.selectedEvent;

  String get raceCount => _store.state.selectedEvent.raceCount.toString();

  void onNameChanged(String data) {
    _store.dispatch(requestUpdateEvent(_store.state.selectedEvent.copy(name: data)));
  }

  // FIXME: workaround for a missing date picker
  void onStartDateChanged(String data) {
    try {
      _store.dispatch(requestUpdateEvent(_store.state.selectedEvent.copy(startDate: DateTime.parse(data))));
    } on FormatException {
      // FIXME: what to do then?
    }
  }

  // FIXME: workaround for a missing date picker
  void onEndDateChanged(String data) {
    try {
      _store.dispatch(requestUpdateEvent(_store.state.selectedEvent.copy(endDate: DateTime.parse(data))));
    } on FormatException {
      // FIXME: what to do then?
    }
  }

  void onRaceCountChanged(String data) {
    try {
      _store.dispatch(requestUpdateEvent(_store.state.selectedEvent.copy(raceCount: int.parse(data))));
    } on FormatException {
      // FIXME: what to do then?
    }
  }
}
