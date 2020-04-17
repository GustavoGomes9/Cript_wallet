# helpers globais
module ApplicationHelper 
  def date_pt(date_us)
    date_us.strftime('%d/%m/%Y')  # ajusta a data para versão brasileira
  end

  def env_pt(envf) 
    if envf == 'development' # Ajusta o nome do ambiente de produção do rails para pt-br
      'desenvolvimento'
    elsif envf == 'production'
      'produção'
    else
      'teste'
    end
  end
end