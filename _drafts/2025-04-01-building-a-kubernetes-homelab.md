ONe year ago i did not even know that it was possible to host one's own
personal cloud at home.


A combination of Events in the last year led me to believe that this is
exactly what i need.

1. AI is really compuationally expensive. I don't want to start to think about
   how much energy it needs to train the model. But even inference itself is
   about 10x as expensive as a google request. Thtat is why i thought the
   solar panels of my parents are the perfect opportuinity to run some 
   LLM's locally for basically free. (AI is energetically expensive and one
   day the bubble will burst and I cannot use my chatgpt model anymore for
   free.)

2. Not so long ago there was a nice youtube videos of some techbros caressing
   the President of the United States. After they started a war and not a
   reliable partner with the european union anymore it is fair to say that i
   don't want them to have my data anymore (even though they pretty surely
   have it saved somewhere)

  political reasons



3. when i was researching this topic last fall the prices for equipment were
   rising all of the time. So i knew i had to be quick. The prohphets of the
   industry said that the prices won't really go down in the next few years.

  hardware prices and centralized entshittification of the products.


2025 surely was the year of the LInux Desktop with people like PewdiePie very
publicly introducing many young people to Technology and the FOSS world.

Combined with the abilities of LLM's to explain technical documentation to
people like they are 5-year-olds this were perfect conditions for this trend
to pick on.


Combined with a general tendency in the European union to r/BuyfromEurope and
r/degoogle







throught the surge of ai i got motivated to deploy my own LLm model locally.


the beginnings.
my family had some old hardware from the Pandemic when we were forced to work
from home and have school frome home.
Pretty solid HP's Business laptop.


So my plan was quite simple:

One service oriented homelab for my family running all the time to r/degoogle
and one computation oriented homelab for myself to run some machine learning
workloads and become cracked in data science and compputation.

To be fair, an Raspberry PI would have been enough, but i wanted to go all out
and proof to myself that i can learn this quite complicated stuff.

Also i want to translate these skills into my professional career

At first i had to buy ha


Step on some use cases


Step two was deciding which software to use
- ROCm vs NVIDIA


Step 3 was deciding which hardware to use

this step was all the time in the background. I scanned kleinanzeigen / the
german facebook market place.



ecological computation

My girl math calculation was as follows:
we are producing 5Mwh too much energy with our solar panels. Thanks to our
head of economie Katharina Reiche, it will be eventually even worse than

Draw: 36 cents
give: 6 cents
differecen: 30 cent per kwh.

If my setup can draw 2kw for 8h per day and this for the 6 months of the
summer, i have 1000€ of energy costs i am saving.
Therefore i need power hungry hardware i can switch on and off if there is
enough sunshine

i do have a feeling that this has to play a role. 

Many people want to chat with LLMS 24 / 7 so there is no real way to run these
services with clean produced energy, becaseu we can't have clean energy 100€
of the time. But things like Data generation and context geneation like in a
paperless ai instance or an immich machine learning model can run all of the
time in the backgroundd





how it works

both my homelabs are quite mirrored but have difffernet usecases and hardware schwerpunkte.

both are consumer level fritzboxes. Next to them is a raspberry pi which handles VPN, DNS, and kubernetes backups with the borg software as 
a fast recovery if my cluster crashes or a node dies. 

this is the entry point and this can talk to the api of my solarpanels to power the cluster on and off based on the energy levels.
it is kind of a central always running management server.

on one of the pis i 

There is the network of my family that is just the pi with the SATA SSD hat.

And then there is my pi and my network where i can collaborate with other people and let them use my technical infrastructure i built.

on my personal pi i have a sript that updates my entire linux computer every time i connect to the internet via borgbackup. This is really handy, because you can steal my whole network and i will be back on a new machine in less than 60 Minutes with the exact same files i had yesterday. 

Every time i come home i plug in a hdd drive to this pi and it automatically creates an exact copy of the whole filesystem to this raspberry pi so i have a another snapshot of my backup. 



Es

natürlich haben alle techbros schon meine Geischtsdaten in ihren Systemen und ich kan nihnen kaum noch etwas verstecken. Wenn ich auf einer US amerikanischen Kamera abgeleuchtet werden, kann man mittlerweile bestimmt schon sagen, dass das mien Gesicht ist. 
Genauso wurde durch diese Companies das größte Copyright Infringement des Jahrtausends durchgesetzt. Shit happens.

Aber ich kann mich dagegen wehren weiterhin diese Datenkrake zu füttern und auch meine Freunde und Familie dafür sensibilisieren.


Zuerst dachte ich, dass niemand diesen Chatbots seine Probleme erzählen möchte. But turns out ,dass wir gerade diesen Chatbots ehrlicher als anderen Menschen gegenüber sind. Schon vor 10 Jahren konnte man nach 3 Minuten auf INstagram bessere predictions über Präferenznen durch den Algorithmus abgeben, als das die engsten Freunde konnten. Deshalb  interessiert mich  auch Data science so starkauch Data science so stark



