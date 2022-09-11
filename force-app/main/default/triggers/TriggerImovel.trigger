trigger TriggerImovel on Imoveis__c (before insert, before update) {
    
    if(Trigger.isbefore && Trigger.isUpdate || Trigger.isInsert){
        
        ImovelTriggerHandler.insertOrUpdateNivel(Trigger.new);
        
    }

}