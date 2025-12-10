import { LightningElement, wire } from 'lwc';
import createTestObject from '@salesforce/apex/TestObjectCreator.createTestObject';
import getTestObjects from '@salesforce/apex/TestObjectCreator.getTestObjects';

export default class TestObjectManager extends LightningElement {
    name = '';
    status = '';
    recordId;
    error;
    records;

    handleNameChange(event) {
        this.name = event.target.value;
    }

    handleStatusChange(event) {
        this.status = event.target.value;
    }

    async createRecord() {
        try {
            const result = await createTestObject({ name: this.name, status: this.status });
            this.recordId = result;
            this.error = undefined;
        } catch (err) {
            this.error = err.body.message;
            this.recordId = undefined;
        }
    }

    @wire(getTestObjects)
    wiredRecords({ error, data }) {
        if (data) {
            this.records = data;
            this.error = undefined;
        } else if (error) {
            this.error = error.body.message;
            this.records = undefined;
        }
    }
}