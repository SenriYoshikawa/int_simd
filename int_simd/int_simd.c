#include <ruby/ruby.h>
#include <x86intrin.h>
//#include <../internal.h>

static VALUE
int64t_popcnt(VALUE num)
{
    if(FIXNUM_P(num))
    if (num > INT2FIX(0)) {
    {
        uint64_t n = FIX2INT(num);
        return INT2NUM(_popcnt64(n));
    }
    }
    return Qnil;
}

static VALUE
int64t_tzcnt(VALUE num)
{
    if(FIXNUM_P(num))
    if (num > INT2NUM(0)) {
    {
        uint64_t n = FIX2INT(num);
        return INT2NUM(_tzcnt_u64(n));
    }
    }
    return Qnil;
}

static VALUE
int64t_lzcnt(VALUE num)
{
    if(FIXNUM_P(num))
    if (num > INT2NUM(0)) {
    {
        uint64_t n = FIX2INT(num);
        return INT2FIX(_lzcnt_u64(n));
    }
    }
    return Qnil;
}

void
Init_int_simd()
{
    rb_define_method(rb_cInteger, "popcnt_64", int64t_popcnt, 0);
    rb_define_method(rb_cInteger, "tzcnt_64", int64t_tzcnt, 0);
    rb_define_method(rb_cInteger, "lzcnt_64", int64t_lzcnt, 0);
}


