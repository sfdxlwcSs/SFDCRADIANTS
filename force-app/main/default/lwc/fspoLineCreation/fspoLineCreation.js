/**
 * @File Name          : fspoLineCreation.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/26/2020, 3:06:52 PM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/26/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    track
} from 'lwc';


const columns = [{
        label: 'Label',
        fieldName: 'name'
    },
    {
        label: 'Website',
        fieldName: 'website',
        type: 'url'
    },
    {
        label: 'Phone',
        fieldName: 'phone',
        type: 'phone'
    },
    {
        label: 'Balance',
        fieldName: 'amount',
        type: 'currency'
    },
    {
        label: 'CloseAt',
        fieldName: 'closeAt',
        type: 'date'
    },
    {
        label: 'CloseAt',
        fieldName: 'closeAt',
        type: 'date'
    },
    {
        label: 'CloseAt',
        fieldName: 'closeAt',
        type: 'date'
    },
    {
        label: 'CloseAt',
        fieldName: 'closeAt',
        type: 'date'
    },
    {
        label: 'CloseAt',
        fieldName: 'closeAt',
        type: 'date'
    },
    {
        label: 'CloseAt',
        fieldName: 'closeAt',
        type: 'date'
    },
    {
        label: 'CloseAt',
        fieldName: 'closeAt',
        type: 'date'
    },
    {
        label: 'CloseAt',
        fieldName: 'closeAt',
        type: 'date'
    },
    {
        label: 'Long Column Name Handled',
        fieldName: 'closeAt',
        type: 'date'
    },
    {
        label: 'CloseAt',
        fieldName: 'closeAt',
        type: 'date'
    },
    {
        label: 'CloseAt',
        fieldName: 'closeAt',
        type: 'date'
    },
    {
        label: 'CloseAt',
        fieldName: 'closeAt',
        type: 'date'
    },
    {
        label: 'CloseAt',
        fieldName: 'closeAt',
        type: 'date'
    },
    {
        label: 'CloseAt',
        fieldName: 'closeAt',
        type: 'date'
    },
];

export default class FspoLineCreation extends LightningElement {

    @track data = [];
    @track columns = columns;

}