/**
 * @File Name          : identification.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/17/2020, 10:22:32 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/17/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';

export default class Identification extends LightningElement {
    getElements() {
        let parentDiv = this.template.querySelector('[data-parent]');
        window.console.log('child2=>', parentDiv.querySelector('[data-child2]'));
        window.console.log('div=>', this.template.querySelector('div')); //first div
        window.console.log('div=>', this.template.querySelectorAll('div')); //all divs
        window.console.log('div=>', this.template.querySelector('[data-second]')); //first divs
        window.console.log('data-id 2=>=>', this.template.querySelector('[data-id=second]'));
        window.console.log('data-id =>', this.template.querySelectorAll('[data-id]'));
    }
}