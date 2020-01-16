;; the header section - defining the sample rate, control rate, and number of output channels.

sr = 44100
kr = 4410
ksmps = 10    ; sr / kr
nchnls = 1


;; The instrument section - in which the instruments are designed.
;; Each instrument consists of a set of unit generators, or software modules, 
;; which are patched together with i/o blocks — i-, k-, or a-rate variables.

;; The four types of variables are:
;; setup only
;; i-rate variables, changed at the note rate
;; k-rate variables, changed at the control signal rate
;; a-rate variables, changed at the audio signal rate

;; Each statement occupies a single line and has the same basic format:
;; result action arguments

instr 1
a1 oscil   10000, 440, 1
out a1
endin

instr 2
a1 oscil p4, p5, 1       ; p4=amp, p5=freq
out a1                   
endin

instr 3                                 ; p3=duration of note
k1        linen     p4, p6, p3, p7      ; p4=amp
a1        oscil     k1, p5, 1           ; p5=freq
out       a1                            ; p6=attack time
endin                                   ; p7=release time                           