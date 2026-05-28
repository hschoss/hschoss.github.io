---
layout: post
title:  "My Homelab"
date:   2026-05-07 10:00:00
categories: linux infra
---

## information check

* What is the goal and why do people care?
  people who want to see a use case of a homelab. People who are interested in hardware topics and want to improve privay at home.
  Hiring mangers who are looking if someon has some kind of technical ability
  
* Who is your audience? Who will use this or build on this?
  hiring managers, people with interest in technology

* If you want it yourself to solve some problem, then that is a good sign. Explain why you want it.
* What is your hypothesis? I’d like everyone to have the sentence “My hypothesis is….” even if we do not include it in the paper. Is your hypothesis testable? How will you know whether it is true or not? Focusing on a hypothesis keeps you out of the trap of incremental engineering (i.e. hacking your way to slightly better numbers).
* What is the problem/impediment that means it has not been done yet?
* Nugget — what is your key insight that makes it doable? This is probably the single most important thing in a good paper and the hardest for students to grasp. More on this below.
* What is your elevator pitch? That is, if you meet a senior scientist in an elevator and she asks you what your paper is about, how do you describe it in 3 sentences or fewer.
* Teaser — what would a teaser image show to explain this core idea?
* What are the key previous works and what do they get wrong? All papers have limitations. Find these and they point the way forward.
* How will you evaluate your method quantitatively?
* What is your “demo”? That is, how do you show that the idea works.
* What are the key risks?
* Do you have all the data you need?

In my third semester studying psychology, I took a seminar about large language
models and how they differ from human language abilities and reasoning. I
really liked the topic. What I did not like was that we spent our time
theorizing about these systems without playing around with them. 

Everyone in the seminar had to give a presentation.

