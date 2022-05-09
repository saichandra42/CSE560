import logo from './logo.svg';
import React from "react";
import Box from '@mui/material/Box';
import Paper from '@mui/material/Paper';
import Grid from '@mui/material/Grid';
import { styled } from '@mui/material/styles';

import Header from "./Header";
import TopUsers from "./TopUsers";
import TopProviders from "./TopProviders";
import TopRatedProviders from "./TopRatedProviders";
import './App.css';
import TopRatedRiders from "./TopRatedRiders";

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fff',
  ...theme.typography.body2,
  padding: theme.spacing(1),
  textAlign: 'center',
  color: theme.palette.text.secondary,
}));



function App() {
  return (
    <div className="App">
      <Header/>
      <Box sx={{ flexGrow: 1,marginTop:'20px' }}>
      <Grid container spacing={2}>
        <Grid item xs={6}>
          <Item>
            <TopUsers/>
          </Item>
        </Grid>
        <Grid item xs={6}>
          <Item>
            <TopProviders/>
          </Item>
        </Grid>
        <Grid item xs={6}>
          <Item>
            <TopRatedProviders/>
          </Item>
        </Grid>
        <Grid item xs={6}>
          <Item>
            <TopRatedRiders/>
          </Item>
        </Grid>
      </Grid>
    </Box>
    </div>
  );
}

export default App;
