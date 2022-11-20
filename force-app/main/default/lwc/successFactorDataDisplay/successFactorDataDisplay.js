import { LightningElement, wire } from 'lwc';
import getUserData from '@salesforce/apex/HRIS_SuccessFactorToDoEntryV2.getUserData';

export default class SuccessFactorDataDisplay extends LightningElement {

    userdata;
    error;
    timetaken = 0;
    CATEGORYID = [14, 17, 18];
    renderUI = false;

    @wire(getUserData)
    wiredUserData({ error, data }) {
        if (data) {
            console.time("Std getUserData lwc processing");
            var startTime = performance.now();
            var tododata = JSON.parse(data);
            this.userdata = JSON.parse(data);
            console.log('Received the following userId:' + this.userdata.d.results[0].userId);
            console.timeEnd("Std getUserData lwc processing");
            this.timetaken = performance.now()
            this.error = undefined;
            var endTime = performance.now();
            this.showDeepLink();
        } else if (error) {
            this.error = error.body.message + '--' + error.body.stackTrace;
            console.log('Success Factor Error' + JSON.stringify(error));
            this.userdata = undefined;
        }
    }

    // get displayDeepLink() {
    //     this.userdata.d.results.forEach((element) => {
    //         if (this.CATEGORYID.includes(parseInt(element.categoryId))) {
    //             console.log(element);
    //             return true;
    //         } else {
    //             console.log(element);
    //             return false;
    //         }
    //     });
    // }

    get timeTakenForAPICall() {
        let minutes = Math.floor(this.timetaken / 60000);
        let seconds = ((this.timetaken % 60000) / 1000).toFixed(0);
        return minutes + " minutes " + (seconds < 10 ? '0' : '') + seconds + ' seconds';

    }


    showDeepLink() {

        this.userdata.d.results.forEach((element, index) => {
            if (this.CATEGORYID.includes(parseInt(element.categoryId))) {
                element.ShowDeepLink = true;

            } else {
                element.ShowDeepLink = false;
            }
            element.Id = element.userId + '-' + index;
        });
        //  this.renderUI = true;
        console.log(JSON.stringify(this.userdata));
    }


}