/**
 * @File Name          : lifeCycleHooks.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 05-12-2022
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/18/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    track
} from 'lwc';

export default class LifeCycleHooks extends LightningElement {

    myString;

    changeString() {
        this.myString = 'String 2';
    }
    removeString() {
        this.myString = '';
    }

    constructor() {
        super();
        this.dummyVariable = 'Test';
        //error will come if we try 
        // Assert Violation: this.template.querySelectorAll() cannot be called during the construction of the custom element
        // for [object: vm undefined(12)] because no content has been rendered yet.
        // window.console.log(this.template.querySelectorAll('h1'));
        window.console.log('Constructor');
    }

    connectedCallback() {
        //even here it will be not be there
        window.console.log('connected');
        //check element identification ----------which hook is invoked ones
        window.console.log(this.template.querySelectorAll('h1'));

    }
    disconnectedCallback() {
        //check element identification ----------which hook is invoked ones
        window.console.log('lenght', this.template.querySelectorAll('h1').length);
        window.console.log(this.template.querySelector('h1'));
        window.console.log('disconnected');
    }

    renderedCallback() {
        // every change will call me remmber
        //but i will have h1
        window.console.log('renderedcallback parent');

        //only WHEN YOU NEED TO RED THE DOM
        //OR USE CONNECTEDCALLBACK
        if (!this.INIT_DONE) {
            window.console.log('renderedcallback');
            //check element identification ----------which hook is invoked ones
            window.console.log(this.template.querySelectorAll('h1'));
            this.INIT_DONE = true;
        }

    }
    hideDiv() {
        const element = this.template.querySelector('[data-id="guidance"]');
        element.style.setProperty('--modalHeight', 'none');
    }

}