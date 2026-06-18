---
layout: post
title:  "my homelab"
date:   2026-05-07 10:00:00
categories: linux infra
---

# why i wanted to run an LLM at home
In my third semester studying psychology, I took a seminar about large
language models and how they differ from human language abilities and
reasoning. I really liked the topic. What I did not like was that we spent our
time theorizing about these systems without playing around with them and
seeing them in action. 

Everyone in the seminar had to give a presentation. When it was my turn, I
followed a YouTube tutorial, installed Docker on my machine, and set up the
open-sourced version of [GPT-2](https://en.wikipedia.org/wiki/GPT-2) locally.
I left the ivory tower and showed the group hands-on, how far these chatbots
had already evolved and i really enjoyed the process. 

In the end, I was relieved when the seminar was finally over.
But one idea stayed with me: **You can run this technology yourself, at home.**

## the thought process 
My decision to run high-performance computing hardware at home was not instant. It came from three thoughts that slowly started pointing in the same direction.


### fear of techbros
A few months ago i saw the cringy video of the [techbro
dinner](https://www.zdfheute.de/politik/ausland/usa-trump-tech-bosse-dinner-zuckerberg-gates-cook-100.html)
at the white house. At that moment, It was clear to me that the long told myth
of the effective altruist had turned into the myth of the effective tax
avoider. Something in me stopped feeling comfortable that these guys own the
databases where my interaction with these chatbots are stored.

When LLMs came around, I thought nobody would talk about personal or emotional
things with these machines. I assumed people would simply use them as google
on steroids. But very soon, I found myself chatting about everything and
anything with these systems. And that made me increasingly uncomfortable.

For years, we have known that thanks to machine learning facebook can
predict your next likes and personality test scores better than your best
friends or even your family members. But my chat history with multiple LLM
providers goes further. These corporations now have access to my thoughts,
which I do not want to share with anyone, because, well they are *my*
thoughts.

### exorbitant energy costs
At first I read that a single
prompt uses roughly two to three times as much energy as a standard web
search. Honestly, that did not sound absurd to me. If one good answer saves me
from opening ten different links to find the information i am looking for,
the trade-off is not necessarily absurd. 

But inference is only one side of the story. According to estimates from this
[recent paper](https://doi.org/10.1016/j.rser.2025.116159), Inference accounts
for about 60% of the total energy spent on LLMs, while training still consumes
an enormous amount of energy upfront. The costs of training modern LLMs is
calculated in Gigawatts. Not Megawatts and surely not in Kilowatts. I really
like this mindboggling 3blue1brown short for
[visualization](https://www.tiktok.com/@3blue1brown/video/7439406247117344030).

So my first Laptop (a 2013 MacBoo Pro), which performs a rough estimate of 100
billion computations per second, would run for one million years in order to
train such a model. My newest Laptop with state of the art hardware, would
still need around 100 000 years. We are talking about a timespan from the
first symbolic human markings captured on bones to this exact day. And that
would only be for the scale of GPT-3 which feels cute compared to newest
models. 

This puts the scale into perspective. Yes, inference costs matter. But the
production costs are immense. Nonetheless, I want to use the technology that
has been created so far. But I do not want to create even bigger incentives
for large corporations to build bigger data centers by using their services.
We already crossed the stage where improving model quality marginally costs
exponentially more training, more chips, more electricity, and more water.


### building skills
For the last four years, everyone has had an opinion about AI. Our head of
school talked about it during our Abitur ceremony. Every boomer has an
take. And there seems to be nothing worth studying
anymore, because you "might be replaced by AI" anyway. At the same time, the
actual experts (people like Geoffrey Hinton or Bernhard Schölkopf) speak about
these systems with much more care and criticism than the CEOs selling them. 
Instead of believing everything some coked-up tech CEOs in Silicon Valley say
about this “world-changing technology”, I want to understand it myself. I want
to know how these systems are installed, how they run, what they can do, what
they cannot do, and where their limits lie.

If this really is the next big thing, then i want to be competent to use it for 
my advantage. Therefore i need the technical skill to deploy something that other people built for me, standing on the shoulders of giants.

## requirements
But how do you host your Local LLM. My strategy was quite simple. Learning by 


There are several Reddit communities dedicated to this topic:
* r/Local LLAmA 
* r/homelab

In the beginning, I thought hosting an LLM on my own hardware would be like
installing a second fridge. Just buy the thing, plug it in, configure it a
little, and then it just runs. It turns out that it is not that simple.

### favourable demographics

Not many people are actually in the demographic position to do this, because
you need several things at once.

1. You need access to a large enough shared space. Ideally, the house of your
   parents. I cannot run this setup in my 12-square-meter student room.

2. You also need to be allowed to run loud hardware in that shared space.
   Ideally, you have access to a small basement room where the noise does not
   bother anyone and you can close the door. The sound compares to a mown
   lawer.

3. You need access to cheap electricity. In Germany, electricity can easily
   cost around 35 cents per kilowatt-hour, and running power-hungry hardware
   at that price will not make you happy. There is a reason many data centers
   are located in places where electricity is much cheaper than in most of
   Europe.

4. You need the actual hardware. This turned out to be much more difficult
   than I expected. I started looking for parts last October, but for a long
   time I could not find anything within my budget. Eventually, because I
   worked for the German car industry alongside my studies, I had earned
   enough money to enter the territory of serious hardware. If you want to run
   serious models locally, you should probably have around 2,000 to 3,000
   euros lying around and be willing to invest that amount into hardware.

5. You need the technical skills. You should be comfortable using the
   terminal, editing configuration files in something like vim or emacs,
   dealing with networking, and have experience with booting Linux on machines.

6. You need time. A lot of time. It will save you time if you read the
   documentation first. But even then, it takes a while to get used to the
   mental model and abstractions of Kubernetes. Your machines become
   “nodes,” and your applications run in “pods,” and your errors are hidden
   in LLM generated YAML files. 

Thankfully, I was lucky enough to check all these boxes. I am privileged
enough to use a room in my parents’ basement and burn some of their excess
solar power, which I analyzed in [this](https://github.com/hschoss/solar-panels-r)
data analysis project. I also bought the hardware relatively cheap off ebay,
and I had already learned how to use the terminal and a proper editor at
university. And because I am currently “only” writing my bachelor’s thesis, I
have a reasonable amount of time to pour into this project.

So yes, hosting an LLM locally is possible. But it is not just a weekend
project. It requires space, electricity, hardware, technical skill, time, and
a situation in life where all of these things somehow overlap.


### some napkin math

Before buying hardware, I had to answer a boring but important question:
**What kind of model do I actually want to run?**

That sounds simple, but it matters a lot. Local AI hardware does not scale
gently. Like many things in life, you eventually reach a point where you need
much more hardware for only a little more performance.

From reading discussions in communities like r/LocalLLaMA and r/LocalLLM, my
rough impression was that this point starts somewhere around 70B to 100B
models. Below that, models are already useful, but still clearly limited.
Above that, the hardware requirements become much more painful.

A simple rule of thumb helped me think about the hardware requirements:

> For every billion parameters, you need roughly one gigabyte of VRAM, plus extra memory for context and overhead.

This is not exact. Quantization, context length, KV cache, framework overhead,
and GPU offloading all change the real number. But as a first estimate, it is
good enough.

For a 70B model, the napkin math looks like this:

```text
70 GB for the model
+ 20% for context and overhead
= 84 GB
```

So in practice, I wanted around **90 GB of available VRAM**.

At first, this sounds like you could simply buy many cheap GPUs and add their
memory together. For example, eleven low-end cards with 8 GB each would
technically give you 88 GB of VRAM.

But that is not how this works in practice.

Multiple weak GPUs are not the same as fewer strong GPUs. You have to deal
with bandwidth, PCIe lanes, power consumption, cooling, driver issues, model
splitting, and communication between cards. The memory number alone does not
tell the whole story.

It is a bit like football. Eleven mediocre players do not automatically beat
six world-class players just because there are more of them on the field.
Coordination matters. Speed matters. The weakest parts of the system still
slow everything down.

That was the point where the hardware question became more concrete. I did not
just need “enough VRAM” on paper. I needed a setup that could realistically
run a serious model without turning every generation into a technical pain.

My laptop can already run smaller models around the 30B range reasonably well.
That is impressive, but it was not the experiment I wanted. I wanted to reach
the point where local inference starts to feel serious.

For me, that meant targeting 70B.

**this post is still under construction**



**stay tuned**

