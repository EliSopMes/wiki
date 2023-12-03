require 'open-uri'
require 'nokogiri'
require 'mechanize'
require 'openssl'
require 'net/https'

agent = Mechanize.new
agent.user_agent_alias = 'Mac Safari'
# agent.verify_mode = OpenSSL::SSL::VERIFY_NONE

login_url = 'https://festsaal.prostkotti.de/'
protected_page_url = 'https://festsaal.prostkotti.de/?q=node/2227'

# request_uri=URI.parse(login_url)
uri = URI(login_url)

username = 'Eli'
password = 'A54DVARigmPejzKI'

req = Net::HTTP::Get.new(uri)
req.basic_auth(username, password)

response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https', :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |https|
  https.request(req)
end

puts response.code # Check the response code
puts response.body


# res = Net::HTTP.start(
  #         uri.host, uri.port,
  #         :use_ssl => uri.scheme == 'https',
  #         :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |https|
  #   https.request(req)
  # end

  # p html_doc

  # Find the login form and fill in your credentials
  # login_page = response.get(login_url)
login_form = response.body.form_with(action: '/?q=node/2227&destination=node%2F2227') # Replace '/login' with the actual login form action
login_form.field_with(name: 'name').value = 'Eli'
login_form.field_with(name: 'pass').value = 'A54DVARigmPejzKI'


# Submit the form
logged_in_page = agent.submit(login_form)

# Check if login was successful
if logged_in_page.uri.to_s == protected_page_url
  # Now you're logged in and can access the protected page
  protected_page = agent.get(protected_page_url)
  # Process the scraped data here
  puts 'Yayy'
else
  puts 'Login failed'
end

# html_file = URI.open(request_uri, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE})
# html_doc = Nokogiri::HTML.parse(html_file)

# month = '2023-11'
# url = "https://festsaal.prostkotti.de/?q=calendar/#{month}"

# html_file = URI.open(url).read
# html_doc = Nokogiri::HTML.parse(html_file)

# html_doc.search(".layout-md-rail__primary .card__content a").each do |element|
#   puts element.text.strip
#   puts element.attribute("href").value
# end


# Room.create(name: 'Kaminzimmer')
# Room.create(name: 'Festsaal')
# Room.create(name: 'Biergarten')
# Room.create(name: 'Ostflügel')
# Room.create(name: 'Foyer')
# Room.create(name: 'Backstage')

