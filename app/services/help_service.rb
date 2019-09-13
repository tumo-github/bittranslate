class HelpService

  def self.perform
    response  = <<~EOF
      <b>### Comandos para tradução###</b>

      <code>para português: X</code>
      <i>Faz a tradução de X, ou tudo que estiver depois de :, para português</i>

      <code>para inglês: X</code>
      <i>Faz a tradução de X,ou tudo que estiver depois de :, para inglês</i>
      EOF

    response
  end

end
