public class CallOutToSalesforceOrg {

    public static void getAccount(){
        Http http= new Http();
        Httprequest request = new Httprequest();
        request.setEndpoint('Callout:SFDCB/services/apexrest/accountmgmt/');
        request.setMethod('GET');
        
        Httpresponse response = http.send(request);
     //   System.debug('response '+ response.getBody());
       // System.debug('response Status'+ response.getStatusCode());
        if( response.getStatusCode() >=200 && response.getStatusCode() <=299){
          List<Object> results = (List<Object>) JSON.deserializeUntyped(response.getBody());
            for(Object obj: results){
                //system.debug(obj);
           
             Map<String,Object> AccountRecord = (Map<String,Object>) obj;
                system.debug(accountRecord.get('Industry'));
            }
        }else{
            System.debug('Error in Indtigration'+ response.getBody());
        }

    }
}