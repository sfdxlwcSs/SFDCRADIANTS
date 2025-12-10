import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';//In practice, you should treat the support as up to 5 levels of parent-to-parent traversal, similar to SOQL parent traversal.

// We’ll request fields by API name strings and read values from data.fields.*
const FIELDS = [
    'Loan__c.OwnerId',
    'Loan__c.Owner.Name',
    'Loan__c.Owner.Email',
    'Loan__c.Owner.Username'
];
// In JavaScript, static properties belong to the class, not to individual component instances.
//So you can access it like:AccessingRelationship.GROUP_PREFIX
export default class AccessingRelationship extends LightningElement {
    @api recordId; // This is automatically set when the component is placed on a record page

    ownerId;
    ownerName;
    ownerEmail;
    ownerUsername;

    loaded = false;
    error;

    static USER_PREFIX = '005'; // User
    static GROUP_PREFIX = '00G'; // Queue/Group

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    wiredLoan({ data, error }) {
        if (data) {
            console.log(JSON.stringify(data));
            // Access values directly, no getFieldValue helper
            this.ownerId       = data.fields.OwnerId?.value;
            this.ownerName     = data.fields.Owner?.value?.fields?.Name?.value;
            this.ownerEmail    = data.fields.Owner?.value?.fields?.Email?.value;
            this.ownerUsername = data.fields.Owner?.value?.fields?.Username?.value;

            this.error = undefined;
            this.loaded = true;
        } else if (error) {
            this.loaded = false;
            this.error = error;
            this.ownerId = this.ownerName = this.ownerEmail = this.ownerUsername = undefined;
        }
    }

    // ===== UI helpers =====
    get ownerUrl() {
        return this.ownerId ? `/${this.ownerId}` : '';
    }

    get mailtoLink() {
        return this.ownerEmail ? `mailto:${this.ownerEmail}` : '';
    }

    get isUserOwner() {
        return this.ownerId?.startsWith(AccessingRelationship.USER_PREFIX);
    }

    get isQueueOwner() {
        return this.ownerId?.startsWith(AccessingRelationship.GROUP_PREFIX);
    }

    get ownerTypeLabel() {
        if (this.isUserOwner) return 'User';
        if (this.isQueueOwner) return 'Queue';
        return 'Owner';
    }

    get showUsername() {
        // Only Users have a Username
        return this.isUserOwner && !!this.ownerUsername;
    }

    get iconName() {
        return this.isUserOwner ? 'standard:user' : 'standard:queue';
    }

    get errorMessage() {
        return (this.error && (this.error.body?.message || this.error.statusText)) || 'Unable to load owner details.';
    }
}