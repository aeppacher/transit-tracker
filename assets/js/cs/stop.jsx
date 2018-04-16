import React from 'react';
import { Card, CardBody, CardTitle, CardText } from 'reactstrap';

export default function Stop(params) {
  let stop = params.stop;

  let stopName = stop.name;
  let stopRoutes = stop.routes;

  return <Card>
    <CardBody>
      <div>
        <CardTitle>{stopName}</CardTitle>
        <CardText>{stopRoutes}</CardText>
      </div>
    </CardBody>
  </Card>;
}