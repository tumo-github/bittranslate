class InterpretService

  def self.perform(action, params)
    case action
    when 'en-pt' then TranslateService.new(params['text']).to_pt
    when 'pt-en' then TranslateService.new(params['text']).to_en
    else
      'Comando inválido - digite "help" para listar os camandos válidos'
    end
  end

end
