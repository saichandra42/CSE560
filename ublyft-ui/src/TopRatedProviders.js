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
import { topRatedProviders } from "./data"

export default function TopRatedProviders() {
    // const [topRatedProviders, setTopRatedProviders] = React.useState([]);
    // React.useEffect(() => {
    //     const url = "http://127.0.0.1:5000/topratedproviders";
    //     axios.get(url).then(
    //         result => setTopRatedProviders(result.data),
    //         error => setTopRatedProviders([])
    //       );
    //   }, []);
      
    return (
        <Box sx={{ minWidth: 275 }}>
            <Card>
                <React.Fragment>
                    <CardContent>
                        <Typography variant="h5" component="div">
                            Providers with highest ratings
                        </Typography>
                        <TableContainer>
                            <Table sx={{ minWidth: 650 }} aria-label="simple table">
                                <TableHead>
                                    <TableRow>
                                        <TableCell align="right">Ranking</TableCell>
                                        <TableCell align="right">Name</TableCell>
                                        <TableCell align="right">Average ratings</TableCell>
                                    </TableRow>
                                </TableHead>
                                <TableBody>
                                    {topRatedProviders && topRatedProviders.map((row,index) => (
                                        <TableRow
                                            key={row[0]}
                                            sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
                                        >
                                            <TableCell align="right">{index+1}</TableCell>
                                            <TableCell align="right">{row.driver_name}</TableCell>
                                            <TableCell align="right">{row["AVG(Trip.rider_rating)"]}</TableCell>
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
