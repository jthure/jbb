import types from '../constants';
import * as api from '../api';

export const login = (username, password) => async (dispatch) => {
  dispatch({
    type: 'LOGIN',
  });

  try {
    const res = await api.login(username, password);
    const { data } = res.data;
    console.log(res.data);
    dispatch({
      type: 'LOGIN_SUCCESS',
      payload: data,
    });
  } catch (error) {
    dispatch({
      type: 'LOGIN_FAIL',
    });
  }
};
