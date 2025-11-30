import Title from '@salesforce/schema/Contact.Title';
import { LightningElement,api } from 'lwc';

export default class HelloBinding extends LightningElement {

     @api recordId;
    @api objectApiName;
    @api fields;
    field=['AccountId','Name','Phone','Title','Email'];
     
    firstName = '';
    lastName='';

    handelChange(event){
        const field = event.target.name;
        if(field === 'firstName'){
            this.firstName=event.target.value;
        }
        else if(field==='lastName'){
            this.lastName=event.target.value;
        }
    }

    get UppercasedFullName(){
        return `${this.firstName} ${this.lastName}`.toUpperCase();
    }



}