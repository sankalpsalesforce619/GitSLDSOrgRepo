import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Contact.Name';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';

const FIELDS = [NAME_FIELD, EMAIL_FIELD, PHONE_FIELD, TITLE_FIELD];

export default class WireAdapterConfig extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    Contact;

    get name() {
        return this.Contact?.data?.fields?.Name?.value ?? '';
    }
    get email() {
        return this.Contact?.data?.fields?.Email?.value ?? '';
    }
    get phone() {
        return this.Contact?.data?.fields?.Phone?.value ?? '';
    }
    get title() {
        return this.Contact?.data?.fields?.Title?.value ?? '';
    }
}