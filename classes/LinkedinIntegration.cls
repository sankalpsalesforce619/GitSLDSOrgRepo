public class LinkedinIntegration {

    public static void loginToLinkedin(){
        Http http = new http();
        Httprequest request = new Httprequest();
        request.setMethod('GET');    //named credential
        request.setEndPoint('callout:Linkedin/v2/me'); //v2/me

         Httpresponse response = http.send(request);
      //  system.debug('response '+ response.getBody());
      //  system.debug('response '+ response.getStatusCode());
       Map<String,Object> result= (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
      //  List<Object> records = (List<Object>) JSON.deserializeUntyped(response.getBody());
        String LoginId = (String) result.get('id');
        system.debug('login ID' + LoginId );
        


    }

}