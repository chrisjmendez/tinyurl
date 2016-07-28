#
# Description:
# These links describe the process of transferring a sinatra app to a rails app
# http://stackoverflow.com/questions/12362527/rails-methods-that-belongs-to-and-has-one-associations-create
# http://stackoverflow.com/questions/12335985/rails-finding-database-records
#

require 'uri'

DIRTY_WORDS = %w(ass asses asshole assholes bastard beastial beastiality beastility bestial bestiality bitch bitcher bitchers bitches bitchin bitching blowjob blowjobs clit cock cocks cocksuck cocksucked cocksucker cocksucking cocksucks cum cummer cumming cums cumshot cunilingus cunillingus cunnilingus cunt cuntlick cuntlicker cuntlicking cunts cyberfuc cyberfuck cyberfucked cyberfucker cyberfuckers cyberfucking damn dildo dildos dink dinks ejaculate ejaculated ejaculates ejaculating ejaculatings ejaculation fag fagging faggot faggs fagot fagots fags fart farted farting fartings farts farty felatio fellatio fingerfuck fingerfucked fingerfucker fingerfuckers fingerfucking fingerfucks fistfuck fistfucked fistfucker fistfuckers fistfucking fistfuckings fistfucks fuck fucked fucker fuckers fuckin fucking fuckings fuckme fucks fuk fuks gangbang gangbanged gangbangs gaysex goddamn hardcoresex hell horniest horny hotsex jack-off jerk-off jism jiz jizm kock kondum kondums kum kummer kumming kums kunilingus lust lusting mothafuck mothafucka mothafuckas mothafuckaz mothafucked mothafucker mothafuckers mothafuckin mothafucking mothafuckings mothafucks motherfuck motherfucked motherfucker motherfuckers motherfuckin motherfucking motherfuckings motherfucks nigger niggers orgasim orgasims orgasm orgasms phonesex phuk phuked phuking phukked phukking phuks phuq piss pissed pisser pissers pisses pissin pissing pissoff porn porno pornography pornos prick pricks pussies pussy pussys shit shited shitfull shiting shitings shits shitted shitter shitters shitting shittings shitty slut sluts smut spunk twat)

class Link < ApplicationRecord
  has_one :url
  has_many :visits

#  after_create :create_generic_link  
  def self.shorten(original_url, custom_url=nil)
    #A. First determine if this URL has already been saved to the database
    #u = Url.find_by_original(url.original)
		u = Url.where(original: original_url)
		#B. exists allows you to check without having to select the record from the DB
		if u.exists?
	    return u.first.original if original_url
		end
		#D. Create a new link
		new_link = nil		
		#D. If user intended to create a custom url
    if custom_url
			logger.debug("A - ")
			logger.info(custom_url)
      #Custom Rails Queries http://stackoverflow.com/a/22619771
      #D.1 - Throw an error if a custom URL has already been used
      #raise 'Someone has already taken this custom URL, sorry' unless Link.find_by_identifier(custom).nil?
      raise 'Someone has already taken this custom URL, sorry' unless Link.where(identifier: custom_url).first.nil?
      #D.2 - Throw an error if there's profanity within the custom URL
      raise 'This custom URL is not allowed because of profanity' if DIRTY_WORDS.include? custom_url
      #E. Let's create a custom Link with an accompanying URL
			new_link = create_custom_link(original_url, custom_url)
		else
	    #C. Otherwise, create a new link
	    new_link = create_generic_link(original_url)
    end
		#Return the link
    return new_link
  end
  
  private
	
	def self.create_custom_link(original_url, custom_url)
		logger.info("C - create_custom_link")
      #A. Create a new Link with a custom identifier (in memory )
			url = Url.create(original: original_url)
			#B. This will atomagically create a foreign key of url.link_id
      link = Link.create(identifier: custom_url, url: url)
	end
	
  def self.create_generic_link(original_url)
		logger.info("D - create_generic_link")
		#A. The only way to get an "id" is to write to the database
    url = Url.create(original: original_url)
		#logger.info(url.inspect)
		#B. Once you have an "id", you can now hash it
		url_hash = url.id.to_s(36)
		#C. If no pre-existing hash exisits, let's create it
    if Link.where(identifier: url_hash).nil? or !DIRTY_WORDS.include? url_hash
			#D. Create a generic Link
      link = Link.create(identifier: url_hash, url: url)
			#E. Return the newly minted url to the user
      return link
    else
			#If a pre-existing has does exist, create it
			logger.info("F - 2x ")
      create_generic_link(original_url)
    end    
  end  
end