# User.create(first_name: 'Elisabeth', last_name: 'Messmer', nickname: 'Eli', email: 'eli@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '01737468682', birthday: DateTime.new(1998, 11, 7), user_type:  3)
# User.create(first_name: 'Elisabeth', last_name: 'Grigo', nickname: 'Lissy', email: 'elisabeth@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '015737653533', birthday: DateTime.new(1988, 10, 5), user_type:  3)
# User.create(first_name: 'Lorcan', last_name: 'Friedrich', nickname: 'Lorcan', email: 'lorcan@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '0176 84205358', birthday: DateTime.new(1999, 1, 20), user_type:  5)
# User.create(first_name: 'Bodo', last_name: 'Schröder', nickname: 'Bodo', email: 'bodo@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1977, 6, 28), user_type:  2)
# User.create(first_name: 'Christopher', last_name: 'Schaper', nickname: 'Topher', email: 'christopher@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '01632907864', birthday: DateTime.new(1975, 10, 29), user_type:  7)
# User.create(first_name: 'Björn', last_name: 'von Swieykowski', nickname: 'Björn', email: 'bjoern@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '01788500487', birthday: DateTime.new(1973, 2, 15), user_type:  7)
# User.create(first_name: 'Sarah', last_name: 'Bär', nickname: 'Sarah', email: 'sarah@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '01777990012', birthday: DateTime.new(1991, 12, 26), user_type:  5)
# User.create(first_name: 'Aylin', last_name: 'Kartal', nickname: 'Aylin', email: 'aylin@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1992, 12, 30), user_type:  4)
# User.create(first_name: 'Alisia', last_name: 'Klenke', nickname: 'Alice', email: 'alice@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '01626928445', birthday: DateTime.new(1997, 10, 14), user_type:  1)
# User.create(first_name: 'Emma', last_name: 'Neumann', nickname: 'Emma', email: 'emma@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '0173 6501925', birthday: DateTime.new(1998, 9, 4), user_type:  1)
# User.create(first_name: 'Louis', last_name: 'Nollenberger', nickname: 'Louis', email: 'louis@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '017676709131', birthday: DateTime.new(2001, 4, 2), user_type:  0)
# User.create(first_name: 'Lucas', last_name: 'Palmer', nickname: 'Luc', email: 'lucas@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1988, 10, 12), user_type:  1)
# User.create(first_name: 'Daniel', last_name: 'Kokavecz', nickname: 'Daniel', email: 'daniel@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1980, 9, 3), user_type:  1)
# User.create(first_name: 'Angelica', last_name: 'Mormando', nickname: 'Angelica', email: 'angelica@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '01773858969', birthday: DateTime.new(1976, 5, 13), user_type:  1)
# User.create(first_name: 'Hanna', last_name: 'Knödel', nickname: 'Hanna', email: 'hanna@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1985, 9, 17), user_type:  1)
# User.create(first_name: 'Simone', last_name: 'Barth', nickname: 'Simone', email: 'simone@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1989, 6, 1), user_type:  8)
# User.create(first_name: 'Katja', last_name: 'Ballerstein', nickname: 'Katja', email: 'katja@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1988, 7, 1), user_type:  6)
# User.create(first_name: 'Ole', last_name: 'Seelenmeyer', nickname: 'Ole', email: 'ole@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1982, 3, 7), user_type:  2)
# User.create(first_name: 'René', last_name: 'Grönke', nickname: 'Rene', email: 'renegronke@gmail.com', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1976, 1, 11), user_type:  2)
# User.create(first_name: 'Ralf', last_name: 'Sommer', nickname: 'Rüssel', email: 'haustechnik@festsaal-kreuzberg.de', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1958, 12, 20), user_type:  2)
# User.create(first_name: 'George', last_name: 'Miller', nickname: 'George', email: 'gmill61@gmail.com', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1961, 7, 19), user_type:  2)

# User.create(first_name: 'Sebastian', last_name: 'Neumann', nickname: 'Basti', email: 'neumann.sebastian.berlin@web.de', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1988, 8, 26), user_type:  4)
# User.create(first_name: 'Baris', last_name: 'Yilkan', nickname: 'Ben', email: '13film@gmail.com', password: 'FestsaalWiki123', phone_number: '0178 4661555', birthday: DateTime.new(1978, 10, 20), user_type:  4)
# User.create(first_name: 'Christian', last_name: 'Hachmann', nickname: 'Chris', email: 'christian.hachmann33@gmail.com', password: 'FestsaalWiki123', phone_number: '0176 84602801', birthday: DateTime.new(1984, 6, 6), user_type:  4)
# User.create(first_name: 'Angelina', last_name: 'Duckwitz', nickname: 'Angi', email: 'angelina.duckwitz@web.de', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1995, 8, 15), user_type:  4)
# User.create(first_name: 'Liza Josephine', last_name: 'Steffens', nickname: 'Joey', email: 'joeysteffens@gmail.com', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1988, 2, 18), user_type:  4)
# User.create(first_name: 'Patrycja', last_name: 'Helman', nickname: 'Patsy', email: 'patrycja.helman@web.de', password: 'FestsaalWiki123', phone_number: '', birthday: DateTime.new(1979, 11, 4), user_type:  4)
# User.create(first_name: 'Kornelija', last_name: 'Tenyté', nickname: 'Kornelija', email: 'kornelijat@yahoo.com', password: 'FestsaalWiki123', phone_number: '+49 176 45268019', birthday: DateTime.new(1992, 10, 27), user_type:  4)
# User.create(first_name: 'Maik', last_name: 'Mantei', nickname: 'Maik', email: 'maikmantei11@gmail.com', password: 'FestsaalWiki123', phone_number: '0171 5607855', birthday: DateTime.new(1988, 9, 21), user_type:  4)
