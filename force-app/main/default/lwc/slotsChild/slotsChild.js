/**
 * @File Name          : slotsChild.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/20/2020, 10:24:39 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/20/2020   Somnath Sharma     Initial Version
**/
import {
    LightningElement
} from 'lwc';

export default class SlotsChild extends LightningElement {
    handleUnnamedSlot() {
        window.console.log('Unnamed slot');
    }

    handleNamedSlot() {
        window.console.log('named slot');
    }
}