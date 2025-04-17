# BRAM Framebuffer

This module reads the HDMI input port on the Nexys Video and stores the current frame in BRAM on the press of a button.
An external monitor can be plugged into the HDMI output port, and with a switch the user can choose to display the original input signal
or the contents of the BRAM framebuffer.

**Board:** [Nexys Video](https://digilent.com/reference/programmable-logic/nexys-video/start)

Uses Digilent's [DVI2RGB](https://github.com/Digilent/vivado-library/blob/master/ip/dvi2rgb/docs/dvi2rgb.pdf) and [RGB2DVI](https://github.com/Digilent/vivado-library/blob/master/ip/rgb2dvi/docs/rgb2dvi.pdf) IPs.
