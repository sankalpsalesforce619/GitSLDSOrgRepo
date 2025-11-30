import { LightningElement } from 'lwc';

export default class RenderingListForEach extends LightningElement {

    contacts = [
        {
           Id: 1,
        Name : 'sankalp',
        Title : 'Developer'
        },
        {
            Id: 2,
            Name : 'sanjay',
            Title: 'instructor',
            
        },
         {
            Id: 3,
            Name : 'rahul',
            Title: 'Tester',
         },
         {
            Id: 4,
            Name : 'anil',
            Title: 'Manager',
         }
        
    
    ];
}