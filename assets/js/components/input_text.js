import TextField from '@material-ui/core/TextField';
import React from 'react';

const InputText = ({
 id, label, onChange, value 
}) => (
  <TextField
    autoFocus
    margin="dense"
    id={id}
    label={label}
    type="date"
    fullWidth
    InputLabelProps={{
      shrink: true,
    }}
    onChange={e => onChange(e.target.value)}
    value={start.format('YYYY-MM-DD')}
  />
);

export default InputText;
