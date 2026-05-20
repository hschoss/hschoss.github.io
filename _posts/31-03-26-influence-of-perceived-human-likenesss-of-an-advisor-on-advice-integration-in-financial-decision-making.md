---
layout: post
title:  "The Influence of Perceived Human-Likeness of an Advisor on Advice
        Integration in Financial Decision-Making" 
date:   2026-03-31
categories: university psychology research
---

The rapid integration of artificial intelligence into daily life underscores
the need to further explore psychological processes underlying advice taking
from computational algorithms. Following the Judge-Advisor System, this study
investigates how the anthropomorphism of a chatbot advisor influences the
Weight of Advice within a financial investment game. In a within-participants
design, participants received recommendations from three advisor types: a human
financial advisor, a neutral AI chatbot and a humanlike AI avatar. The study
tested a ‘best-of-both-worlds’ hypothesis, positing that a combination of
algorithmic capacity and human-like approachability would achieve the highest
levels of advice acceptance. Contrary to this prediction, the results revealed
a significantly lower Weight of Advice for the avatar compared to the neutral
chatbot. A repeated-measures ANOVA confirmed a significant main effect of the
advisor type. These findings suggest that the impact of anthropomorphism is
domain-specific and failed to achieve the desired effect in the context of
calculative financial consulting. In technical settings, the simulated
approachability of an avatar may trigger the 'Uncanny Valley' effect, inducing
suspicion that causes users to favor a neutral chatbot. Future research should
focus on comparing domain-specific use cases of Artificial Intelligence to
further optimize the social dynamics of human-machine interactions.


