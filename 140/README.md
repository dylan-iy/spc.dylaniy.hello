# dylaniy sc 140cha assignment

Ay people... I am behind and have f-ed up the start to my semmy by conceding to a depressive episode but am gonna do my best for myself and for the class! AND FOR U RACHEL

Starting by reviewing the prior weeks codealongs, as well as the [reference code](https://ccrma.stanford.edu/wiki/SuperCollider_Tweets) given in the 140character.md file.

#### Stuff I learned:

- Evaluating a statement that initiates a `SynthDef` more than once before initiating a `.free` statement breaks the `SynthDef` and .free does not halt all instances. Aborting from there requires a Cmd+. ... that or I need to get further schooled
- I have a lot to catch up on and a LOT more to learn!!

## The decision

I am going to use headcube2 as my template. Just vibed with it the most in this moment. The other stuff was cool too. Loved the baby patch.

OG Code (courtesy of Nathaniel Virgo apparently, shoutout Bruno for helping a plebeian like me understand):  

    play{GVerb.ar(VarSaw.ar(Duty.ar(1/5,0,Dseq(a=[[4,4.5],[2,3,5,6]];flat(a*.x allTuples(a*.x a)*4).clump(2)++0)),0,0.9)*LFPulse.ar(5),99,5)/5}

### UPDATE

Ohhhh god this is an involved little line of code. I've gotten to a point where I almost understand what the statement is doing but I need to finish reading to understand what's happening with all of the arrays. Arrays have always given me trouble in coding and have frequently been my ceiling before I give up. But I won't be doing that tonight!

What I know so far is:
- The whole thing is drenched in reverb using the `GVerb` UGen
- Everything is divided by 5 at the end to keep the amplitude sane
- The saw wave (`VarSaw`)'s frequency is being determined every 1/5 of a second using `Duty`. The values `Duty` returns are determined by `Dseq`... more on that in two bullet points
- `LFPulse` acts as a gate controlling how long `VarSaw`'s output is audible. Higher values = longer articulation, etc.
- `Dseq` was hard to figure out as it introduced me to a slew of array methods, as well as the adverb `.x` that is added to the * multiplication operator. Essentially the two arrays (within a larger array) defined as `a=[[4,4.5],[2,3,5,6]]` are being multiplied into a ton of permutations (`a*.x allTuples(a *.x a)*4`). `flat` reduces all of the permutations down to a single array and the `.clump` method is used to group the flattened array into smaller arrays of 2 values (one for each channel).

### UPDATE #2

Phew! Ok.... I *think* I understand enough to mess around with the parameters of the line of code. Starting by removing the `GVerb` (saves us some characters), changing `VarSaw` to `SinOscFB`, playing with `SinOscFB`'s feedback (swapping places w/ `VarSaw`'s iphase parameter).

    play{SinOscFB.ar(Duty.ar(1/5,0,Dseq(a=[[4,4.5],[2,3,5,6]];flat(a*.x allTuples(a*.x a)*4).clump(2)++0)),2.4,0.9)*LFPulse.ar(5)/5}

From there I changed some of the values within the `Dseq` arrays. I found that keeping the first array's range between 4 and 5 yielded results I was happy with. I also changed `LFPulse`'s argument to 5.5. This caused some of the note changes to be audible mid pulse, which I like. Nathaniel's code only has one float argument within the Dseq arrays (4.5). Using more floats to keep the note values closer together created some unison/width effects that blurred the line between interval and unison. Kinda coool:

    play{SinOscFB.ar(Duty.ar(1/5, 0, Dseq(a=[[4, 4.5, 4.3, 4.1],[2.4, 2.2]]; flat(a *.x allTuples(a *.x a)*4).clump(2)++0)), 2.4, 0.5)*LFPulse.ar(5.8)/5};

Not including spaces (though the space between *.x and allTuples is **necessary** for the code to function) the character count totals at 139. I'll settle with that for now. As we keep going this semester I will continue to review and read up. Was honestly shocked to see how much you can do with so little code in sclang. Excited to take this further.

### SOURCES/VICTIMS OF THEFT
Main reference: Bruno's version of Nathaniel's code (used to clearly define the variable a as seperate from *.x)  
Additional info: SuperCollider documentation/help menu; class code alongs

<3 see ya

## 🐸🧌😴