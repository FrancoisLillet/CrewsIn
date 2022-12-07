class DocsMailer < ApplicationMailer
  default from: 'crewsin@example.com'

  def send_summary_pdf(recipient)
    attachments['summary.pdf'] = pdf
    mail(to: recipient, subject: 'Summary PDF')
  end


end
