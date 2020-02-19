/**
 * @File Name          : lifeCycleHookErrorCallBack.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 2/18/2020, 11:56:46 AM
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    2/18/2020   Somnath Sharma     Initial Version
 **/
import {
    LightningElement
} from 'lwc';

export default class LifeCycleHookErrorCallBack extends LightningElement {
    //safe guard of life cycle hooks--try commenting this and try application will stop the flow
    errorCallback(error, stack) {
        window.console.log('errorCallBack=>', error.message, error, stack);
        // errorCallBack => Error from Grand Child Connected Call Back Error: Error from Grand Child Connected Call Back
        // at LifeCycleHookErrorCallBackGrandChild.connectedCallback(lifeCycleHookErrorCallBack.js: 22)
        // at callHook(engine.js: 5473)
        // at engine.js: 4151
        // at runWithBoundaryProtection(engine.js: 6106)
        // at invokeComponentCallback(engine.js: 4149)
        // at runConnectedCallback(engine.js: 5758)
        // at appendVM(engine.js: 5507)
        // at insertCustomElmHook(engine.js: 2979)
        // at Object.insert(engine.js: 3305)
        // at createChildrenHook(engine.js: 3080) < webruntime - app >
        //     <
        //     localdevserver - layout >
        //     <
        //     webruntime - router - container >
        //     <
        //     localdevserver - preview >
        //     <
        //     localdevserver - layout - section >
        //     <
        //     c - life - cycle - hook - error - call - back >
        //     <
        //     c - life - cycle - hook - error - call - back - child >
        //     <
        //     c - life - cycle - hook - error - call - back - grand - child >
        //     
    }
}