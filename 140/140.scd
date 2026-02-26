s.scope;
s.meter;

play{SinOscFB.ar(Duty.ar(1/5, 0, Dseq(a=[[4, 4.5, 4.3, 4.1],[2.4, 2.2]]; flat(a *.x allTuples(a *.x a)*4).clump(2)++0)), 2.4, 0.5)*LFPulse.ar(5.8)/5};