require "discordrb/webhooks"

class DiscordAlbumService
    WEBHOOK_URL = Rails.application.credentials.dig(:discord, :webhook_url)

    def initialize(album, url)
        @album = album
        @url = url
    end

    def call
        client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)

        client.execute do |builder|
          builder.content = "A new XFD has been posted"
          builder.add_embed do |embed|
            embed.title = "#{@album.name}"
            embed.url = "#{@album.crossfades.first.link}"
            embed.description = "Genres: #{buildGenresList(@album.genres)}"
            embed.timestamp = Time.now
            if @album.folder.url
                embed.image = Discordrb::Webhooks::EmbedImage.new(url: @album.folder.url)
            end
            embed.add_field(name: "Circle", value: @album.circle.name)
            embed.add_field(name: "Events", value: buildEventsList(@album.events))
            # embed.add_field(name: 'XFD', value: buildCrossfadesList(@album.crossfades))
          end
        end

      # message = buildMessage()
      # puts "MESSAGE: " + message
      # Bot.send_message(ChannelID, message)
    end

    private

    def buildMessage
        message = "A new XFD has been created.\n " +
        "Title: #{@album.name} | #{buildGenresList(@album.genres)} \n " +
        "Circle: #{@album.circle.name} \n " +
        "Events: #{buildEventsList(@album.events)} \n " +
        "XFD: #{buildCrossfadesList(@album.crossfades)} \n " +
        "Link: #{@url}"

        message
    end

    def buildEventsList(eventsArr)
        eventsList = ""
        eventsArr.each do | event |
            eventsList = eventsList + "#{event.name} | #{event.date} | #{event.location}"
        end
        eventsList
    end

    def buildGenresList(genresArr)
        genreList = ""
        genresArr.each do | genre |
            genreList = genreList + "#{genre.name}"
        end
        genreList
    end

    def buildCrossfadesList(crossfadeArr)
        crossfadeList = ""
        crossfadeArr.each do | crossfade |
            crossfadeList = crossfadeList + "#{crossfade.link}"
        end
        crossfadeList
    end
end
