/**
 * @File Name          : trainingComponent.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/17/2020, 11:28:05 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/17/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    track
} from 'lwc';

export default class TrainingComponent extends LightningElement {
    @track data = [{
            country: 'China',
            pop: 1409517397,
        },
        {
            country: 'India',
            pop: 1339180127,
        },
        {
            country: 'USA',
            pop: 324459463,
        },
        {
            country: 'Indonesia',
            pop: 263991379,
        }
    ];

    showIndiaPopulation() {
        this.data.forEach(pop => {
            pop.IsIndia = pop.country === 'India';
        });
        // 0: {
        //     country: "China",
        //     pop: 1409517397,
        //     IsIndia: false
        // }
        // 1: {
        //     country: "India",
        //     pop: 1339180127,
        //     IsIndia: true
        // }
        // 2: {
        //     country: "USA",
        //     pop: 324459463,
        //     IsIndia: false
        // }
        // 3: {
        //     country: "Indonesia",
        //     pop: 263991379,
        //     IsIndia: false
        // }
        window.console.log('Modified array->', JSON.stringify(this.data));
    }
}