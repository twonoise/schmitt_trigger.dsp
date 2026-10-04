// faust2lv2 schmitt_trigger.dsp  &&  cp -R ./schmitt_trigger.lv2/ /usr/local/lib/lv2/

declare name "SchmittTrigger"; // No spaces for better JACK port names.
declare version "2026";
declare author "jpka";
declare license "MIT";
declare description "Schmitt Trigger for FSK/PSK computer tape recordings";

import("stdfaust.lib");

INVERT   = checkbox("[0] Invert") * 2 - 1;
TRESHOLD = hslider ("[1] Treshold", 0.1, 0.01, 0.99, 0.001);

/*  ~  operator passes feedback at 1st wire only, but select2() uses it as selector.
 * So we need either to shuffle (not work)... */
//my_select2(a,b,c) = (select2(c,a,b)); // (select2(c,b,a)); // FIXME Why it's work?

/* ... or our own select2(). */
my_select2(a,b,c) = (a * (c == 0) + b * (c != 0));

f(x) = 0.5 * (x > TRESHOLD) - 0.5 * (x < -TRESHOLD);

process = _ * INVERT <: my_select2(_, f, (f != 0)) ~ _;
