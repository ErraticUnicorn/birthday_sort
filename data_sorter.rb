require 'csv'

class DataSorter
  def sort
    start_time = Time.now
    csv_text = File.read('data.csv')
    csv = CSV.parse(csv_text, :headers => false)
    data = csv.to_a #we only have one row
    data = data.flatten
    data = data.map(&:to_i).sort

    most_popular_count = 1
    current_count = 1
    previous_index = 0
    most_popular_index = 0

    data.each_with_index do |y, i|
      next if i == 0
      if y == data[previous_index]
        current_count += 1
      else
        if current_count > most_popular_count
          most_popular_index = i - 1
          most_popular_count = current_count
        end
        previous_index = i
        current_count = 1
      end
    end

    if current_count > most_popular_count
      puts data.last
    else
      puts data[most_popular_index]
    end

    end_time = Time.now - start_time
    puts end_time
  end
end
