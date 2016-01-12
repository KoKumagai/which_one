class Picture < ActiveRecord::Base
  require 'google/api_client'

  belongs_to :survey

  def Picture.search(search_word)
    application_name = Rails.application.secrets.application_name
    api_key = Rails.application.secrets.google_api_key
    cx = Rails.application.secrets.google_search_engine_id

    client = Google::APIClient.new(:key => api_key, :application_name => application_name)
    client.authorization = nil

    search = client.discovered_api('customsearch')
    response = client.execute(search.cse.list, 'q' => search_word, 'cx' => cx, 'num' => '1', 'searchType' => 'image' )
    response_json = JSON.parse(response.body)

    if response && response_json['searchInformation']['totalResults'] != '0' && response.status == 200
        response_json['items'][0]['link']
    else
      nil
    end
  end
end
