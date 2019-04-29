import axios from 'axios';

const API_URL = `${window.location.origin}/api`;
const apiUrl = path => `${API_URL}/${path}`;

export const fetchCalendarEvents = () => axios.get(apiUrl('calendar_events'));
export const fetchCalendarEvent = id => axios.get(apiUrl(`calendar_event/${id}`));

export const saveCalendarEvent = (event) => {
  console.log(event);
  if (event.id) {
    return axios.put(apiUrl(`calendar_events/${event.id}`), { calendar_event: event });
  }
  return axios.post(apiUrl('calendar_events'), { calendar_event: event });
};

export const fetchCalendarEventStatuses = () => axios.get(apiUrl('calendar_event_statuses'));
