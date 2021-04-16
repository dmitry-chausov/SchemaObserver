import { LightningElement, wire } from 'lwc';
import getSObjectList from '@salesforce/apex/SObjectDropdownController.getSObjectList';
// Import message service features required for publishing and the message channel
import { publish, MessageContext } from 'lightning/messageService';
import sObjectSelected from '@salesforce/messageChannel/SObject_Selected__c';

export default class SObjectDropdown extends LightningElement {
  @wire(getSObjectList, {})
  sObjectList;
  @wire(MessageContext)
  messageContext;

  handleChange(event) {
    const payload = { sObjectName: event.detail.value };
    publish(this.messageContext, sObjectSelected, payload);
  }
}