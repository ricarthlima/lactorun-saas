module ApplicationHelper
     #Para o login no modal!

    def resource_name
        :user
    end

    def resource
        @resource ||= User.new
    end

    def resource_class
      User
    end

    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end
    
    
    def tokenizar_flash_list(str)
        return str.split("\n")
    end
    
    def getVcrit(primeiraDistancia, primeiroTempo, segundaDistancia, segundoTempo, terceiraDistancia, terceiroTempo, quartaDistancia, quartoTempo)
        vcrit = 0

        step1 = (primeiraDistancia * primeiroTempo) + (segundaDistancia * segundoTempo) + (terceiraDistancia * terceiroTempo) + (quartaDistancia * quartoTempo)
        step2 = (primeiraDistancia + segundaDistancia + terceiraDistancia + quartaDistancia) * (primeiroTempo + segundoTempo + terceiroTempo + quartoTempo)
        step3 = ((primeiroTempo ** 2) + (segundoTempo ** 2) + (terceiroTempo ** 2) + (quartoTempo ** 2))
        step4 = ((primeiroTempo + segundoTempo + terceiroTempo + quartoTempo) ** 2)
    
        vcrit = (step1 * 4 - step2)/(step3 * 4 - step4)
        
        return vcrit
    end
    
    def getMFEL(primeiraDistancia, primeiroTempo, segundaDistancia, segundoTempo, terceiraDistancia, terceiroTempo, quartaDistancia, quartoTempo)
        vcrit = getVcrit(primeiraDistancia, primeiroTempo, segundaDistancia, segundoTempo, terceiraDistancia, terceiroTempo, quartaDistancia, quartoTempo)
        
        mfel = 0;
        vcritx = vcrit * 3.6;
        mfel = ((0.9673 * vcritx) + 0.2061);
        mfel = mfel / 3.6;
        
        return mfel;
    end
end
