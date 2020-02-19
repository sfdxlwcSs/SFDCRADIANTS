/**
 * @File Name          : directives.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/19/2020, 9:52:07 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/19/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';

export default class Directives extends LightningElement {
    contacts = [{
            Id: 1,
            Name: 'Amy Taylor',
            Title: 'VP of Engineering',
        },
        {
            Id: 2,
            Name: 'Michael Jones',
            Title: 'VP of Sales',
        },
        {
            Id: 3,
            Name: 'Jennifer Wu',
            Title: 'CEO',
        },
    ];

    testDom() {
        let anc = document.createElement('a');
        let text = document.createTextNode('Testing DOM.....');
        anc.appendChild(text);
        //works but throws error -should avoid manual dom directive
        this.template.querySelector('[data-test-dom]').appendChild(anc);
    }
    testDomManual() {
        let anc = document.createElement('a');
        let text = document.createTextNode('Manual DOM modified.....');
        anc.appendChild(text);
        //works but throws error -should avoid manual dom directive
        this.template.querySelector('[data-dom-manual]').appendChild(anc);
    }

}