import axios from 'axios';

const API_URL = `${window.location.origin}/api`;

export const fetchCalendarEvents = () => axios.get(`${API_URL}/calendar_events`);
export const fetchCalendarEvent = id => axios.get(`${API_URL}/calendar_event/${id}`);
