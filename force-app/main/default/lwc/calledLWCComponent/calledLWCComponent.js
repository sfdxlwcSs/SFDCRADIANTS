/**
 * @description       :
 * @author            : Somnath Sharma
 * @group             :
 * @last modified on  : 20-01-2021
 * @last modified by  : Somnath Sharma
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   20-01-2021   Somnath Sharma   Initial Version
 **/
import { LightningElement, api } from "lwc";

export default class CalledLWCComponent extends LightningElement {
  //Place holder for URL of Salesforce
  sfdcBaseURL;
  //data passed from VF
  @api recordId = "";

  connectedCallback() {
    console.log("value for vf-" + this.contact + window.location.origin);
  }

  /*for custom URL for use in href of anchor tab*/
  get setBaseUrl() {
    return (this.sfdcBaseURL = window.location.origin + "/" + this.recordId);
  }
}