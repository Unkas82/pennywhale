namespace :tickets do
  desc 'Sends email about overdued tickets'

  task hande_overdued: :environment do
    overdueds = Ticket.opened.actual.where('due_date < ?', Time.current.to_date)

    OverduedTicketsMailer.send_alert(overdueds.ids).deliver_later
    overdueds.update_all(overdued: true)
  end
end
