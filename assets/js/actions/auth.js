import types from '../constants';
import api from '../api';

export const me = () => async (dispatch) => {
  dispatch({
    type: types.AUTH_ME,
  });

  try {
    const res = await api.me();
    const { data } = res.data;
    console.log(res.data);
    dispatch({
      type: types.AUTH_ME_SUCCESS,
      payload: data,
    });
  } catch (error) {
    dispatch({
      type: types.AUTH_ME_FAIL,
    });
  }
};

export const login = (username, password) => async (dispatch) => {
  dispatch({
    type: types.AUTH_LOGIN,
  });

  try {
    const res = await api.login(username, password);
    const { data } = res.data;
    console.log(res.data);
    dispatch({
      type: types.AUTH_LOGIN_SUCCESS,
      payload: data,
    });
  } catch (error) {
    dispatch({
      type: types.AUTH_LOGIN_FAIL,
    });
  }
};
