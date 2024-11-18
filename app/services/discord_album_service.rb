class DiscordAlbumService
    def initialize(album,url)
        @album = album
        @url = url
    end

    def call
        message = buildMessage()
        puts "MESSAGE: " + message
        Bot.send_message(ChannelID, message)
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
