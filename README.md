# schmitt_trigger.dsp
Schmitt Trigger for FSK/PSK computer tape recordings, using Linux, LV2, Faust, and Audacity

It is required to overcome 1M points quantity [^1] for Nyquist Prompt used with Audacity [^2] (Tools -> Nyquist Prompt...).

Note that Schmitt Trigger guarantees for best obtainable decoding quality, in contrast to approaches like filtering or limiting as per [^2], because, it gives no (near-)zero samples, which is (often undocumented) requirement for some decoders like [^3].

To use this .dsp code:
* Install `audacity` and `faust`.
* Compile & install the code, as shown at its head.
* Use Effects->SchmittTrigger with Audacity.

Note that inversion is provided, for some cases like when decoder can't recover correct phase.

[^1]: https://forum.audacityteam.org/t/tachometer-analysis-via-nyquist/40737/6
[^2]: https://forum.audacityteam.org/t/schmitt-trigger-possible/43953/9
[^3]: https://github.com/begoon/rk86-tape/blob/main/docs/index.html
