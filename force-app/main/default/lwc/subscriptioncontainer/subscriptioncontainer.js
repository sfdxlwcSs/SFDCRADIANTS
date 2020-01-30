/**
 * @File Name          : subscriptioncontainer.js
 * @Description        : 
 * @Author             : Somnath Sharma
 * @Group              : 
 * @Last Modified By   : Somnath Sharma
 * @Last Modified On   : 23/1/2020, 9:14:11 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    12/17/2019   Somnath Sharma     Initial Version
 **/
import {
  LightningElement,
  wire,
  track
} from 'lwc';
//import method from the Apex Class
import getCallerUserfollowings from '@salesforce/apex/SubscriptionDetailsPerUser.getCallerUserfollowings';
import unSubscribe from '@salesforce/apex/SubscriptionDetailsPerUser.unSubscribe';
// importing to refresh the apex if any record changes the datas
import {
  refreshApex
} from '@salesforce/apex';
import {
  ShowToastEvent
} from "lightning/platformShowToastEvent";
import {
  NavigationMixin
} from 'lightning/navigation';

export default class Subscriptioncontainer extends NavigationMixin(LightningElement) {

  /** Wired Apex result so it can be refreshed programmatically */
  wiredEntityWrapper;
  @track value = 'All';
  @track showspinner = true;
  @track options = [{
    label: 'All',
    value: 'All'
  }];
  _dataStore = []; //All data
  @track error;
  //data source property for datatable
  @track allEntityData = [];
  defaultValue = 'All'
  dropDownValueCurrent = 'All';
  @wire(getCallerUserfollowings)
  wiredAllEntityData(result) {
    this.wiredEntityWrapper = result;
    //  window.console.log('entityDataRaw', JSON.stringify(result));
    if (result.data) {
      //  window.console.log('wireServiceData', JSON.stringify(result.data));
      //reset when refreshApex called
      if (this.allEntityData.length > 0) {
        this.allEntityData.length = 0;
        this._dataStore.length = 0;
        this.options.length = 0;
        this.options.push({
          label: 'All',
          value: 'All'
        });
      }
      for (let key in result.data) {
        if (result.data.hasOwnProperty(key)) {
          //populate options
          this.options.push({
            label: key,
            value: key
          });
          this.options.sort();
          this.allEntityData.push({
            value: result.data[key].map(entitydata => {
              let dupentitydata = {
                ...entitydata
              };
              dupentitydata.Id = dupentitydata.entityId;
              return dupentitydata;
            }),
            key: key
          }); //Here we are creating the array to show on UI.
        }
      }
      this._dataStore = this.allEntityData;
      //  window.console.log('wireServiceDataRefined', JSON.stringify(this._dataStore));
      this.showspinner = false;
      this.error = undefined;
    } else if (result.error) {
      this.error = result.error;
      this.allEntityData = undefined;
    }
  }
  //on row actions datatable
  actions = [{
    label: 'View',
    name: 'View'
  }];
  // Declaring the columns in  datatable   	
  _entitycolumns = [{
      fieldApi: 'recName',
      sortable: false,
      label: 'Name',
      fieldName: 'recName',
      type: 'String',
      title: {
        fieldName: 'ParentId'
      }
    },
    {
      fieldApi: 'followedDate',
      sortable: false,
      label: 'Follow Date',
      fieldName: 'followedDate',
      type: 'Date',
      title: {
        fieldName: 'Follow Date'
      }
    },
    {
      type: 'action',
      typeAttributes: {
        rowActions: this.actions,
        menuAlignment: 'auto'
      }
    }
  ];

 
  handleChange(event) {
    //  window.console.log('dropdownValue', event.detail.value);
    this.dropDownValueCurrent = event.detail.value;
    this.showspinner = true;
    this.getDataBasedOnKey(event.detail.value);
  }
  //get data based on drop down value from data store array
  getDataBasedOnKey(dropDownValue) {
    let matchFound = this._dataStore.find(item => item.key === dropDownValue);
    if (matchFound) {
      this.allEntityData = [matchFound];
    } else {
      this.allEntityData = [...this._dataStore];
    }
    this.showspinner = false;
  }


