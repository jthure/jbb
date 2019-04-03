import axios from 'axios';

const API_URL = `${window.location.origin}/api`;
const apiUrl = path => `${API_URL}/${path}`;

export const fetchCalendarEvents = () => axios.get(apiUrl('calendar_events'));
export const fetchCalendarEvent = id => axios.get(apiUrl(`calendar_event/${id}`));

export const saveCalendarEvent = event => axios.post(apiUrl('calendar_events'), { calendar_event: event });
