import { LightningElement, api } from 'lwc';

export default class PriPubDemo extends LightningElement {

    message = 'public property'; 
    @api recordId;

}