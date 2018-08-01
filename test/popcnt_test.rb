require 'benchmark'

data = [0x000f, 0x00ff, 0x0fff, 0xffff, 0xfff0, 0xff00, 0xf000]

for i in 0 ..6

    result = Benchmark.realtime do
        sum = 0
        for j in 0 .. 63
            if(data[i][j] == 1) then
                sum += 1
            end
        end 
    end

    puts "loop time =  #{result}s"

    result = Benchmark.realtime do
        data[i].popcnt_64()
    end

    puts "simd time =  #{result}s"

end