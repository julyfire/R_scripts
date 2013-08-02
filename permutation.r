# Red line shows our example test statistic
# Dotted line shows the alpha=thres critical value
# Dashed line shows the Bonferroni critical value

nVert = 100    # Number of vertices (i.e. # of multiple comparisons)
nPerm = 10000  # Number of permutations to perform
df    = 20     # t-test degrees of freedom
testT = 3      # Our real t statistic that we want p-values for
thres = 0.05   # Significance threshold
t_mat = matrix(rt(nVert * nPerm, df), nPerm, nVert)
t_mat = abs(t_mat)

################################################################################
# Theoretical p-value
(p_theo = 2*pt(testT, df, low=F))

dev.new()
x = seq(0, 7, len=100)
plot(x, 2*dt(x, df), type='l', main='Theoretical')
abline(v=qt(thres/2, df, low=F), lty=3)
abline(v=testT, col='red')

################################################################################
# Empirical p-value
(p_emp = length(t_mat[t_mat > testT]) / (nVert*nPerm))
crit1 = floor((1-thres)*nVert*nPerm)

dev.new()
breaks=seq(0,7,len=30)
hist(t_mat, breaks, freq=F, main='Empirical')
abline(v=sort(t_mat)[crit1], lty=3)
abline(v=testT, col='red')
title('Empirical')

################################################################################
# Empirical p-value, corrected for multiple comparisons
maxT_dist = apply(t_mat, 1, max)
(p_cor = length(maxT_dist[maxT_dist > testT]) / length(maxT_dist))
crit2 = floor((1-thres)*nPerm)

dev.new()
hist(maxT_dist, breaks, freq=F, main='Empirical, corrected')
abline(v=sort(maxT_dist)[crit2], lty=3)
abline(v=testT, col='red')
abline(v=qt(thres/(2*nVert), df, low=F), lty=2) # Bonferroni

################################################################################
quartz.options(bg='white')
for(i in dev.list()){
  dev.set(i)
  dev.print(device=png, file = file.path(getwd(), sprintf('figure_%i.png', i)), width=4, units='in', res=120)	