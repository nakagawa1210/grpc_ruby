require "csv"

def main
  file = ARGV.size > 0 ?  ARGV[0] : exit
  data =[]
  file_list = CSV.read(file)
  file_list.each do |file|
    filename = "log/" + file[0]
    data_list = CSV.read(filename)
    CSV.open(filename,'w') do |test|
      data_list.each.with_index(1) do |data,i|
        test << [i,data[1]]
      end 
    end
  end
end

main
