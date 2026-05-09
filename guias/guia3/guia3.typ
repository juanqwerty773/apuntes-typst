#set page(fill: rgb("#5ea169"))
#set page(width: 14cm, height: 18cm)
#let hh = h(0.5em)
#let emv = "EMV"
#let to = $arrow.r.long$
#let eva(expr, size: 100%) = $lr(#expr|, size: #size)$
#let ECM(a) = $E C M(#a)$


#image("/guia3/assets/image1.png")

#image("/guia3/assets/image2.png")


a)
  Busco a,b tal que

  $P(X_(n+1) in [a(X_1,dots,X_n),b(X_1,dots,X_n)] ) = 1 - alpha$

  Como $X_1,dots,X_n tilde N(mu, sigma_0^2) "con" sigma_0^2 "conocida"$

  $P(z_(-alpha) < X_(n+1) < z_alpha ) = $ 