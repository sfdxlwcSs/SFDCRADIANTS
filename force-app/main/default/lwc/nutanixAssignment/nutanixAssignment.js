import { LightningElement } from 'lwc';

// *  API Base URL
const OMDBAPI_URL = 'http://www.omdbapi.com/';
const APIKEY = '9bd2e7df';

export default class NutanixAssignment extends LightningElement {

    _urltosend = '';
    //INPUT FROM USER
    _user_input = '';
    _apiresponse = '';

    handleInputChange(event) {
        this._user_input = event.detail.value;
    }

    clickedButtonLabel;

    handleClick(event) {
        this._urltosend = OMDBAPI_URL + '?t=' + this._user_input + '&apikey=' + APIKEY;

        fetch(this._urltosend)
            .then(response => response.json())
            .then(data =>
                this._apiresponse = data
            )
    }
}