import { LightningElement, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { deleteRecord } from "lightning/uiRecordApi";
import { encodeDefaultFieldValues } from "lightning/pageReferenceUtils";

export default class SpeechToTextSynthesis2 extends NavigationMixin(LightningElement) {
    searchKey1 = "";
    searchKey2 = "";
    searchKey3 = "";
    searchKey4 = "";
    searchKey5 = "";
    _showSpinner = false;
    _recognition;
    defaultValues = {};


    connectedCallback() {

        //https://developer.mozilla.org/en-US/docs/Web/API/SpeechRecognition
        //https://developer.mozilla.org/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API
        //Browsers currently support speech recognition with prefixed properties. Therefore at the start of our code we include these lines to allow for both prefixed properties and unprefixed versions that may be supported in future:
        window.SpeechRecognition = window.webkitSpeechRecognition || window.SpeechRecognition;
        if ("SpeechRecognition" in window) {
            this._recognition = new webkitSpeechRecognition() || new SpeechRecognition();
            this._recognition.lang = 'en-US';
            // this._recognition.continuous = true;

        }
    }

    handleClick(event) {
        console.log('1', event.target.dataset.name);
        let textboxchecked = event.target.dataset.name;
        this._recognition.start();
        //When a result has been successfully recognized, the result event fires
        this._recognition.onresult = (event) => {
            const msg = event.results[0][0].transcript;
            this.handleSpeechRecognized(msg, textboxchecked);
        }
    }

    //Extract the text results and add it to the Chatter.
    handleSpeechRecognized(msg, buttonname) {

        this.searchKey = msg;
        switch (buttonname) {

            case 'Field1':
                this.searchKey1 = this.searchKey1 + ' ' + msg
                break;
            case 'Field2':
                this.searchKey2 = this.searchKey2 + ' ' + msg
                break;
            case 'Field3':
                this.searchKey3 = this.searchKey3 + ' ' + msg
                break;
            case 'Field4':
                this.searchKey4 = this.searchKey4 + ' ' + msg
                break;
            case 'Field5':
                this.searchKey5 = this.searchKey5 + ' ' + msg;
        }
    }

    handleClickToStop(event) {
        this._recognition.stop();
        console.log("Speech recognition has stopped.");
    }

}