  unSubscribeChecked(event) {
    let toSortEntities = [];
    let targetEntity = event.currentTarget.title;

    window.console.log(event.detail.selectedRows);
    //All use case If
    if (this.dropDownValueCurrent === this.defaultValue) {
      this.template.querySelectorAll("lightning-datatable").forEach(element => {
        //simplification of array to be formed
        if (element.selectedRows.length > 0) {
          element.selectedRows.forEach(individualElements => {
            toSortEntities = [...toSortEntities, individualElements];
          });

        }

      });
    } else {
      this.getSelected(event.currentTarget.title);

    }
    window.console.log('rowsSelected' + toSortEntities);
    if (toSortEntities.length > 0) {
      this.sortBasedOnKey(targetEntity, toSortEntities);
    }
  }
  getSelected(selectedEntity) {
    let arrayOfEntityIdsSelected = [];
    let el = this.template.querySelector('lightning-datatable');
    let selectedRowsDetail = el.getSelectedRows();
    window.console.log('selectedRowsDetail' + selectedRowsDetail);
    if (selectedRowsDetail.length > 0) {
      selectedRowsDetail.forEach(row => {
        arrayOfEntityIdsSelected = [...arrayOfEntityIdsSelected, row.Id];
      });
      this.unSubscribeEntities(arrayOfEntityIdsSelected, selectedEntity);
    }
  }

  sortBasedOnKey(selectedEntity, allSelectedRows) {
    let finalRowsSorted = [];
    let rowsBasedOnButtonClicked = this._dataStore.find(item => item.key === selectedEntity);
    allSelectedRows.forEach(rowsChecked => {
      rowsBasedOnButtonClicked.value.forEach(elementBasedOnKey => {
        if (rowsChecked === elementBasedOnKey.Id) {
          finalRowsSorted = [...finalRowsSorted, rowsChecked];
        }
      });

    });
    window.console.log('finalRowsSorted' + finalRowsSorted);

    if (finalRowsSorted.length > 0) {
      this.unSubscribeEntities(finalRowsSorted, selectedEntity);
    } else {
      this.showToast('info', selectedEntity, 'Error');
    }
  }
  unSubscribeEntities(matchedEntitiesArray, entityName) {

    const success = 'UnSubscribed';
    //pass entityIds arrays
    unSubscribe({
        entityIds: matchedEntitiesArray
      })
      .then(result => {
        if (result === success) {
          this.showspinner = true;
          this.showToast('Success', entityName, 'Success');
        }
        return refreshApex(this.wiredEntityWrapper);
      })
      .catch(error => {
        this.error = error;
      });
  }


  showToast(messageType, entityName, msg) {
    let message = (messageType === 'Success' ? 'Selected ' + entityName + '-Records Unfollowed' :
      'No ' + entityName + ' Records Selected');
    const evt = new ShowToastEvent({
      title: msg,
      message: message,
      variant: messageType
    });
    this.dispatchEvent(evt);
  }

  handleRowAction(event) {
    var action = event.detail.action.name;
    var row = event.detail.row;
    window.console.log('action', JSON.stringify(action));
    window.console.log('row', JSON.stringify(row));
    switch (action) {
      case 'View':
        this.viewCurrentRecord(row);
        break;

      default:
        /* code */
        break;
    }
  }

  viewCurrentRecord(currentRow) {
    const recordId = currentRow.parentId;
    const apiNameObject = currentRow.recObjectAPI;
    window.console.log('recordView', JSON.stringify(currentRow));

    this[NavigationMixin.Navigate]({
      type: 'standard__recordPage',
      attributes: {
        recordId: recordId,
        objectApiName: apiNameObject,
        actionName: 'view'
      }
    });
  }

}