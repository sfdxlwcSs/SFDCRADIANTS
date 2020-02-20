/**
 * @File Name          : reactiveChangeHandlers.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/20/2020, 9:52:41 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/20/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    api,
    track
} from 'lwc';

export default class ReactiveChangeHandlers extends LightningElement {
    @track trackedArray = [{
        name: 'default'
    }];

    modifyTrackedArray() {
        this.trackedArray = [{
                name: 'new val 1'
            },
            {
                name: 'new val 2'
            }
        ];
    }
}