---
layout: post
title:  "hosting LLMs in my Homelab"
date:   2026-05-07 10:00:00
categories: linux infra
---

In my third semester studying psychology, I took a seminar about large
language models and how they differ from human language abilities and
reasoning. I really liked the topic. What I did not like was that we spent our
time theorizing about these systems without playing around with them and
seeing them in action. 

Everyone in the seminar had to give a presentation. When it was my turn, I
followed a YouTube tutorial, installed Docker on my machine, and set up the
open-sourced version of [GPT-2](https://en.wikipedia.org/wiki/GPT-2) locally.
I left the ivory tower and showed the group hands-on, how far these chatbots
had already evolved and i really liked the process. 

In the end, I was relieved when the seminar was finally over.
But one idea stayed with me: **You can run this technology yourself, at home.**


## the thought process 

### techbros

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

For years, we have known that, thanks to machine learning, facebook can
predict your likes and personality better than your best friends or even your
family members. But now these corporations do not just have my likes, my
clicks, or my browsing behavior. They have access to thoughts I do not share
with anyone, because, well, they are my thoughts.


### energy

Another reason is energy consumption. At first I read online that a single
prompt uses roughly two to three times as much energy as a standard web
search. Honestly, that seems reasonable to me. If one good answer saves me
from opening ten different links to find the information i am looking for,
then the trade-off is not necessarily absurd. 

But inference is only one side of the coin. All these individual requests sum
up to about 60 % of the total energy spent on LLMs. The remaining 40% go into
the one-time training of these models. These estimates are based loosely on
this [recent paper](https://doi.org/10.1016/j.rser.2025.116159).

The costs of training modern LLMs is calculated in Gigawatts. Not Megawatts and
surely not in Kilowatts. I really like this mindboggling 3blue1brown short for
[visualization](https://www.tiktok.com/@3blue1brown/video/7439406247117344030).

So my first Laptop (a 2013 MacBoo Pro), which performs a rough estimate of 100
billion computations per second, would run for one million years in order to
train such a model. My newest Laptop with state of the art hardware, would
still need around 100 000 years. We are talking about a timespan from the
first symbolic markings on bones to this day. And that would only be for
the scale of GPT-3 which feels cute compared to newer models. 

This puts into perspective how much energy goes into the production of modern
LLMs. Yes, inference costs are high. But the production costs are immense.

I want to use the technology we have created so far. But I do not want to
create even more incentives for large corporations to build ever-bigger data
centers by using their services.

We are already at a stage where improving model quality marginally costs
exponentially more training, more chips, more electricity, and more
infrastructure


### skills

For the last four years, everyone has been talking about AI. Our head of
school talked about it during our Abitur ceremony. Every boomer has an
opinion about it on LinkedIn. And there seems to be nothing worth studying
anymore, because you "might be replaced by AI" anyway. At the same time, the
actual experts (people like Geoffrey Hinton or Bernhard Schölkopf) have been
much more careful and often much more critical in how they talk and warn about
the technology they helped to build. Instead of believing everything some
coked-up tech CEOs in Silicon Valley say about his “world-changing technology”
I want to see it myself. I want to know how these systems are installed, how
they are run, what they can do, what they cannot do, and where the limits are.

If this really is the next big thing, then i want to be competent to use it for 
my advantage. Therefore i need the technical skill to deploy something that other people built for me, standing on the shoulders of giants.

Combining all three of my thought patterns, the decision became clear: I wanted
to host my own LLM locally.


## requirements

There are several Reddit communities dedicated to this topic:
* Local LLAmA 
* r/homelab

In the beginning, I thought hosting an LLM on my own hardware would be like
installing a second fridge. Just buy the thing, plug it in, configure it a
little, and then it just runs.

It turns out that it is not that simple.

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
   terminal, editing configuration files in something like Vim or Emacs,
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


## some napkin math

before buying all of the hardware you need to be clear of the scope of you
projects.


Like most things in life, at some point you need exponentially more ressources
to have a little better performance

Based on reddit this decline in performance lies somewhere between 70 B models
and 100 B models. So my plan was clear: I want to host a 70 B model at home.

as a really quick way for thinking about this, you need approximately one GB
of VRAM to run 1 Billion Parameters of a model plus 20 % of the size for
context. 
so for a 70 B model you should have hardware with 

70 GB + 14 GB = 85 GB so about 90 GB  

well some think you could just take 11 times a 5060 with 8 GB VRAM and have
enough? 
Not really. adding multpile low level cards, doesn't give you all you need.

just like a team of 11 mediocre football players would outperform a team of 6
world class football players.



##  on rabbit holes

you really have to ask youself, which rabbit hole you want to take.


ther are a lot of design decisions you have to make.
I decided that kubernetes would be a good skill for me. I want to use
Kubernets and self hosted micro services in my professional lifes, because i
see myself in building platforms and technology related producst.

If you are just interested in using paperless ai than you shouldn't really
look into kubernetes and just use docker and be happy.


but if you do go down the kubernetes road you should use Talos LInux.  It is
great. 


## grit 

I underestimated how much time it does need.
i thought it would be possible to get a working cluster up and running in
maybe about 4-6 hours. Well i needed 4-6 weeks in the end to have my first
running on Talos Linux

Both are huge time sinks, but i think in regard of a career it does make sense to explore those practical areas of computing at the beginning.

If you set it up at the beginning and adopt best practices you can make up a lot of  time later, when your system just works and doesn't break so often and you don't have to make the switch.

It jsut works and that is really nice. Furthermore it is fun.

And you can build technical infrastructure for your friedns and family



Start der Geschichte war, dass ich LLMs lokal laufen lassen wollte. Dafür bin ich auf LocalLLMs auf reddit gegangen und habe mir dort die verschiedenen homelabs angeschaut.

Über diese Schiene bin ich auf r/homelab gekommen und habe mich auch für andere services interessiert.

Ausschlaggebend dafür war auch das Techdinner von Trump.

It's kind of ironic that i am hosting this on one of these american tech companies, Github. But it does make sense if you count into it, that i am very ok with all of those files being in the public internet.


es ist wirklich wichtig zu verstehen, dass ich die techcompanies nicht mehr mag

Gründe, warum man den Techcompanies nicht mehr vertrauen darf.
- 


All das sind Gründe, wieso man sein eigenes homelab starten sollte. Gerade auch wenn man zu viel Zeit hat und gerne werkelt, kann das wirklich eine schöne Erfahrung sein.

(screenshot uas einem video einfügen)


Das ökonomische Argument. Meine Eltern haben seit zwei Jahren eine Solaranlage, welche sehr gute returns hat. 
plot einfügen über ein Jahr gerechnet. mit Bezug und Einspeisung.

Es ist ein Delta von 8 Mwh im Jahr

power ist teuer
Wieso ein raspberry Pi ein guter Homelab computer ist (stromsparend).
Du könntest natürlich auch weniger für einen gleich guten x86 COmputer ausgeben, aber die Srtromkosten dafür sind nah einem Jahr shcon immens

Deutschland ist zur Zeit von Kristen betroffen undes sieht nicht aus, als würde es besser werden. Eine kwh kostet nunmal 35 cent. 



mein erster schritt in richtung homelab war es letztes Weihnachten zu versuchen einen VPN aufzusetzen. Das klappte nicht.
Bis heute habe ihc es noch nicht hinbekommen einen funktionierenden VPN aufzubauen. Als nächstes habe ich dann 

wieso HOMELAB?
1. es macht Spaß und ist beruhigend
2. es ist nützlich für deine Mitmenschen, wenn sich einer vertieft mit Informationstechnologie auskennt.
3. es erinnert dich, dass du eine Wahl hast



Im 3. Semester hatte ich ien Seminar an der Universität in welchem wir über Large Language Models geschrieben haben.
Wir philosohpierten über verschiedene Trainingsarten und Anwendungen und hatten zu Beginn nur einmal ein XOR and AND Gate mit Neural dings berechnet. Das heißt nicht mal die richtigen Grundlagen hatten wir. Das störte mich sehr

Auch die Diskussionen über dieses sehr spannede Thema verliefne nur sehr schleppend.

In einer Trotz aktion lud ich mir online das gpt 2 model herunter und lies es als einen Docker Container laufen.

Ich folgte einem Tutorial auf Youtube und hatte gar keine Ahnung von der materie. 

Ich nutzte dafür damals meinen Mac Pro und war begeistert, als das odell plötzlich lief.

so konnnte ich im Vortrag dann gpt 2 präsentieren und wie gut dieses modell war und hands on sachen zeigen.


Das Seminar ging zu Ende und es blieb nichts hängen. Doch der Gedanke irgendwann mal selber Ai im Haus haben zu können.

Ich bin Kognitionspsychologe und wir haben in den letzten 5 Jahren als Menschheit denkende und handelnde Maschinen erfunden (so lange man das im Internet als Handeln sehen kann). Diese bots fühlen sich zur Zeit eher noch online wohl, aber könnten die Brücke in die echte Welt schlagen und ein Embodiment erlangen und das wirkliche "fühlen" lernen. Wir sind gerade dabei die ersten elektronischen Tiere zu bauen.  


electric animals



ALlein diese Möglichkeit hat mich serh fasziniert und mich dazu bewogen dies in meinem Homelab auszuprobieren.

Am Anfang konnte ich gar nichts. 

nachdem ihc ein bisshcenm mit docker containern rumprobiert hatte und immich auf docker gehostet hatte, entschloss ich mich all in zu gheen und Hardware zu kaufen.

Während dieser Zeit machte ich ein Praktikum bei einem großenUnternehmen und verdiente so gut, dass ich einige Hundert Euro ausgeben konnte.

Ich machte einen KLeinenaziegen kReuzzug und 


tatsächlich geschah es, dass ich mich in meinem zweiten Studienjahr begann für ELektronik zu interessieren und ein Raspberry Pi wollte.
Und ich kam mit dem Ding einfach nicht. To be fair, zu dem Zeitpunkt hatte ich auch keine Ahnung von ARM Architektur, baer es wollte einfach nichts funktionieren und ich konnte es auch nicht über das Netzwerk erreichen, weil irgendwo in diesem Netwerkschrank war iene Loop eingebaut, sodass es ums verrecken nicht funktionieren wollte. Das behob ich erst viel später. 

Zu dem Zeitpunkt dachte ich aber immer, dass ich zu dumm dafür bin.
Es igbt einfach technicshe Menschen und keine technischen Menschen.
Während die Psychologen immer von ihren mentalen Modellen reden, habe ich das erste mal wirklcih eines angewandt.

Linux ist ein mentales Modell, welches einem erlaubt alles auf der Welt als einen computer zu sehen. Mittlerweile gibt es ja Zahnbürsten mit Wlan, also es ist echt fast alles ien computer. Und Computer kann man so anpassen, dass sie nützliche Dinge für einen tun.

what-to-do-with-a-raspberry-pi.md

in der Schule wählte ich tatsächlich einen Engineering Kurs und mochte die arbeit sogar, aber ich hasste meine Klassenkameraden und die Projektarbeit machte gar keinen Spaß. 

Es waren alles aufgaben und selbst etwas auf dei Beine zu stellen war ungern gesehn. Die hardware war buchstäblich aus dem Jahr 2005 irgendwelche Windows 8 Rechner mit 2GB arbeitsspeicher wenn es hochkommt, die ewig brauchten um zu booten.


120 € Raspberry PI 
69 € für Raspberry pI hat
10 € für Netzteil

80 € für Raspberry PI
10 € für Sata SSD hat
10 € für Netzteil


600 € für RAM
120 € für RAM
10000 € für GPU server
150 € für SUpermicro Server
180€ SSD
80 € Netzwerkschrank
350€ NVIDIA V100
180€ für 12 TB speicher.

Ich konnte mir das nur leisten, weil ich zur Zeit im Praktikum war. Wieso sollte man je so viel Geld dafür ausgeben
Es ist so viel overhead sich in diese Themen einzuarbeiten. Wir reden über 3 Wochen.  Wenn ich damit im Endeffekt nur immich für meine Familie hoste, lohnt sich das nicht wirklich.


Ich wollte mehr und in mich selbst investieren.


das ist alles Geld, welches ich in mich selbst investiere. 



hätten die beiden raspberry pis gereicht? Ja wahrscheinlich shcon zum lernen. Aber mein Anatz war nicht irgendein textbook rauszukramen und dnan Aufgabe für AUfgabe durchzugehen, bisich irngedwann auf magische Weise kubernetes beherrsche. Mein Ansatz war von Anfang an: Mache so viel kaputt wie irgendiwe möglich. Verusche es erstmal ohne Anleitung und nutze Chattie, wenn es nicht mehr weitergeht. 
Du kannst sonst beim Radfahren oder joggen als Podcasts noch ide Tutorials im Nachhinein hören. wichtig ist praktische Erfahrung.
Das würde ich auch in anderen BEreichen so machen. Erstmal die Hände schmutzig machen und irgendwie rumfummeln und psäter dann die educational ressources dazu anhören.







Anfagns wollte ich es so minimal wie möglich halten, aber mir wurde schnell bewusst, dass man beefy enterprise hardware braucht, um wirklich reliabel und production grade diese modelle laufen zu lassen.

Realisation: ihc könnte weiter power point engineer werden und mein ganzes Leben auf einem Firmenlaufwerk verbringen und rot Word, Excel und Powerpoint Dateien editeiren, oder ich könnte selbst etwas entwickeln und groß machen. 

Du wirst dein gesamtes Leben auf irgendwelchen Enterprise Servern verbringen. Dann kannst du ja auch mal selber versuchen diese Groß zu machen.


ich habe angefangen


mein passercluster 
- low energy
- number of services
- stable
- backup focus

mein matrixcluster
- high energy 
- low number of services
- unstable (i want to break stuff / expeirment) 
- performance focused


Mein Homelab ist nicht zum internet exposed und nur eines der Netzwerke ist mit VPN erreichbar. Ich wollte super sicher gehen.



