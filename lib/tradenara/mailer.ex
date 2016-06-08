defmodule Tradenara.Mailer do
  use Mailgun.Client,
    domain: Application.get_env(:tradenara, :mailgun_domain),
    key: Application.get_env(:tradenara, :mailgun_key)


  def send_welcome_text_email(email_address) do
    send_email to: email_address,
      from: "us@example.com",
      subject: "Welcome!",
      text: "Welcome to SourceKorea!"
  end
end
