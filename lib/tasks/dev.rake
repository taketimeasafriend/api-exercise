namespace :dev do
  task :fetch_station => :environment do
    puts "Fetch station data..."
    response = RestClient.get "http://apis.juhe.cn/train/station.list.php", :params => { :key => STATION_CONFIG["api_key"] }
    data = JSON.parse(response.body)

    data["result"].each do |c|
      existing_station = Station.find_by_sta_name( c["sta_name"] )
      if existing_station.nil?
        Station.create!( :sta_name => c["sta_name"], :sta_enname => c["sta_ename"],
                      :sta_code => c["sta_code"] )
      end
    end

    puts "Total: #{Station.count} stations"
  end
end
