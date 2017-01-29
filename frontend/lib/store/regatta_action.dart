import 'dart:async';
import 'action_type.dart';
import 'package:angular2/core.dart';
import 'package:greencat/greencat.dart';
import 'package:frontend/app_component.dart';
import 'package:frontend/models/event.dart';
import 'package:frontend/services/event_service.dart';

/// Utility function to trigger the selectEvent action.
RegattaAction<Event> selectEvent(Event event) => new SelectEventAction(event);

/// Utility function to trigger the addEvent action.
RegattaAction<String> requestCreateEvent(String name) => new RequestCreateEventAction(name);

/// Utility function to trigger the addEvent action.
RegattaAction<Event> addEvent(Event event) => new AddEventAction(event);

/// Utility function to trigger the deleteEvent action.
RegattaAction<Event> requestDeleteEvent(Event event) => new RequestDeleteEventAction(event);

/// Utility function to trigger the deleteEvent action.
RegattaAction<Event> deleteEvent(Event event) => new DeleteEventAction(event);

/// Actions to be triggered to the app store.
abstract class RegattaAction<T> extends Action<ActionType> {
  /// The payload to include.
  @override
  final T payload;

  /// Creates a new instance.
  RegattaAction(this.payload);
}

/// Action to request the add of a new Event.
class RequestCreateEventAction extends RegattaAction<String> implements AsyncAction<ActionType> {
  final EventService _eventService;

  RequestCreateEventAction(String payload)
      : _eventService = AppComponent.myinjector.get(EventService),
        super(payload);

  @override
  ActionType get type => ActionType.requestCreateEvent;

  @override
  Future call(MiddlewareApi api) {
    return _eventService.addEvent(payload).then((event) {
      api.dispatch(addEvent(event));
    });
  }
}

/// Action to select an Event.
class SelectEventAction extends RegattaAction<Event> {
  ///
  SelectEventAction(Event payload) : super(payload);

  @override
  ActionType get type => ActionType.selectEvent;
}

/// Action to add an Event.
class AddEventAction extends RegattaAction<Event> {
  ///
  AddEventAction(Event payload) : super(payload);

  @override
  ActionType get type => ActionType.addEvent;
}

class UpdateEventAction extends RegattaAction<Event> {
  ///
  UpdateEventAction(Event payload) : super(payload);

  @override
  ActionType get type => ActionType.updateEvent;
}

/// Action to add an Event.
class RequestDeleteEventAction extends RegattaAction<Event> implements AsyncAction<ActionType> {
  final EventService _eventService;

  RequestDeleteEventAction(Event payload)
      : _eventService = AppComponent.myinjector.get(EventService),
        super(payload);

  @override
  ActionType get type => ActionType.deleteEvent;

  @override
  Future call(MiddlewareApi api) {
    return _eventService.deleteEvent(payload).then((_) {
      api.dispatch(deleteEvent(payload));
    });
  }
}

/// Action to add an Event.
class DeleteEventAction extends RegattaAction<Event> {
  ///
  DeleteEventAction(Event payload) : super(payload);

  @override
  ActionType get type => ActionType.deleteEvent;
}
