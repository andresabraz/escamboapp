namespace :utils do

  desc "Create Fake Administrators"
  task generate_admins: :environment do
    puts "Gerando fakes admins"

    10.times do
      Admin.create!(name: Faker::Name.name,
                    email: Faker::Internet.email,
                    password: "123456",
                    password_confirmation: "123456",
                    role: [0, 1].sample)
    end

    puts "FIM!"
  end

end
