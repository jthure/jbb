import api from './api_base'

export const login = (username, password) => api.post('login', { user: { username, password } });
export const me = () => api.get('login');
export const logout = () => api.get('logout');
