import React from 'react';
import { Button, Card, CardBody, CardTitle, CardText } from 'reactstrap';
import { NavLink } from 'react-router-dom';

export default function RouteCard(params) {
  let route = params.route;

  console.log(params, "params");

  let routeName = route.name;
  let routeUrl = "/route/" + route.route_id;

  let cardStyle = {
    backgroundColor: '#343a40',
    borderColor: '#333',
    padding: '0px',
    margin: '5px',
  };

  let navlinkStyle = 
  { 
    color: "#ffffff",
  };

  let cardTextStyle =
  {
    backgroundColor: getColor(route.route_id),
    borderRadius: ".25em"
  };

  return <Card body inverse style={cardStyle} className="text-center">
    <CardBody>
      <CardText style={cardTextStyle}>
        <NavLink style={navlinkStyle} id="route_title" to={routeUrl}>
          {routeName}
        </NavLink>
      </CardText>
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