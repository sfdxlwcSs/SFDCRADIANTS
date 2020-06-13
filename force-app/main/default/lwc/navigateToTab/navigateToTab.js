/**
 * @File Name          : navigateToTab.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 23/4/2020, 7:35:22 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    23/4/2020   Somnath Sharma     Initial Version
**/
import { LightningElement, api} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class NavigateToTab extends NavigationMixin(LightningElement){
    @api tabName;
    @api label;
    navigateNext() {
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: 'LWC_Container',
            },
            state: {
                defaultFieldValues: 'Test Value'
            }
        });
    }
}