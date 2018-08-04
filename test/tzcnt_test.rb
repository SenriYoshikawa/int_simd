require 'benchmark'

data = [0x000f, 0x00ff, 0x0fff, 0xffff, 0xfff0, 0xff00, 0xf000]
N = 100

for i in 0 ..6
    time = 0
    for j in 0..N-1
        result = Benchmark.realtime do
            cnt = 0
            for k in 0 .. 63
                if(data[i][k] == 1) then
                    break
                else
                    cnt += 1
                end
            end
        end 
        time += result
    end

    #puts "loop time =  #{result}s"
    print sprintf('    0x%04x & ', data[i])
    print "#{time  / N}s & "

    time = 0
    for j in 0..N-1
        result = Benchmark.realtime do
            data[i].tzcnt_64()
        end
        time += result
    end

    #puts "simd time =  #{result}s"
    puts "#{time / N}s \\\\ \\hline"

end