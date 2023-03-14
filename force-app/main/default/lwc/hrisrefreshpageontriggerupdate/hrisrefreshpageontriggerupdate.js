/**
 * @description       : 
 * @author            : Somnath Sharma
 * @group             : 
 * @last modified on  : 14-03-2023
 * @last modified by  : Somnath Sharma
**/
import { LightningElement, api } from 'lwc';
import {
    subscribe,
    unsubscribe,
    onError,
    setDebugFlag,
    isEmpEnabled,
} from 'lightning/empApi';
import { notifyRecordUpdateAvailable } from 'lightning/uiRecordApi';
//Indicates what point in the stream to replay events from. Specify -1 to get new events from the tip of the stream, -2 to replay from the last saved event, or a specific event replay ID to get all saved and new events after that ID.
const replayId = -1;

export default class Hrisrefreshpageontriggerupdate extends LightningElement {

    recordId = '';
    channelName = '/event/RecordRefreshEvent__e';
    isSubscribeDisabled = false;
    isUnsubscribeDisabled = !this.isSubscribeDisabled;

    subscription = {};

    // Tracks changes to channelName text field
    handleChannelName(event) {
        this.channelName = event.target.value;
    }
    // Initializes the component
    connectedCallback() {

        this.handleSubscribe();
        // Register error listener
        this.registerErrorListener();

    }

    // Handles subscribe button click
    handleSubscribe = () => {

        // Callback invoked whenever a new event message is received
        const messageCallback = (response) => {
            console.log('New message received: ', JSON.stringify(response));
            this.processChangeEvent(response);
            // Response contains the payload of the new message received
        };

        // Invoke subscribe method of empApi. Pass reference to messageCallback
        subscribe(this.channelName, replayId, messageCallback).then((response) => {
            // Response contains the subscription information on subscribe call
            console.log(
                'Subscription request sent to: ',
                JSON.stringify(response.channel)
            );
            //'{"id":"_1678809177395_5085","channel":"/event/RecordRefreshEvent__e","replayId":-1}'
            this.subscription = response;

        });


    }

    // Called by registerSubscribe()
    processChangeEvent(changeEvent) {
        try {
            this.recordId = changeEvent.data.payload.RecordId__c;
            notifyRecordUpdateAvailable([{ recordId: this.recordId }]);

        } catch (err) {
            console.error(err);
        }
    }

    registerErrorListener() {
        // Invoke onError empApi method
        onError((error) => {
            console.log('Received error from server: ', JSON.stringify(error));
            // Error contains the server-side error
        });
    }


}