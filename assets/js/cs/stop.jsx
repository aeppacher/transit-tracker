import React from 'react';
import { Card, CardBody, CardTitle, CardText } from 'reactstrap';

export default function Stop(params) {
  let stop = params.stop;

  let stopName = stop.name;
  let stopRoutes = _.map(stop.routes, (rr) => 
    <CardText style={{ backgroundColor: getColor(rr), color: "#ffffff"}}>
    {rr}
    </CardText>);

  let cardStyle = {
    backgroundColor: '#343a40',
    borderColor: '#333',
    width: '200px',
    padding: '0px',
    margin: '5px'
  };

  return <Card body inverse style={cardStyle} className="text-center">
    <CardBody>
        <CardTitle>{stopName}</CardTitle>
        {stopRoutes}
    </CardBody>
  </Card>;
}

function getColor(name){
  switch(name){
    case "Red":
      return "#f44242";
    case "Blue":
      return "#4286f4";
    case "Orange":
      return "#c97800";
    default:
      return "#2d964e";
  }
}