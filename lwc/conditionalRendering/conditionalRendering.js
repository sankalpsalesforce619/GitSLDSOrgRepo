import { LightningElement } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    areDetailsVisibal = false;

    handelChange(event){
        this.areDetailsVisibal = event.target.checked;
    }
}