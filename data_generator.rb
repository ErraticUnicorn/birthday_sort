require "csv"
class DataGenerator
  def generate(num_data)
    data = Array.new(num_data.to_i) { rand(1900...2000) }
    CSV.open("data.csv", "wb") do |csv|
      csv << data
    end
  end
end
