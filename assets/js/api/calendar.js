import api from './api_base'

export const fetchCalendarEvents = () => api.get('calendar_events');
export const fetchCalendarEvent = id => api.get(`calendar_event/${id}`);

export const saveCalendarEvent = (event) => {
  if (event.id) {
    return api.put(`calendar_events/${event.id}`, { calendar_event: event });
  }
  return api.post('calendar_events', { calendar_event: event });
};
export const fetchCalendarEventStatuses = () => api.get('calendar_event_statuses');
