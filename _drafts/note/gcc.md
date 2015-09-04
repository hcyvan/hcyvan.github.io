## section ("section-name")
Normally, the compiler places the code it generates in the text section. Some-
times, however, you need additional sections, or you need certain particular
functions to appear in special sections. The section attribute specifies that a
function lives in a particular section. For example, the declaration:

	extern void foobar (void) __attribute__ ((section ("bar")));

puts the function foobar in the bar section.
Some file formats do not support arbitrary sections so the section attribute
is not available on all platforms. If you need to map the entire contents of a
module to a particular section, consider using the facilities of the linker instead.