As of 2025, approximately one-third of the European population utilizes
generative artificial intelligence (GenAI) for personal and professional tasks
([Eurostat,
2025](https://ec.europa.eu/eurostat/web/products-eurostat-news/w/ddn-20251216-3)).
This statistic underscores a paradigm shift in decision-making characterized by
a heavy reliance on computational algorithms.  Historically, individuals sought
counsel from scholars, religious figures or oracles in life situations marked
by ambiguity, complexity, or high levels of subjective uncertainty. Nowadays,
algorithmically generated advice shapes our dating life, shopping behaviour,
and investment decisions. The specific social dynamics and psychological
nuances of interacting with these non-human advisors remain insufficiently
researched. 

To address this gap, the present study employs the Judge-Advisor System (JAS),
a decision-making framework where a single person, the judge, remains
responsible for a final decision after receiving recommendations from one or
more advisors ([Sniezek & Buckley, 1995](10.1006/obhd.1995.1040)). In a
prototypical interaction, the judge first makes an initial estimate or choice,
then receives an advisor's suggestion, and finally weighs both perspectives to
arrive at a revised final decision.  Following the advice-taking literature,
there are conflicting findings regarding how individuals weigh and integrate
recommendations ([Bonaccio & Dalal, 2006](10.1016/j.obhdp.2006.07.001)) . 

On one hand, it has been known for decades that formal, statistical methods are
consistently more reliable than human intuition. In his seminal work, [Meehl
(1954)](https://doi.org/10.1037/11281-000) demonstrated that statistical
methods of combining data regularly outperform the judgment of human experts.
The core of this argument is that human integration of information is often
reduced by subjective biases and inconsistent weighting. More recent
publications, describe the tendency to prefer the advice of an algorithm over
that of a human expert as Algorithm Appreciation ([Logg et al.,
2019](10.1016/j.obhdp.2018.12.005)). On the other side of the coin, even when
an algorithm is proven to be superior, human decision-makers can exhibit a
systematic distrust labelled as Algorithm Aversion. [Dietvorst et al.
(2015)](https://doi.org/10.1037/xge0000033) found that individuals lose
confidence in evidence-based algorithms much more rapidly than in human
forecasters after witnessing both make the same mistake. This creates a
paradoxical situation where people erroneously choose a worse human advisor
over a superior algorithm.

The main aim of the present research is to generate insights into the usage of
GenAI by examining how the human-likeness of an advisor influences the weight
placed on advice. Specifically, we investigate whether financial
decision-making differs when receiving advice from a GenAI chat model versus a
human, and to what extent anthropomorphism moderates this effect. We chose a
financial investment scenario for three primary reasons: Firstly, financial
decision-making carries high ecological validity because it is relevant in
daily life. Secondly, individuals typically demonstrate higher levels of
engagement and cognitive effort when managing an important resource, reducing
the likelihood of arbitrary responses. Thirdly, financial decisions are
inherently numeric, which allows for the precise calculation of the Weight of
Advice (WoA), providing a continuous and objective metric to measure how much a
participant shifts their judgment toward the advisor's recommendation.

Firstly, we expect a significant difference in the WoA depending on the
specific type of advisor. This hypothesis tests the fundamental JAS principle
that the perceived source of a recommendation influences how much a judge
adjusts their initial estimate. Secondly, we expect participants to assign a
significantly higher WoA to GenAI-based advisors compared to the human advisor.
This hypothesis aligns with Algorithm Appreciation, suggesting that in numeric
or calculative domains, participants may favor the perceived actuarial accuracy
of automated systems. Thirdly, we expect the degree of anthropomorphism to
moderate the influence of the advice. Specifically, the anthropomorphized AI
advisor will receive a significantly higher WoA than both the human advisor
and the neutral AI chatbot. This prediction follows the 'best-of-both-worlds'
hypothesis, positing that the combination of perceived algorithmic expertise
and human-like social cues will maximize advisor influence.


## Method

### Participants

Each of the three experimenters reached out to friends and family to recruit
naive participants. Subsequently, a total of 58 individuals initiated the
online experiment between January 15, 2026, and January 22, 2026. We followed
strict ethical guidelines, and all participants took part voluntarily. We
excluded 19 participants who did not complete the experiment procedure, three
who were not native German speakers, and one due to poor data quality.
Following these exclusions, the final sample comprised 35 participants (*N* =
35), including 20 men, 13 women, and two non-binary individuals. The age of
participants ranged from 18 to 58 years, with a mean age of 25.86 years (*SD* =
9.67, *Mdn* = 24). The sample was characterized by a high educational
background and a high socio-eco- nomic status, due to being close to a
university. All participants were based in Germany, and German was the primary
language. The sample generally exhibited a lower financial risk tolerance and a
higher self-reported trust in their own financial literacy.  While trust in
Artificial Intelligence was generally low, the usage was quite high with more
than 50% utilizing it at least on a weekly basis (see Table 1 in Appendix A). A
target sample size of *N* = 80 participants was preregistered to achieve a
power of at least .80 (with α = .05) for detecting small-to-medium effect
sizes. This approximation was based on the planned one-factor repeated measures
ANOVA and three t-tests to compare experimental conditions. However, the final
sample (*N* = 35) did not reach the preregistered target due to high attrition
in the experiment


### Apparatus

The experiment was programmed using PsychoPy (Version 2025.2.3) and hosted
online via the Pavlovia platform ([Peirce et al.,
2019](https://psychopy.org/about/index.html)). Participants accessed the study
through their personal computers using either Chromium-based or Firefox
browsers. Audio output was not required for the task. Stimuli consisted of
stock market visualizations and advisor avatars. The stock price fluctuations
were generated as random walks using the Matplotlib Py- thon library. Each
graph displayed a price history ranging from 150 to 230 days and ranging in
value from 150 € to 350 €, combined with a made-up four-letter Ticker Symbol.
Advisor avatars were sourced from a standardized artificially generated image
database ([Peterson et al., 2022](https://doi.org/10.1073/pnas.2115228119)).
To ensure the prototypicality of the finance advisor Stephan avatar, an
iterative selection process was applied. The selection criteria specified that
the human must appear to be a white man between 30 and 50 years old of medium
attractiveness, and wear formal clothing (see Appendix B for example material)


### Research Design

The study employed a within-subjects experimental design to examine the impact
of advisor anthropomorphism on advice-taking. The independent variable,
Advisor Type, consisted of three levels representing varying degrees of
human-likeness: a human (financial advisor Stephan), an anthropomorphized AI
avatar (BRIAN AI), and a neutral AI chatbot (FINOVA IQ). The primary
dependent variable was the Weight of Advice, which quantifies the extent to
which participants revised their initial judgments following an advisor's
recommen- dation, calculated using the following formula:

woa = (Final INvestment - Initial Investment) / Advice - INitial investment)

To control potential order and carryover effects, we used a complete
counterbalanced block design. Participants were randomly assigned to one of
six unique condition sequences, ensuring each advisor type appeared equally
often in every position. Fixed stock chart-advice pairs were utilized, with
both the order of presentation and the sequence of advisors being randomized

### Procedure

The experiment started in the browser. Following informed consent and
eligibility verification, participants were introduced to a hypothetical
scenario in which they had inherited 5,000 € to invest in the stock market.
The experimental procedure consisted of 30 trials with two optional breaks
after every ten-trial block and a final questionnaire. Each trial began with
an animated time-series visualization representing the daily price
fluctuations of a hypothetical stock, starting in January 2025. The
animation stopped at a randomized point between day 150 and day 230, at which
point a prompt appeared asking participants to indicate an investment amount
between 0 € and 100 € from their trial-specific budget. Participants entered
their response numerically using the keyboard and confirmed the value by
pressing the 'Enter' key. Once the initial judgment was submitted, a
chat-style interface pop-up appeared featuring the portrait and
recommendation of one of three digital advisors, depending on the assigned
experimental condition (see Figure 3 in Appendix B). This was followed by a
summary screen displaying both the participant's initial investment and the
advisor’s recommended amount. Participants were then required to provide a
final, revised investment judgment to conclude the trial. Feedback in the
form of profit or loss notifications was intentionally not shown to preclude
potential learning effects or asymmetric trust dynamics. 

Upon completion of the 30 trials (approximately 20 minutes), participants were
administered a final self-report questionnaire. This survey consisted of four
items measured on a 5-point Likert- type scale, assessing: (a) willingness to
take risks, (b) confidence in handling finances, (c) trust in AI systems, and
(d) frequency of daily AI usage (see Table 1 in Appendix A for results). To
evaluate the internal validity of the advisor conditions, a manipulation check
was included, requiring participants to rate the perceived humanness of each
advisor. Finally, mo- graphic information was collected, including age, gender,
and German language proficiency. As a concluding measure of preference,
participants were asked to identify which of the three advisors they would
choose to consult in a future financial investment scenario.


## Results

To prevent extreme outliers from compromising the statistical integrity of the
WoA metric, we applied a Winsorizing technique commonly used in Judge-Advisor
System literature to manage the 'overshooting' problem identified in previous
literature ([Bonaccio & Dalal, 2006](10.1016/j.obhdp.2006.07.001)). While 5.71%
of all trials exhibited some degree of overshooting behavior, only the most
extreme cases accounting for 0.7% of all trials required an adjustment. A
manipulation check was conducted to verify that participants perceived the
manipu- lated human likeness of the advisors correctly. While the AI advisors
were successfully iden- tified as non-human by 80% of the sample, the human
advisor was rated above the neutral humanness threshold by only 31.4% of
participants.  Consequently, strict adherence to the pre-registered
manipulation pattern was observed in only 17.1% of cases. However, a relative
post-hoc analysis revealed that 45.7% of participants perceived the human
advisor as more human-like than the AI counterparts justifying the inclusion of
the data in the analysis.

### Statistical Analysis

**Figure 1**

*Individual Variations in Weight of Advice Across Different Degrees of
Anthropomorphism*

![Individual Variations in Weight of Advice Across Different Degrees of
Anthropomorphism](/assets/images/woa-across-different-anthropomorphisms.jpeg)

*Note.* The gray lines illustrate individual participant trajectories across the
three conditions. Brackets at the top indicate pairwise comparisons between
conditions. The red vertical error bars represent the standard error of the
mean


### Explorative Analysis

Regarding the preference for future financial advice, the descriptive data
showed a clear lean toward the non-anthropomorphized agent. Of the
participants, 20 selected the neutral chatbot, followed by 17 who chose the
human advisor, while only 3 opted for the anthropomorphized chatbo

**Figure 2**
*Correlations Between Questionnaire Variables and Mean Weight of
Advice*

![Correlations Between Questionnaire Variables and Mean Weight of
Advice](/assets/images/correlations-questionnaire-and-woa.png)

*Note.* Red lines represent the linear regression for each variable. Spearman
correlation coefficients indicate the strength and direction of the
associations.


As shown in Figure 2, pairwise Spearman correlations revealed that higher
financial confidence (<i>r<sub>s</sub></i> = -0.24) and a greater willingness
to take risks ( <i>r<sub>s</sub></i> = -0.18) were both weakly associated with
lower advice utilization.  Conversely, while trust in Artificial Intelligence
(<i>r<sub>s</sub></i> = 0.15) showed a slight positive trend toward advice
taking, frequent everyday usage of AI (<i>r<sub>s</sub></i> = -0.14) was linked
to higher levels of advice discounting.

Post-hoc correlation analyses between initial and final investments revealed
that the human advisor (*r* = .518) introduced the most variance into
participant decision-making. In contrast, judgments remained significantly
more anchored to initial estimates in the neutral chatbot (*r* = .78) and
anthropomorphized avatar (*r* = .85) conditions. This suggests that the human
advisor possessed the greatest capacity to disrupt initial anchors and trigger
a reassessment of the investment.


## Discussion

The present study investigated how the perceived human-likeness of an advisor
influences advice utilization within a financial Judge-Advisor System.
Specifically, we tested whether combining algorithmic competence with
human-like social cues would maximize the Weight of Advice compared to a
neutral AI chatbot or a human advisor. Supporting our first hypothesis, the
source of the recommendation significantly influenced how much judges adjusted
their initial estimates. However, the "best-of-both-worlds" hypothesis was
firmly rejected. We predicted that the anthropomorphized avatar (BRIAN) would
yield the highest WoA by occupying a 'sweet spot' between algorithmic capacity
and human approachability. Instead, the avatar generated significantly lower
advice utilization than the neutral chatbot and was overwhelmingly rejected by
participants when asked about their future advisory preferences. Furthermore,
the second hypothesis which predicted Algorithm Appreciation, yielded nuanced
results. While the neutral chatbot (FINOVA IQ) was heavily utilized and was the
most preferred future advisor, the human-like avatar actively discouraged
advice-taking

The rejection of the anthropomorphized advisor can be understood through two
theoretical lenses. First, outfitting an algorithm with human-like cues may
have triggered the ‘Uncanny Valley’ effect ([Zeng et al.,
2026](https://doi.org/10.1038/s44260-026-00075-1)).  Rather than fostering
trust, the simulated approachability of the avatar likely induced a sense of
unease or suspicion, causing participants to actively discount its financial
recommendations. Second, the lower acceptance of the avatar highlights the
domain-specific nature of advice-taking. Financial decisions operate on a
utilitarian logic. In these numeric environments, individuals value the
perceived objectivity of algorithmic entity (the neutral chatbot) while
human-like avatars might foster trust in empa- thetic domains like
psychological counseling. The social cues of BRIAN AI appear to be detrimental
in technical settings, where they distract from the expected accuracy of the
algorithm. Counterintuively, frequent daily use of AI correlated negatively
with WoA, while high general trust in AI was associated with higher advice
weighting. This suggests that regular exposure to GenAI does not automatically
translate into 'blind trust'. A plausible explanation is that experienced users
possess a more realistic assessment of the fallibility of GenAI and maintain a
more skeptical stance.

Finally, post-hoc correlation analyses between initial and final investments
revealed a unique dynamic regarding the human advisor. Judgments remained
heavily anchored to initial estimates in both the chatbot and avatar
conditions. In contrast, the human advisor introduced the most variance into
participant decision-making, showing the weakest correlation between initial
and final judgments. This suggests that while participants may state a
preference for the neutral chatbot, human advisors still possess the greatest
psychological capacity to disrupt initial cognitive anchors and trigger a
fundamental reassessment of a judge's prior beliefs


## Limitations

The study experienced a high attrition rate (32.8 %), which was primarily due
to the repetitive nature of the task and a lack of participant engagement.
While the introduction of 12 outcome feedback may have mitigated this boredom
and increased task-related effort, it was intentionally omitted to avoid the
confounding influences of order effects and fluctuating mo- tivational states
across trials. Consequently, our analysis is severely underpowered requiring
our findings to be interpreted as exploratory rather than definitive.


## Future Research

Future research should focus on incorporating direct feedback to make the
experiment more engaging, which is likely to reduce attrition and increase
overall participation. Additionally, it would be valuable to examine
advice-taking across different domains, comparing technical or utilitarian
contexts (e.g., stock investment, logistics) with socio-emotional or medical
contexts (e.g., psychological counseling, healthcare). To maximize the
effectiveness of Generative AI, it is crucial to investigate the underlying
social dynamics that shape interactions between human judges and machine
advisors.


## Appendix A

**Table 1**
*Participant Characteristics Regarding Risk, Finance, Trust, and AI Usage*

| Characteristic                                | Response option      | n  | %    |
| --------------------------------------------- | -------------------- | -- | ---- |
| **Willingness to take risks**                 | Very low             | 1  | 2.9  |
|                                               | Low                  | 13 | 37.1 |
|                                               | Moderate             | 14 | 40.0 |
|                                               | High                 | 6  | 17.1 |
|                                               | Very high            | 1  | 2.9  |
| **Confidence in handling finances**           | Very unconfident     | 2  | 5.7  |
|                                               | Unconfident          | 4  | 11.4 |
|                                               | Somewhat unconfident | 13 | 37.1 |
|                                               | Somewhat confident   | 15 | 42.9 |
|                                               | Very confident       | 1  | 2.9  |
| **Trust in Artificial Intelligence**          | Not at all           | 3  | 8.6  |
|                                               | Probably not         | 15 | 42.9 |
|                                               | Neutral              | 12 | 34.3 |
|                                               | Probably yes         | 5  | 14.3 |
|                                               | Completely           | 0  | 0.0  |
| **Everyday Usage of Artificial Intelligence** | Never                | 4  | 11.4 |
|                                               | Occasionally         | 12 | 34.3 |
|                                               | Weekly               | 9  | 25.7 |
|                                               | Almost every day     | 9  | 25.7 |
|                                               | Several times a day  | 1  | 2.9  |

*Note.* Data were collected via a self-report questionnaire presented
immediately following the experimental task. Percentages are rounded to one
decimal place.



## References

Bonaccio, S., & Dalal, R. S. (2006). Advice taking and decision-making: An
integrative literature review, and implications for the organizational
sciences. *Organizational Behavior and Human Decision Processes, 101*(2),
127–151.
[https://doi.org/10.1016/j.obhdp.2006.07.001](https://doi.org/10.1016/j.obhdp.2006.07.001)

Dietvorst, B. J., Simmons, J. P., & Massey, C. (2015). Algorithm aversion:
People erroneously avoid algorithms after seeing them err. *Journal of
Experimental Psychology: General, 144*(1), 114–126.
[https://doi.org/10.1037/xge0000033](https://doi.org/10.1037/xge0000033)

Eurostat. (2025, December 16). 32.7% of EU people used generative AI tools in
2025.
[https://ec.europa.eu/eurostat/web/products-eurostat-news/w/ddn-20251216-3](https://ec.europa.eu/eurostat/web/products-eurostat-news/w/ddn-20251216-3)

Hunter, J. D. (2007). Matplotlib: A 2D graphics environment. *Computing in
Science & Engineering, 9*(3), 90–95.
[https://doi.org/10.1109/MCSE.2007.55](https://doi.org/10.1109/MCSE.2007.55)

Logg, J. M., Minson, J. A., & Moore, D. A. (2019). Algorithm appreciation:
People prefer algorithmic to human judgment. *Organizational Behavior and Human
Decision Processes, 151*, 90–103.
[https://doi.org/10.1016/j.obhdp.2018.12.005](https://doi.org/10.1016/j.obhdp.2018.12.005)

Mayer, R. E., & Moreno, R. (2005). A cognitive theory of multimedia learning:
Implications for design principles. *Educational Psychology Review, 91*.

Mahmud, H., Islam, A. K. M. N., Ahmed, S. I., & Smolander, K. (2022). What
influences algorithmic decision-making? A systematic literature review on
algorithm aversion. *Technological Forecasting and Social Change, 175*, 121390.
[https://doi.org/10.1016/j.techfore.2021.121390](https://doi.org/10.1016/j.techfore.2021.121390)

Meehl, P. E. (1954). *Clinical versus statistical prediction: A theoretical
analysis and a review of the evidence*. University of Minnesota Press.
[https://doi.org/10.1037/11281-000](https://doi.org/10.1037/11281-000)

Peirce, J., Gray, J. R., Simpson, S., MacAskill, M., Höchenberger, R., Sogo,
H., Kastman, E., & Lindeløv, J. K. (2019). PsychoPy2: Experiments in behavior
made easy. *Behavior Research Methods, 51*(1), 195–203.
[https://doi.org/10.3758/s13428-018-01193-y](https://doi.org/10.3758/s13428-018-01193-y)

Peterson, J. C., Uddenberg, S., Griffiths, T. L., Todorov, A., & Suchow, J. W.
(2022). Deep models of superficial face judgments. *Proceedings of the National
Academy of Sciences, 119*(17), e2115228119.
[https://doi.org/10.1073/pnas.2115228119](https://doi.org/10.1073/pnas.2115228119)

Sniezek, J. A., & Buckley, T. (1995). Cueing and cognitive conflict in
judge-advisor decision making. *Organizational Behavior and Human Decision
Processes, 62*(2), 159–174.
[https://doi.org/10.1006/obhd.1995.1040](https://doi.org/10.1006/obhd.1995.1040)

Zeng, Y., Brown, C., & Rounsevell, M. (2026). Too human to model: The uncanny
valley of large language models in simulating human systems. *npj Complexity,
3*(1), 13.
[https://doi.org/10.1038/s44260-026-00075-1](https://doi.org/10.1038/s44260-026-00075-1)



