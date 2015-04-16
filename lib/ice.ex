require Logger
require Mailman

defmodule ICE do

  @third_party Application.get_env(:provider, :third_party_mailer)

  def main(_args) do
    Logger.info "Hello World!"
    Logger.info "Using #{@third_party} for sending mail"
    ICE.Mailer.deliver testing_email
  end

  def testing_email do
    %Mailman.Email{
      subject: "Hello Mailman!",
      from: "dane.balia@hetzner.co.za",
      to: [ "dane.balia@hetzner.co.za" ],
      data: [
        name: "Yo"
      ],
      html: "<html><body><b>Hello - Test from Elixir! </b></body></html>"
    }
  end
end
