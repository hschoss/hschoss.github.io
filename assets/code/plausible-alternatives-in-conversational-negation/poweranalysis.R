# poweranalyis.R
# author: hannes
# last edited: 2026-06-18

# Power Simulation for the interaction term in a 2 (Relation: Worse Alternative
# vs. Unrelated) x 2 (Delay: 0 ms vs. 750 ms) repeated measures ANOVA Minimal
# relevant interaction effect: 30 ms Note: The other analysis of interest
# (further relation comparisons) follow the same principle and are thus also
# captured by this power simulation

# based on this paper https://arxiv.org/abs/2110.09836

n <- 350
dat <- expand.grid(A = factor(1:2), B = factor(1:2), subj = factor(1:n))
beta <- c(mu = 850, a2 = -30, b2 = -40, ab22 = 30) # a1, b1 := 0
X <- model.matrix(~ A*B, dat)
Z <- model.matrix(~ 0 + subj + subj:A + subj:B, dat,
                  contrasts.arg = lapply(dat, contrasts, contrasts = FALSE))
pval <- replicate(2000, {
  y <- X %*% beta + # y = mu + a + b + ab + p + pa + pb + e
       Z %*% c(p = rnorm(n, sd = 230), pa = rnorm(2*n, sd = 50),
       pb = rnorm(2*n, sd = 50)) + rnorm(4*n, sd = 100)
m <- aov(y ~ A*B + Error(subj + subj:A + subj:B), dat)
summary(m)$"Error: Within"[[1]]$"Pr(>F)"[1]
})
mean(pval < 0.05)

