---
layout: page
title: abbreviations
permalink: /abbreviations.html
---

I like abbreviations.

All tags on this website are abbreviated in one form or another. This page
serves as a small index.

| abbreviation | meaning |
|---|---|
| `ana` | analysis |
| `alg` | algebra |
| `cli` | command line |
| `dev` | software development |
| `emp` | empirical research |
| `inf` | Informatik |
| `lnx` | Linux |
| `mat` | mathematics |
| `psy` | psychology |
| `qds` | quantitative data science |
| `sec` | security |
| `sta` | statistics |
| `tec` | technology |
| `thy` | theoretical research |
| `uni` | university |


i don't want it to be listed in my header in jekyll minima theme.

I also want each abbreviation to be a link. When i klick on the link i can see
all the posts and articles that were published under the abbreviation. Help
me  to do this





Use a **two-level abbreviation system**:

```text
categories = broad areas
tags       = specific filters
```

## Categories

Use categories for the main area a post belongs to. Keep them few and stable.

```text
lnx  Linux / Unix / personal computing
psy  psychology
mat  mathematics
qds  quantitative data science
tec  technology
inf  Informatik / computer science
```

## Tags

Use tags for topic, type, method, or context.

```text
uni  university
emp  empirical research
thy  theoretical research
ess  essay
prj  project
not  notes

dev  software development
sec  security
cli  command line
cfg  configuration
srv  server
net  networking

sta  statistics
ana  analysis
alg  algebra

cog  cognition
mem  memory
dec  decision-making
mis  misinformation
```

## Rule

Each post should have:

```yaml
categories: one broad area
tags: several specific descriptors
```

Example:

```yaml
---
layout: post
title: "My Dotfiles"
date: 2026-05-07
categories: lnx
tags: dev cli cfg
---
```

Example:

```yaml
---
layout: post
title: "The Influence of Uncertain Alternative Information on the Continued Influence Effect"
date: 2026-03-26
categories: psy
tags: uni emp cog mem mis
---
```

## URL idea

Use short archive URLs:

```text
/a/psy/   area page for psychology
/a/lnx/   area page for Linux

/t/emp/   tag page for empirical research
/t/cli/   tag page for command line
```

In short:

```text
categories = where it lives
tags       = what it is about
```
