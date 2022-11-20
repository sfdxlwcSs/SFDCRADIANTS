/**
 * @File Name          : lifeCycleHooksRenderCallBack.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 16-11-2022
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/18/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement,
    track
} from 'lwc';
import render1 from './render1.html';
import render2 from './render2.html';
import lifecycleHookRender from './lifeCycleHooksRenderCallBack.html';

export default class LifeCycleHooksRenderCallBack extends LightningElement {
    @track renderComp;

    render() {
        //https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.create_render
        //The returned value from the render() method must be a template reference, which is the imported default export from an HTML file.
        if (this.renderComp === 1) return render1;
        else if (this.renderComp === 2) return render2;
        return lifecycleHookRender;
    }

    renderDefault = () => {
        this.renderComp = 0;
    }
    renderFirst = () => {
        this.renderComp = 1;
    }
    renderSecond = () => {
        this.renderComp = 2;
    }
}