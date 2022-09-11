global class VerificaDateModify {
    
    public class inputFlows {
        
        @InvocableVariable(label = 'Id do imóvel')
        public Id recordId;        
    }
    
    @invocableMethod(label = 'Verifica Imoveis com negligencia')
    public static void updateFieldNegligencia(List<inputFlows> inputs){
        
        List<Imoveis__c> imvList = new List<Imoveis__c>();
        
        for(inputFlows imvIn : inputs) {
            imvList.add([SELECT Id, LastModifiedDate, negligencia__c FROM Imoveis__c WHERE Id =: imvIn.recordId]);
        }
        System.debug('Lista de Imoveis: ' + imvList);
        
        for (Imoveis__c imv : imvList){
            
            Integer diasEntre = Date.valueOf(imv.LastModifiedDate).daysBetween(Date.today());
            
            System.debug('Dias entre: ' + diasEntre);
            
            if(diasEntre >= 3 && diasEntre <= 10 && (imv.Negligencia__c == '' || imv.Negligencia__c == null))
                imv.Negligencia__c = 'Negligência entre 3 a 10 dias';
            
            if(diasEntre >= 5 && diasEntre <= 15 && (imv.Negligencia__c != 'Negligência entre 5 a 15 dias'))
                imv.Negligencia__c = 'Negligência entre 5 a 15 dias';
            
            if(diasEntre > 15 && (imv.Negligencia__c != 'Negligência de 15 dias'))
                imv.Negligencia__c = 'Negligência de 15 dias';
            
            
        }
        update imvList;
        
	}

}