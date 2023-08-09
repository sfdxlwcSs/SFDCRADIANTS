import { LightningElement, track } from 'lwc';
import { createMessageContext, releaseMessageContext, APPLICATION_SCOPE, subscribe, unsubscribe } from 'lightning/messageService';
import SAMPLEMC from "@salesforce/messageChannel/lightningMessenger__c";
import NAME_FIELD from '@salesforce/schema/Account.Name';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
export default class Subscriber_lwc extends LightningElement {

    /*  For Lightning web components, you can define the scope of where subscribing components receive messages in your application 
    only when using @wire(MessageContext).
  To receive messages on a message channel from anywhere in the application, import APPLICATION_SCOPE from lightning/messageService. 
  Then, call subscribe() and pass { scope: APPLICATION_SCOPE } for the optional fourth subscriberOptions parameter.
  Receiving messages from the active area is the default behavior. 
  You don’t need to include the scope property to limit scope to the active area.*/

    context = createMessageContext();
    subscription = null;
    @track receivedMessage = '';
    @track accountId;
    @track objectApiName = 'Account';
    fields = [NAME_FIELD, REVENUE_FIELD, INDUSTRY_FIELD];
    connectedCallback() {
        this.subscribeMC();
    }
    subscribeMC() {
        if (!this.subscription) {

            this.subscription = subscribe(this.context, SAMPLEMC, (message) => {
                this.handleMessage(message);
            }, { scope: APPLICATION_SCOPE });
        }
    }
    handleMessage(message) {
        console.log('message:::' + JSON.stringify(message));
        this.accountId = message.recordId;
        this.receivedMessage = message ? message.recordData.value : 'no message payload';
    }
}