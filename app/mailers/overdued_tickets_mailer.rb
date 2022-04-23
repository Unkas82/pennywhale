class OverduedTicketsMailer < ApplicationMailer
  def send_alert(overdued_ticket_ids)
    @overdued_tickets = Ticket.find(overdued_ticket_ids)

    mail(to: 'chintan@pennywhale.com' , subject: 'Overdued tickets report')
  end
end
