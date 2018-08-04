require 'benchmark'

data = [0x000f, 0x00ff, 0x0fff, 0xffff, 0xfff0, 0xff00, 0xf000]
N = 100

for i in 0 ..6
    time = 0
    for j in 0..N-1
        result = Benchmark.realtime do
            sum = 0
            for j in 0 .. 63
                if(data[i][j] == 1) then
                    sum += 1
                end
            end 
        end
        time += result
    end

    #puts "loop time =  #{time  / N}s"
    print sprintf('    0x%04x & ', data[i])
    print "#{time  / N}s & "

    time = 0
    for j in 0..N-1
        result = Benchmark.realtime do
            data[i].popcnt_64()
        end
        time += result
    end

    #puts "simd time =  #{time / N}s"
    puts "#{time / N}s \\\\ \\hline"

end