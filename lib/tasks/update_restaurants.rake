namespace :update_restaurants do
  task init: :environment do
    puts 'Preparing to update...'
  end

  desc "Updates the format of a restaurant's state"
  task change_state_format: 'update_restaurants:init' do

    Restaurant.all.each do |restaurant|
      restaurant.state = "Illinois"
      restaurant.save!
      puts "** restaurant updated **"
    end

    puts "Updates complete"
  end
end
