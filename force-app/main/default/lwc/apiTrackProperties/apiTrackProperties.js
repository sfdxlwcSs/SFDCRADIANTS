/**
 * @File Name          : apiTrackProperties.js
 * @Description        : 
 * @Author             : Sasank Subrahmanyam V
 * @Group              : 
 * @Last Modified By   : Sasank Subrahmanyam V
 * @Last Modified On   : 2/19/2020, 10:31:56 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    12/11/2019   Sasank Subrahmanyam V     Initial Version
**/
import { LightningElement, api, track } from 'lwc';

export default class ApiTrackProperties extends LightningElement {
    @track trackedString = 'default string';
    @track trackedObject = { name: 'default' };
    @track trackedArray = [{ name: 'default' }];

    logTrackedString = () => console.log('parent trackedString => ', this.trackedString);
    logTrackedObject = () => console.log('parent trackedObject => ', this.trackedObject);
    modifyTrackedObject = () => { this.trackedObject.parentNewProp = 'parent value' }
    logTrackedArray = () => console.log('parent trackedArray => ', this.trackedArray);

}