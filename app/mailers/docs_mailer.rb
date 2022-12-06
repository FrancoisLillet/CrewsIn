class DocsMailer < ApplicationMailer
  default from: 'crewsin@example.com'

  def send_summary_pdf(recipient)
    pdf = generate_summary_pdf # generate the PDF using the prawn gem
    attachments['summary.pdf'] = pdf
    mail(to: recipient, subject: 'Summary PDF')
  end


end
