/**
 * @description       :
 * @author            : Somnath Sharma
 * @group             :
 * @last modified on  : 19-11-2020
 * @last modified by  : Somnath Sharma
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   19-11-2020   Somnath Sharma   Initial Version
 **/
import { LightningElement } from "lwc";
export default class App extends LightningElement {
  message = "Hello World";
  ready = false;
  name = "Electra X4";
  description = "A sweet bike built for comfort.";
  category = "Mountain";
  material = "Steel";
  price = "$2,700";
  pictureUrl =
    "https://s3-us-west-1.amazonaws.com/sfdc-demo/ebikes/electrax4.jpg";

  connectedCallback() {
    setTimeout(() => {
      this.ready = true;
    }, 3000);
  }
}