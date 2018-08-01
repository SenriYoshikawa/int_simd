require 'mkmf'

$CFLAGS += ' -march=native'
$CFLAGS += ' -Wall'

create_makefile('int_simd')
