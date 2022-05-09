import * as React from 'react';
import Box from '@mui/material/Box';
import Card from '@mui/material/Card';
import CardActions from '@mui/material/CardActions';
import CardContent from '@mui/material/CardContent';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import axios from 'axios';
import {topProviders } from "./data"

export default function TopProviders() {
    // const [topProviders, setTopProviders] = React.useState([]);
    // React.useEffect(() => {
    //     const url = "http://127.0.0.1:5000/topproviders";
    //     axios.get(url).then(
    //         result => setTopProviders(result.data),
    //         error => setTopProviders([])
    //       );
    //   }, []);
      
    return (
        <Box sx={{ minWidth: 275 }}>
            <Card variant="outlined">
                <React.Fragment>
                    <CardContent>
                        <Typography variant="h5" component="div">
                            Top Providers
                        </Typography>
                        <TableContainer component={Paper}>
                            <Table sx={{ minWidth: 650 }} aria-label="simple table">
                                <TableHead>
                                    <TableRow>
                                        <TableCell align="right">ID</TableCell>
                                        <TableCell align="right">First Name</TableCell>
                                        <TableCell align="right">Last Name</TableCell>
                                        <TableCell align="right">No of Rides</TableCell>
                                    </TableRow>
                                </TableHead>
                                <TableBody>
                                    {topProviders && topProviders.map((row) => (
                                        <TableRow
                                            key={row[0]}
                                            sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
                                        >
                                            <TableCell align="right">{row[0]}</TableCell>
                                            <TableCell align="right">{row[1]}</TableCell>
                                            <TableCell align="right">{row[2]}</TableCell>
                                            <TableCell align="right">{row[3]}</TableCell>
                                        </TableRow>
                                    ))}
                                </TableBody>
                            </Table>
                        </TableContainer>
                    </CardContent>
                </React.Fragment>
            </Card>
        </Box>
    );
}
