import { LightningElement, track, wire, api } from 'lwc';
import queryAccRecs from '@salesforce/apex/BUlkAPIControllerLWC.queryAccRecs';

const columns = [
    { label: 'Record Index', fieldName: 'index', type: 'number' },
    { label: 'Record Name', fieldName: 'recordName', type: 'text' }
];

export default class BulkAPIPagination extends LightningElement {
    @track accRecsWrapper = [];
    @track nextLocator=null;
    @track disablePrevious = true;
    @track clickTracker = 0;

    columns = columns;

    @wire(queryAccRecs, { nextLocator: '$nextLocator' })
    wiredRecords({ error, data }) {
        if (data) {
            this.accRecsWrapper = data;
        } else if (error) {
            console.error('Error fetching records: ', error);
        }
    }

    next() {
        this.clickTracker++;
        this.disablePrevious = false;
        this.nextLocator = this.accRecsWrapper[this.accRecsWrapper.length - 1].recordId;
    }

    previous() {
        this.clickTracker--;
        if (this.clickTracker === 0) {
            this.disablePrevious = true;
        }
        this.nextLocator = this.accRecsWrapper[0].recordId;
    }
}