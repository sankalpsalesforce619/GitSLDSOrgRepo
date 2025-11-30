import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRST_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Contact.LastName';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';

export default class CreateRecordUsingLightningRecordForm extends LightningElement {
    objectApiName = CONTACT_OBJECT;
    myFields = [FIRST_NAME_FIELD, LAST_NAME_FIELD, PHONE_FIELD, EMAIL_FIELD];

    handleContactCreated(event) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Contact created: ' + event.detail.id,
                variant: 'success'
            })
        );
    }
}