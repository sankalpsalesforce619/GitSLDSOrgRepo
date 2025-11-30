import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContController.getContactList';

export default class WireApexMethodToComponent extends LightningElement {

    @wire(getContactList) contacts;

}