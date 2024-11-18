require 'discordrb'

ChannelID = 715674388329922640

Bot = Discordrb::Commands::CommandBot.new(
    token: Rails.application.credentials.dig(:discord, :token),
    client_id: Rails.application.credentials.dig(:discord, :client_id),
    prefix: "/"
)

# Bot.message(content: 'Ping') do |event|
#     event.respond 'Message Pong!'
# end

# Bot.command(:ping) do |event|
#     event.respond 'Command Pong!'
# end

# Dir["#{Rails.root}/app/commands/*.rb"].each { |file| require file }
# Bot.run(true)

# puts "Invite URL: #{Bot.invite_url}"