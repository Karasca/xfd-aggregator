require 'discordrb/webhooks'

class DiscordAlbumService
    WEBHOOK_URL = "https://discord.com/api/webhooks/1308787029357891697/rGpBm75fzqaoO42r4AbQ1EATlL1RU2GxHoxgoUVYojnROrIguFPaip1JifRlFuqctbHd"
    
    def initialize(album,url)
        @album = album
        @url = url
    end

    def call
        client = Discordrb::Webhooks::Client.new(url: WEBHOOK_URL)
        
        client.execute do |builder|
          builder.content = 'A new XFD has been posted'
          builder.add_embed do |embed|
            embed.title = @album.name
            embed.description = "Genres: #{buildGenresList(@album.genres)}"
            embed.timestamp = Time.now
            if @album.folder.url
                embed.image = Discordrb::Webhooks::EmbedImage.new(url: @album.folder.url)
            end
            embed.add_field(name: 'Circle', value: @album.circle.name)
            embed.add_field(name: 'Events', value: buildEventsList(@album.events))
            embed.add_field(name: 'XFD', value: buildCrossfadesList(@album.crossfades))
          end
        end

        # message = buildMessage()
        # puts "MESSAGE: " + message
        # Bot.send_message(ChannelID, message)
    end

    private

    def buildMessage()
        message = "A new XFD has been created.\n " +
        "Title: #{@album.name} | #{buildGenresList(@album.genres)} \n " +
        "Circle: #{@album.circle.name} \n " +
        "Events: #{buildEventsList(@album.events)} \n " +
        "XFD: #{buildCrossfadesList(@album.crossfades)} \n " + 
        "Link: #{@url}"

        return message
    end

    def buildEventsList(eventsArr)
        eventsList = ""
        eventsArr.each do | event |
            eventsList = eventsList + "#{event.name} | #{event.date.to_s} | #{event.location}"
        end
        return eventsList
    end

    def buildGenresList(genresArr)
        genreList = ""
        genresArr.each do | genre |
            genreList = genreList + "#{genre.name}"
        end
        return genreList
    end

    def buildCrossfadesList(crossfadeArr)
        crossfadeList = ""
        crossfadeArr.each do | crossfade |
            crossfadeList = crossfadeList + "#{crossfade.link}"
        end
        return crossfadeList
    end

end
