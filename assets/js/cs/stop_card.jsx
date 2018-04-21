import React from 'react';
import { Button, Card, CardBody, CardTitle, CardText } from 'reactstrap';
import { NavLink } from 'react-router-dom';

export default function StopCard(params) {
  let stop = params.stop;

  let stopName = stop.name;
  let stopUrl = "/stop/" + stop.stop_id;
  let stopRoutesCleaned = cleanRoutes(stop.routes);
  let routesCleanedLength = stopRoutesCleaned.length;

  let colorHeight = (60 / stopRoutesCleaned.length);
  let stopRoutes = _.map(stopRoutesCleaned, (rr, index) => 
    <CardText key={index} style={
      { backgroundColor: getColor(rr),
        height: colorHeight,
        color: "#ffffff",
        marginTop: "0px",
        marginBottom: "0px",
        borderRadius: getRadius(index, routesCleanedLength)
      }
    }>
    </CardText>);

  let cardStyle = {
    backgroundColor: '#343a40',
    borderColor: '#333',
    width: '210px',
    padding: '0px',
    margin: '5px',
    float: 'left',
  };

  let cardTitleStyle = {
    height:'50px'
  }

  return <Card body inverse style={cardStyle} className="text-center">
    <CardBody>
        <CardTitle style={cardTitleStyle}>
          <NavLink id="station_title" to={stopUrl} >{stopName}</NavLink>
        </CardTitle>
        {stopRoutes}
    </CardBody>
  </Card>;
}

function cleanRoutes(routes){
  let shouldAdd = false;
  let tempRoutes = routes.slice();

  for (let i=routes.length-1; i>=0; i--) {
    if (routes[i].substring(0,1) === "G") {
        tempRoutes.splice(i, 1);
        shouldAdd = true;
    }
  }

  if(shouldAdd){
    tempRoutes.push("Green");
  }

  return tempRoutes;
}

function getRadius(index, length) {
  if(0 === (length - 1)) {
    return "0.25em 0.25em 0.25em 0.25em";
  }
  else if(index === 0){
    return "0.25em 0.25em 0em 0em";
  } 
  else if (index === (length - 1)) {
    return "0em 0em 0.25em 0.25em";
  }

  return "0em";
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