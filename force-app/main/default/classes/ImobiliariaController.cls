public class ImobiliariaController {
    
    public Integer quartos {get; set;}
    public Integer banheiros {get; set;}
    public Integer salas {get; set;}
    public Integer copas {get; set;}
    public Integer suites {get; set;}
    public Integer garagem {get; set;}
    public Integer valor {get; set;}
    public String tipoImovel {get; set;}
    
    
    public List<SelectOption> getMyOptions() {
        
        Schema.DescribeFieldResult describeResult = Imoveis__c.Tipo_do_Imovel__c.getDescribe();
        
        List<Schema.PicklistEntry> entries = describeResult.getPickListValues();
        
        List<SelectOption> optionsToReturn = new List<SelectOption>();
        
        for (Schema.PicklistEntry pEntry : entries) {
            
            if (pEntry.isActive()) {
                optionsToReturn.add(new SelectOption(pEntry.getValue(), pEntry.getLabel()));
            }
        }
        
        return optionsToReturn;
    }
    
    public void salvarImoveis() {
        
        Imoveis__c imv = new Imoveis__c();
        
        imv.Quantidade_de_Quartos__c = quartos;
        imv.Banheiro__c = banheiros;
        imv.Sala__c = salas;
        imv.Copa__c = copas;
        imv.Suite__c = suites;
        imv.Garagem__c = garagem;
        imv.Valor__c = valor;
        imv.Tipo_do_Imovel__c = tipoImovel;
        
        try{
            if(imv.Tipo_do_Imovel__c != 'Nenhum' && imv.Tipo_do_Imovel__c != null)	{
                
            	ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.CONFIRM, 'Imóvel cadastrado com sucesso!'));
                
                insert imv;
                
                quartos = null;
                banheiros = null;
                salas = null;
                copas = null;
                suites = null;
                garagem = null;
                valor = null;
                tipoImovel = null;
                
            }else{
                ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'O campo tipo do imóvel deve ser preenchido!'));
            }
        	            
        }catch(DmlException e) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Por favor verifique todos os campos antes de enviar'));
		}
        
	}
}