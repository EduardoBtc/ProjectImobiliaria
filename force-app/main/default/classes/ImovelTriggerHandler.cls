public class ImovelTriggerHandler {
    
    public static void insertOrUpdateNivel(List<Imoveis__c> imovel) {
		
        List<Imoveis__c> imvValor = imovel;
        
        for(Imoveis__c imv : imvValor)   {
			
            if(imv.Valor__c <= 5000)
                imv.Nivel_do_Imovel__c = 'Bronze';
                
            if(imv.Valor__c >= 50000 && imv.Valor__c < 100000)
                imv.Nivel_do_Imovel__c = 'Prata';
        
            if(imv.Valor__c >= 100000)
                imv.Nivel_do_Imovel__c = 'Ouro';
        }
    }

}