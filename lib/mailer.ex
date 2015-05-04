require Mailman

defmodule ICE.Mailer do

  @password Application.get_env(:password, :hetzner)

  def deliver(email) do
    {:ok, message} = Task.await Mailman.deliver(email, config)
    {:ok, _ } = Mailmain.Email.parse message
  end

  def config do
    
    %Mailman.Context{
      config:   %Mailman.SmtpConfig{ relay: "mail.hetzner.co.za", username: "dane.balia@hetzner.co.za",password: @password, port: 25 },
      composer: %Mailman.EexComposeConfig{}
    }
  end
end
