require "csv"

def main
  file = ARGV.size > 0 ?  ARGV[0] : exit
  data =[]
  data_list = CSV.read(file)
  filename = file + '.csv'
  CSV.open(filename,'w') do |test|
    test << data_list.shift
    data_list.each do |data|
      test << [data[0],
               data[2].to_f - data[1].to_f,
               data[3].to_f - data[2].to_f,
               data[4].to_f - data[3].to_f,
               data[4].to_f - data[1].to_f]
    end 
  end
    
end

main
