import { LightningElement } from 'lwc';
export default class Mapcmp extends LightningElement {
 mapOptions = {
    'disableDefaultUI': false, // when true disables Map|Satellite, +|- zoom buttons
    'draggable': true, // when false prevents panning by dragging on the map
  };
  
  mapMarkers = [
    {
      location: {
        City: 'Bangalore',
        Country: 'India',
        PostalCode: '560100',
        State: 'Karnataka',
        Street: 'Navami Funique',
      },
      mapIcon : {
        path: 'M 125,5 155,90 245,90 175,145 200,230 125,180 50,230 75,145 5,90 95,90 z',
        fillColor: '#CF3476',
        fillOpacity: .5,
        strokeWeight: 1,
        scale: .10,
      }
    }
  ];
}