import axios from 'axios';

const API_URL = `${window.location.origin}/api`;
// const apiUrl = path => `${API_URL}/${path}`;

export default axios.create({ withCredentials: true, baseURL: API_URL })