import { LightningElement, wire } from "lwc";
import getSObjectDescription from '@salesforce/apex/SObjectGeneralInformationController.getSObjectDescription';
import {
  subscribe,
  APPLICATION_SCOPE,
  MessageContext
} from 'lightning/messageService';
import sObjectSelected from '@salesforce/messageChannel/SObject_Selected__c';

export default class SObjectInformation extends LightningElement {
  @wire(getSObjectDescription, { sObjectName: '$sObjectName' })
  sObjectDescription;
  @wire(MessageContext)
  messageContext;
  sObjectName;
  connectedCallback() {
    this.subscribeToMessageChannel();
  }
  // Encapsulate logic for Lightning message service subscribe
  subscribeToMessageChannel() {
    if (!this.subscription) {
      this.subscription = subscribe(
        this.messageContext,
        sObjectSelected,
        (message) => this.handleMessage(message),
        { scope: APPLICATION_SCOPE }
      );
    }
  }
  handleMessage(message) {
    this.sObjectName = message.sObjectName;
  }
}