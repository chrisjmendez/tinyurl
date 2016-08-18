require_relative '../app/models/url'

describe Url do 
	
	it 'does not exist when there is no http(s) link'
	it 'does not exist when the Url string is not valid'
	it 'does not save when "original" is not valid.'
	it 'does not save when "original" is not unique.'
	it 'does not save if it is not associated to a Link (link_id)'
	it 'does not save if "original" is blank'
end
	