When it was my turn, I followed a YouTube tutorial, installed
Docker on my machine, and set up the open-sourced version of
[GPT-2](https://en.wikipedia.org/wiki/GPT-2) locally.
I left the ivory tower and showed the group hands-on, how far these
chatbots had already evolved. 

In the end, I was relieved when the seminar was finally over.
But one idea stayed with me: **You can run this technology yourself, at home.**


## my plan

A few months later i saw the cringy video of the [techbro dinner](https://www.zdfheute.de/politik/ausland/usa-trump-tech-bosse-dinner-zuckerberg-gates-cook-100.html) in the white house. 
It was clear to me that  the myth of the effective altruist 
went to the myth of the effective tax avoider. 
Something in me stopped feeling comfortable that these guys own the databases
where my interaction with these chatbots are saved.
When the LLM's came around i thought nobody would talk about personal and emotional stuff with these machines and just use them as a search engine
on ssteroids, but i soon talked about everything and anything with these chatbots. I didn't feel very comfortbale anymore

its been known for years that with the power of machine learning, 
facebook can predict you personlaity

That means that the people running these llms have a lot of knowledge baout us.
https://doi.org/10.1073/pnas.1418680112


well up to this point this was just an estimation of being on a spectrum on 
dimensions that were  

*it is scary that tech overlords gather really detailled life information about you* 


Another reason was that i calculated

that it needs about 2-3 times the energy per prompt than a google search, which is fine i would say.
The much more interesting part is the trainig costs
these are calculated in Gigawatts, not Megawatts and also not Kilowatts

One inference isn't that bad and is around 10 times as much energy as one google search. If this one inference saves me clicking on ten links, than this is ok.
 At that time i also calculated how much energy this thing does need. 

*don't make more incentives for the big corporations to destroy ressources in 
producing even bigger neural networks. The technology has been known for a long time now, but they only improve because they are burning more moeny and ressources.
its economically not smart.



* build your own technical skills and learn this "world changing technology"
instead of believing everything some coked up techbros in silicon valley tell you
Furthermore everyone is talking about it all the time. And i cannot here it anymore.  
Everyone is talking, talking and talking about these systems and how they will change the world.
But who is actually capable of deploying them himself. And who is actually using this technology to improve the life of other people. 
Considerably less people 

so the decision was clear: I want to host my own LLM locally.


## requirements

at first i wanted 


server hardware is expensive and it even got more expensive last year.
That is why i looked on ebay and asked my family for old hardware. 

i first wanted to do a 4x AMD MI 50  32 GB Rig, but i soon noticed, that the
support won't be too great, so i switched it to 

diese überlegungen führten mich dazu darüber nachzudenken ein LLM lokal hosten zu wollen. Wie schwer kann es schon sein?

Ich hbae mir vor 5 Jahren einen Gaming Pc zusamengestellt und etwas mehr als ein paar Grafikkarten wird man ja nicht brauchen. dachte ich   

Vor zwei Jahren haben meine Eltern auch eie Solaranlage auf dem Dach installiert bekommen.
Das bedeutet, dass wir gerade sowieso viel zu viel Strom produzierten, während alle anderen mEnshcen sich im lnad über hu hohe Energiepreise aufregten.


## some napkin math



Also organisierte ich mir die Daten aus dem Dashboard und versuchte abzuschätzen was wir für ein Delta hatten.
in den letzten zwei Jahren haben wir fast 2 von 3  Kilowattstunden für die Einspeisung ins Netz produziert. wi
wirkungsgrad von 80%
dank shclechter Energiepolitik der letzten 20 Jahre bedeutet dass, dass wir für 35 cent strom beziehen und für 6 cent strom einzahlen.
Wir verlieren also pro killowattstunde ca. 30 cent.

Wenn man aus einer blöden ökonomischen Brille auf das Thema schaut sieht man schnell, dass so im Jahr mehrere tausend Euro flöten gehen.

Gerade so stromintensive Aufgaben wie einen server zu betreiben, würden sehr gut zu uns ins Haus passen. 
Man müsste aber die Serverlogik mit der Stromproduktionslogik verbinden. Es wäre also die Voraussetzung, dass die Sonne scheint, dass die 
Services laufen können. 
So entstand meine Idee vom Green Computing. Ich hatte gemerkt, dass mir der Elfenbeinturm und das philoshophieren nicht besonders gefällt und wollte hands on Erfahrung mit
diesen Systemen bekommen. 
Dam
über mehrere tage auf reddit eignetet ich mir die Grundlagen an. Ich brauche viel Compute, also GPU Power. Da könnte ich NVidia oder Amd nehmen.
Amd ist günstiger besserer bang for buck, aber wenn ich iwssenschaftliches computing machen wollen würde, brauche ich nvidia backends.

Wenn das nicht nur eine private sondern auch eine professionelle Angelegenheit werden sollte, lohnte es sich also am Anfang die Extrameile zu gehen


deshalb war für mich klar, dass ich hier tief reingehen wollen würde. Ich möchte lernen technische INfrastruktur die für ein LLM Cluster nöitg ist, daheim laufen zu lassen.
Dafürbrauch eich linux skills, aber auch kubernetes skills.
das ist das lustige an diesem skill tree. Als ich die erste Sitzung in meinem neuen Seminar hatte, wusste ich gerade erst, was linux und UNIX war und plötzlich  ein Jahr später 
wusste ihch plötzlich was kubernetes war und wieso es viellelicht ein mal praktisch für mich sein könnte. 

Es ist eigenltich der perfekte Zeitpunkt, um dmait zu starten. DIe LLMs helfen einem dabei endlose YAML konfigurationen zu erstellen. Was in den Dateien steht, ist gar nicht so wichtig. 
Es ist nur iwchitg, dass es deklaratiav ist und in git gemanagt und, dass ich meine infrastruktur sehr einfach zurückholen kann, wenn irgendetwas abschmiert.

endlose yaml konfigurationen



Security
Wer irgendetwas für andere Leute baut, muss irgendwann auch über sicherheit nachdenken. Nicht das man andere dadurch verletzt. 




how it started:
* It is possible to deploy local LLM solution and have a machine think
* i want to deploy LLMS (everybody is talking about them and that they will take their jobs, but no one is actually hosting them)
* Big tech is selling all of our data.
* I don't know how to do this. But i do have the ressources. I


why do i do this?
* it is fun
* i don't want to spend my whole life on a corporate server, i want to use my own servers
* it will get easier, It is good to build valuable technology habits. "dont use everything, becasue everything comes and goes. Just be intentional)  
*


habe ihc es unterschätjzt?
schon. Ich dachte, dass man es in 4h Stunden schaffen könnte ien funktionioerendes cluster aufzusetzen. Es brauchte bei mir aber Wochen von Anlöufen, bis ich mein erstes Kubernets Cluster auf Talos LInux laufen lassenk konnte
ich brauchte wirklich vergliechsweise ewig, weil ich das booten noch nicht so draufhatte und talos linux sehr pingelig mit seinem boot modus



wikipeida rabbit holes are great. The first one was linux and the next one is homelabbing.

Both are huge time sinks, but i think in regard of a career it does make sense to explore those practical areas of computing at the beginning.

If you set it up at the beginning and adopt best practices you can make up a lot of  time later, when your system just works and doesn't break so often and you don't have to make the switch.

It jsut works and that is really nice. Furthermore it is fun.

And you can build technical infrastructure for your friedns and family




it all started on reddit. As you can see in this picture this is what our home infrastructure looked like.
And sure it worked. We had lots of networking equipment lying around because of the job of my dad, but life was to full to worry about those things


last fall i was using chatgpts and llms(my local LLM)


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


Es

natürlich haben alle techbros schon meine Geischtsdaten in ihren Systemen und ich kan nihnen kaum noch etwas verstecken. Wenn ich auf einer US amerikanischen Kamera abgeleuchtet werden, kann man mittlerweile bestimmt schon sagen, dass das mien Gesicht ist. 
Genauso wurde durch diese Companies das größte Copyright Infringement des Jahrtausends durchgesetzt. Shit happens.

Aber ich kann mich dagegen wehren weiterhin diese Datenkrake zu füttern und auch meine Freunde und Familie dafür sensibilisieren.


Zuerst dachte ich, dass niemand diesen Chatbots seine Probleme erzählen möchte. But turns out ,dass wir gerade diesen Chatbots ehrlicher als anderen Menschen gegenüber sind. Schon vor 10 Jahren konnte man nach 3 Minuten auf INstagram bessere predictions über Präferenznen durch den Algorithmus abgeben, als das die engsten Freunde konnten. Deshalb  interessiert mich  auch Data science so starkauch Data science so stark


ch möchte ein vereinfachtes Diagram meiner Netzwerkstruktur zeigen.




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

I really don't want to loose any of my files.


then there is the cluster, all nodes are running talos linux. they are managed with gitOps principles and fluxcd. both repositoreis are on my gihtub so you can look at them. I do use coding agents to keep them running, because i cannot be bothered to debug for 8 hours just to notice a wrong space in my yaml files.



