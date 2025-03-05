import { LightningElement, api } from 'lwc';

export default class ComponentA extends LightningElement {
    @api message = ''; // Property updated by Parent B
}