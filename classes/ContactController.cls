public class ContactController {
 
  
 private String sortOrder='FirstName';
    public List<Contact> getContacts(){
        list<Contact> results = Database.query(
            'SELECT Id, FirstName , LastName, Email ' +
            'FROM Contact '+
            'ORDER By '+ sortOrder +' ASC '+
            'LIMIT 10'
        );
        return results;
    }
    
    public void sortByLastName(){
        this.sortOrder ='Last Name';
    }
     public void sortByFirstName(){
        this.sortOrder ='First Name';
    } }