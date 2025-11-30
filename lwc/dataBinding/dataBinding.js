import { LightningElement } from 'lwc';

export default class DataBinding extends LightningElement {
  firstName = '';
  lastName = '';

  handelChange() {
    const inputs = this.template.querySelectorAll('lightning-input');
    inputs.forEach((element) => {
      if (element.name === 'fname') {
        this.firstName = element.value;
      } else if (element.name === 'lname') {
        this.lastName = element.value;
      }
    }, this);
  }

}

   
   
   /*
   firstname = '';
    lastname = '';

    handelChange(event) {
        const field = event.target.name;
        if (field === 'fname') {
            this.firstname = event.target.value;
        } else if (field === 'lname') {
            this.lastname = event.target.value;
        }
    }

    // getter
    get uppercasefullname() {
        return `${this.firstname} ${this.lastname}`.toUpperCase();
    }

   /* name='';
   handelChange(event) {
        this.name = event.target.value;
    }*/