#set page(width: 16cm, height: 18cm)

// Configurar el color de la hoja a negro
#set page(fill: luma(0%))

// Configurar el color de la tinta a blanco
#set text(fill: luma(50%))

#let hh = h(0.5em)
#let emv = "EMV"
#let sesgo(expr) = $"Sesgo"(#expr)$

#let va(expr, size: 100%) = $lr(|#expr|, size: #size)$

#let eva(expr, size: 100%) = $lr(#expr|, size: #size)$
#let to = $arrow.r.long$ 
//////////////


#let mean(data) = data.sum() / data.len()

#let variance(data) = {
  let m = mean(data)
  data.map(x => (x - m) * (x - m) ).sum() / (data.len() - 1)
}

#let std(data) = calc.sqrt(variance(data))

#let ic(data, t) = {
  let m = mean(data)
  let s = std(data)
  let n = data.len()

  (
    calc.round(m - t * s / calc.sqrt(n),digits: 4),
    calc.round(m + t * s / calc.sqrt(n),digits: 4)
  )
}


////////////////////////////
#image("1.png")

#let media =( 5.1 + 5.2 + 5.6 +5.1+ 5.5 +5.8 +5.9+ 4.9+ 5.2+ 5.6)/10

$media$

a)

  $&P(-z_(alpha/2) <= sqrt(n)(dash(Y) - EE(Y))/sqrt(VV(Y))<= z_(alpha/2))  = 1-alpha; z_alpha = Phi^(-1)(1-alpha) "creo"\
  =& P(-z_(alpha/2) <= sqrt(n)(dash(Y) - mu)/(1/2) <= z_(alpha/2)) = P(-z_(alpha/2) <= 2sqrt(n)(dash(Y) - mu) <= z_(alpha/2))\
  =&P(-z_(alpha/2)/(2sqrt(n)) <= (dash(Y) - mu) <= z_(alpha/2)/(2sqrt(n)) ) = P(-z_(alpha/2)/(2sqrt(n)) - dash(Y) <=  - mu <= z_(alpha/2)/(2sqrt(n)) - dash(Y)) \
  =& P(dash(Y) -z_(alpha/2)/(2sqrt(n))<= mu <= dash(Y) + z_(alpha/2)/(2sqrt(n)))\
  =>& I C(mu) = [dash(Y) -z_(alpha/2)/(2sqrt(n)); dash(Y) +z_(alpha/2)/(2sqrt(n))]
  $


  [ #calc.round(media - (1.96)/(2* calc.sqrt(10)), digits: 3) ; #calc.round(media + (1.96)/(2* calc.sqrt(10)), digits: 3) ]
  
  
b)

  la longitud del intervalo es: $z_(alpha/2)/ (2sqrt(n)) = #calc.round(1.96/(2*calc.sqrt(10)),digits: 3)$ y no depende de los valores de la muestra, pero si de la cantidad.

c)
  para que  la longitud del intervalo sea menor que 0.1:

  
  #let ax = (1.96)*(1.96) * 25
  
  $z_(alpha/2)/ (2sqrt(n)) < 0.1 <=> z_(alpha/2)/2 < 0.1sqrt(n)<=> z_(alpha/2)^2/4 100 <n <=> (1.96)^2 25 = #calc.round(ax) < n $ 

d) 

  Falso, depende del valor de esa muestra. (nose)

#image("image2.png")


a) 

  $P(X_(n+1) in [a,b]) = 1- alpha$

  $dash(X) tilde N(mu, sigma^2_0/n), X_(n+1) tilde N(mu,sigma^2_0)$ son indenpendientes

  $dash(X) - X_(n+1) tilde N(0, sigma^2_0(1/n + 1))\
  (dash(X) - X_(n+1))/(sigma_0 sqrt(1+ 1/n)) tilde N(0,1)\
  P(-z_(alpha/2)<(dash(X) - X_(n+1))/(sigma_0 sqrt(1+ 1/n)) < z_(alpha/2))= 1- alpha\
  = P(-z_(alpha/2)(sigma_0 sqrt(1+ 1/n)) - dash(X)< - X_(n+1)< z_(alpha/2)(sigma_0 sqrt(1+ 1/n)) - dash(X))\
  = P(z_(alpha/2)(sigma_0 sqrt(1+ 1/n)) + dash(X)>  X_(n+1)> -z_(alpha/2)(sigma_0 sqrt(1+ 1/n)) + dash(X))$
  
  $I C(X_(n+1)) = [-z_(alpha/2)(sigma_0 sqrt(1+ 1/n)) + dash(X); z_(alpha/2)(sigma_0 sqrt(1+ 1/n)) + dash(X)]$ 
  

b)
  [#calc.round(-1.96 * 1/2 * calc.sqrt(1+ 1/10) + media,digits: 3) ; #calc.round(1.96 * 1/2 * calc.sqrt(1+ 1/10)  + media,digits: 3)]
  
  long = #calc.round(1.96 * 2* 1/2 * calc.sqrt(1+ 1/10),digits: 3) 

c)

  Se pudo estimar $mu$ con mas precision.


#image("image3.png")

$P(B < sqrt(n)(dash(X)-mu)/sigma<A) = 1-alpha\
I C(mu) = [dash(Y) -A/(2sqrt(n)); dash(Y) -B/(2sqrt(n))]\
"Long"(I C(mu)) = -B/(2 sqrt(n)) + A/(2sqrt(n)) = (A-B) 1/(2sqrt(n))\
z_(beta) - z_(1-delta) = Phi^(-1)(1-beta) - Phi^(-1)(delta) =  Phi^(-1)(1-beta) - Phi^(-1)(alpha - beta)\

integral_(-infinity)^(Phi^(-1)(1-beta)) f_X d x = 1-beta\
integral_(-infinity)^( Phi^(-1)(alpha - beta)) f_X d x = alpha-beta = 1-delta\

$

bot 

$ z_(beta) - z_(1-delta) = z_beta + z_(delta) "por simetria de la normal"\
"la suma se minimiza cuando:"\
z_beta = z_(delta)
$

$L(beta) = z_(beta) + z_(delta) = z_(beta) + z_(alpha - beta)\
L'(beta) = (d z_beta)/(d beta) + (d z_(alpha - beta))/(d beta)\
Phi(z_beta ) = 1-beta, Phi'(z_beta)z'_beta = -1=>z'_beta = -1/(Phi'(z_beta)) = -1/phi(z_beta)= 1/phi(z_beta)\
=> L'(beta) = 1/phi(z_beta) - 1/phi(z_(alpha-beta))= 0 <=> phi(z_beta) = phi(z_(alpha - beta))\

beta = alpha - beta => beta = alpha/2 or z_beta =- z_(alpha - beta) \
=> beta = Phi(-Phi^(-1)(alpha-beta)) = 1-(alpha + beta ) => alpha = 1$
si alpha vale 1 se tendria un intervalo de confianza de nivel 0.

#image("imagen41.png")

#image("imagen42.png")

#let media = (1.52 + 1.65 + 1.72 + 1.65 +1.72+  1.83 + 1.62+  1.75+  1.72 + 1.68 + 1.51 + 1.65 + 1.58+ 1.65 + 1.61 +1.70 +1.60 +1.73+ 1.61 +1.52 +1.81+ 1.72 +1.50 +1.82 +1.65)/25

$X tilde N(mu,sigma²), dash(X) tilde N(mu,sigma^2/n), S^2_n = 1/(n-1) sum_(i = 1)^n (X_i - dash(X)_n)^2\
S_n^2 "es independiente de "dash(X)\
Z = sqrt(n) (dash(X)_n - mu)/sigma tilde N(0,1)\
((n-1)S_n^2)/sigma^2 tilde X_(n-1)^2\
sqrt(n) (dash(X) - mu)/S_n tilde t_(n-1)
$

Sea $t_(k,beta)$ tal que $PP(Y > t_(k,beta))= beta$ cuando $Y tilde t_k$entonces

$PP(-t_(n-1,alpha/2)< sqrt(n) (dash(X) - mu)/S_n<t_(n-1,alpha/2))= 1-alpha$

Luego 

$[dash(X)_n -t_(n-1,alpha/2) S_n/sqrt(n) ; dash(X)_n +t_(n-1,alpha/2) S_n/sqrt(n) ]$


a) encontrar un intervalo de nivel 0.95

como $mu and sigma$ son desconocidas

para encontrar un intervalo de confianza de nivel 0.95 = 1-alpha para $mu$

usare: $sqrt(n) (dash(X) - mu)/S_n tilde t_(n-1), quad S^2_n = 1/(n-1) sum_(i = 1)^n (X_i - dash(X)_n)^2$

sea $PP(Y > t_(k,alpha)) =alpha, quad Y tilde t_k $

$P(-t_(n-1,alpha/2) < sqrt(n) (dash(X)-mu)/S_n < t_(n-1,alpha/2) ) = 1-alpha\
P(-t_(n-1,alpha/2) S_n/sqrt(n) - dash(X) < -mu < t_(n-1,alpha/2) S_n/sqrt(n) - dash(X)) \
= P( dash(X)-t_(n-1,alpha/2) S_n/sqrt(n)< mu < dash(X)+ t_(n-1,alpha/2) S_n/sqrt(n))
\
I C(mu) = [dash(X)-t_(n-1,-alpha/2) S_n/sqrt(n), dash(X) +t_(n-1,alpha/2) S_n/sqrt(n)]\

$

$"Long"[I C(mu) ] = 2t_(n-1,-alpha/2) S_n/sqrt(n) $ La longitud de la muestra depende de los datos tanto de la cantidad como de su valor.

#let Sn= (1.52+1.65+1.72+1.65+1.72+1.83+1.62+1.75+1.72+1.68+1.51+1.65+1.58+1.65+1.61+1.70+1.60+1.73+1.61+1.52+1.81+1.72+1.50+1.82+1.65) / 25


#let datos = (
  1.52, 1.65, 1.72, 1.65, 1.72, 1.83,
  1.62, 1.75, 1.72, 1.68, 1.51, 1.65,
  1.58, 1.65, 1.61, 1.70, 1.60, 1.73,
  1.61, 1.52, 1.81, 1.72, 1.50, 1.82,
  1.65
)



1-alpha = 0.95 => alpha = 0.05

$t_(24,0.025) = 2.0639 $

$I C(mu) = [dash(X)-t_(24,0.25) S_n/5, dash(X) +t_(24,0.25) S_n/5]
$

Intervalo: #ic(datos, 2.0639)

Para $sigma^2$ tomo $(n-1)S_n^2/sigma^2 tilde Chi_(n-1)^2$

$PP(Y > z_(n,beta)) = beta,   quad Y tilde chi_n^2\

PP(z_(n,1-beta/2)<Y < z_(n,beta/2)) = (1- P(Y >z_(n,beta/2))) - P(Y < z_(n,1-beta/2))\

= 1-beta/2 -(1-P(Y>z_(n,1-beta/2))) = 1-beta/2 - (1-(1-beta/2))\
1-beta/2 -(1-1+beta/2)= 1- beta/2 -beta/2 = 1-beta$




$P(z_(n-1,1-beta/2)<(n-1)S_n^2/sigma^2 < z_(n-1,beta/2)) = P(z_(n-1,1-beta/2)/(n-1) 1/s_n^2< 1/sigma^2< z_(n-1,beta/2)/(n-1) 1/s_n^2)\
= P(s_n^2/z_(n-1,beta/2)(n-1)< sigma^2< s_n^2/z_(n-1,1-beta/2)(n-1))$

IC$(sigma^2) = [s_n^2/z_(n-1,beta/2)(n-1), s_n^2/z_(n-1,1-beta/2)(n-1)]$





#let inter_sigma(data,z1,z2) ={
  let m = mean(data)
  let s = variance(data)
  let n = data.len()
  (
    calc.round(s * (n - 1) / z1,digits: 4),
    calc.round(s * (n - 1) / z2,digits: 5)
    
  )
  
} 

IC$(sigma^2) =$#inter_sigma(datos,42.980,13.848) de nivel 0.9=> beta = 0.1

b)

$P(s_n^2/z_(n-1,beta/2)(n-1)< sigma^2< s_n^2/z_(n-1,1-beta/2)(n-1))\
P(sqrt(s_n^2/z_(n-1,beta/2)(n-1))< sigma< sqrt(s_n^2/z_(n-1,1-beta/2)(n-1)))$


#let xx = inter_sigma(datos,42.980 ,13.848 ) 
IC($sigma$) = [#calc.round( calc.sqrt(xx.at(0) ),digits: 4),#calc.round( calc.sqrt(xx.at(1)),digits: 4)]
de nivel 0.9

c)

$= P( dash(X)-t_(n-1,alpha/2) S_n/sqrt(n)< mu < dash(X)+ t_(n-1,alpha/2) S_n/sqrt(n))\
= P(-( dash(X)-t_(n-1,alpha/2) S_n/sqrt(n))> -mu > -(dash(X)+ t_(n-1,alpha/2) S_n/sqrt(n)))\

= P(e^(-( dash(X)-t_(n-1,alpha/2) S_n/sqrt(n)))> e^(-mu) > e^(-(dash(X)+ t_(n-1,alpha/2) S_n/sqrt(n))))$

IC($e^(-mu)$) = [$e^(-(dash(X)+ t_(n-1,alpha/2) S_n/sqrt(n))), e^(-( dash(X)-t_(n-1,alpha/2) S_n/sqrt(n)))$]

#let xx = ic(datos, 2.0639)

IC($e^(-mu)$) = [#calc.round( calc.exp(-xx.at(1)),digits: 4),#calc.round( calc.exp(-xx.at(0)),digits: 4)]
de nivel 0.95

#image("image5.png")


a) $x tilde epsilon(lambda) => Y = 2lambda X tilde chi_2^2$

con x>0

$P(Y<x) = P(2 lambda X<x) = P(X < x/(2lambda)) = integral_0^(x/(2 lambda)) lambda e^(-lambda x)d x\
= eva(-e^(-lambda x))_0^(x/(2 lambda)) = 1-e^(-x/2)\

(d P_Y (x))/(d x) = f_Y (x) = 1/2 e^(- x/2)\
=> Y tilde epsilon(1/2) = Gamma(1,1/2) = Gamma(2/2,1/2) = chi_2^2$

b)

$X tilde epsilon(lambda)$

$T = 2 lambda sum_(i = 1)^n X_i tilde chi_(2n)^2$

Suma de gammas $Gamma(.,lambda)$ da una gamma

como $X_i$ es una Gamma $sum X_i$ es una gamma

$T = 2 lambda sum_(i =1)^n X_i tilde 2lambda Gamma(n,lambda)$ se puede ver por el inciso (a) o por la hoja queda $2lambda Gamma(n,lambda) tilde Gamma(n,1/2) tilde Gamma(2n/2,1/2) tilde chi_(2n)^2$ 


c)

intervalo de confianza para $lambda$ de nivel $1-alpha$ basado en una muestra de tamaño n.

Sea $P(T> z_alpha) =alpha,quad T tilde chi_(2n)^2$


$P(z_(1-alpha/2)<T < z_(alpha/2)) = P(z_(1-alpha/2)< 2lambda sum_(i = 1)^n X_i  < z_(alpha/2))\
P(z_(1-alpha/2)< 2lambda dash(X)n  < z_(alpha/2))= P(z_(1-alpha/2)/(2dash(X)n)< lambda   < z_(alpha/2)/(2dash(X)n))$

IC($lambda$) = $[z_(1-alpha/2)/(2dash(X)n), z_(alpha/2)/(2dash(X)n)]$


d)

estimacion por intervalos para $lambda$ de nivel 0.99

#let datos = (25, 45 ,50, 61, 39, 40, 45 ,47, 38, 39,
54, 60, 39, 46, 39, 50, 42, 50,62,50)

hay #datos.len() datos

#let inter_5(data,z1,z2) ={
  let m = mean(data)
  let n = data.len()
  (
    calc.round(z1 /(2*n*m),digits: 4),
    calc.round(z2 /(2*n*m),digits: 5)
    
  )
  
} 

1- alpha = 0.99 => alpha = 0.01, alpha/2 = 0.005 

#inter_5(datos,20.707 ,67.985)

"1/λ∈(25.6,84.0) dıˊas aprox."


#image("image (1).png")

a) 

$W = T/theta; P(W<x) = P(T<x theta) = P(max X_i < x theta) \
= product_(i=1)^n P(X_i<x theta)= cases((eva(x/theta)_0^(x theta))^n "si " 0< x theta < theta,
0 "otro" ) = cases(x^n "si" 0<x<1, 0 "otro") \
 = x^n II_[0,1](x)\

 f_W (x) =  n x^(n-1) II_[0,1](x)$

 es independiente de $theta$.


 b)

 
$P(W > z_alpha) = alpha; W tilde T/theta$

$P(z_(1-alpha/2)< W< z_(alpha/2)) = 1-alpha = P(z_(1-alpha/2)/T < 1/theta < z_(alpha/2)/T )\
= P(T/z_(alpha/2) < theta <T/z_(1-alpha/2) )$

IC($theta$) = $[max(X_i)/z_(alpha/2), max(X_i)/z_(1-alpha/2)]$

""

$P(z_(1-alpha)<W< z_alpha) = P(W< z_alpha ) - P(W<z_(1-alpha)) \
= [1- P(W> z_alpha)] - [1- P(W>z_(1-alpha))]\
= 1-alpha -(1-(1-alpha)) =1-alpha -(alpha)= 1-2alpha $


c) busco el intervalo de nivel de longitud minima 


$P(A< W< B) = 1-alpha\
P(A<W<B) = F(B) - F(A) = B^n - A^n; 0< A < B < 1\

$

busco minimar ($max X_i [1/A - 1/B] $)

$B^n = A^n +1 -alpha$

$g(A) = 1/A - 1/(A^n +1 -alpha)^(1/n)\
g'(A) = -A^(-2) + 1/n (A^n +1 -alpha)^(-1/n -1)n A ^(n-1) = 0\

(A^n + 1 -alpha)^(n+1) =  A^(n+1)<=> A = B abs!$

no puede valer lo mismo pq $B^n - A^n = 1-alpha$

evaluo en los bordes:

en el limite de A tendiendo a 0 g(A) se va a infinito;

de A tendiendo a B la resta da 0 y no se cumpliria la condicion asi que esto no puede pasar

de B tendiendo a 1 $B^n - A^n = 1 - A^n = 1- alpha <=> A^n = alpha$

IC($theta$) = T($root(n,alpha)$,1)

== 7)
#image("image7.png")


a) 

  $B(1,p)$

  sea $X_i tilde B(1,p), EE(X) = p, VV(X) = p(1-p)$

  $sqrt(n)(dash(X)- p)/sqrt(p(1-p)) to^D N(0,1)\
  hat(p) = dash(X) to^P p\
  $
  
  busco la convergencia de:
  
  $sqrt(n)(dash(X)- p)/(sqrt(hat(p) (1-hat(p))))

  = sqrt(n)(dash(X)- p)/sqrt(p (1-p)) (sqrt(hat(p)(1-hat(p))))/sqrt(p (1-p)) to^("Slutsky ")_D N(0,1)
  $ 

  Por lo tanto:

  $P(-z_alpha < sqrt(n)(dash(X)- p)/(sqrt(hat(p) (1-hat(p)))) < z_alpha) \
  = P(-z_alpha (sqrt(hat(p) (1-hat(p))))/sqrt(n) - dash(X) < -p < z_alpha (sqrt(hat(p) (1-hat(p))))/sqrt(n) - dash(X))\
  = P(-z_alpha (sqrt(hat(p) (1-hat(p))))/sqrt(n) + dash(X) < p < z_alpha (sqrt(hat(p) (1-hat(p))))/sqrt(n) + dash(X)) to 1- 2 alpha\
  $

  El intervalo de confianza de nivel asintotico 1- alpha para p es:
  IC_asin (p) = $[-z_alpha (sqrt(dash(X) (1-dash(X))))/sqrt(n) + dash(X) ,z_alpha (sqrt(dash(X) (1-dash(X))))/sqrt(n) + dash(X)]$

b)
 
 $X_i = cases(1 "si se curo", 0 "si no se curo")\
 
 dash(X) = 3/10$

 como se quiere el un nivel asintotico 0.95 $alpha = 0.05, alpha/2 = 0.025, z_alpha = z_(0.025) $
 
 IC_asin (p) = $[-z_(0.025) (sqrt(0.3(1-0.3)))/sqrt(100) + 0.3 ,z_(0.025) (sqrt(0.3 (1-0.3)))/sqrt(n) + 0.3]$


IC_asin (p) = [
#calc.round(-1.96* calc.sqrt(0.3*(1-0.3))/calc.sqrt(100) + 0.3,digits: 4)
#calc.round(1.96* calc.sqrt(0.3*(1-0.3))/calc.sqrt(100) + 0.3,digits: 4)]

long(IC(p)) = #(calc.round((1.96* calc.sqrt(0.3*(1-0.3))/calc.sqrt(100) + 0.3)- (-1.96* calc.sqrt(0.3*(1-0.3))/calc.sqrt(100) + 0.3),digits: 4))

c)

long(IC(p)) = $2 z_alpha (sqrt(dash(X) (1-dash(X))))/sqrt(n)$

$0.1>2 z_alpha (sqrt(dash(X) (1-dash(X))))/sqrt(n) <=> (0.05/z_alpha)^2 > (dash(X)(1-dash(X)))/n $

$f(x)  =x(1-x), 0<= x<= 1\
f'(x) = 1-2x = 0; x = 1/2$

alcanza su maximo en x = 0.5

$0.5/n >= (dash(X)(1-dash(X)))/n$ busco n tal que:

$(0.05/z_alpha)^2 > 1/(2n) <=> n > 1/2 (z_alpha/0.05)^2 $

para z_alpha = 0.025

n > #calc.round(1/2 *calc.pow(1.96/0.05,2),digits: 0)

== 8)
#image("image8.png")

$X = cases(1 "si se recibe un bit con un" 1, 0 "si se recibe un bit con un" 0)$

P(X = 1) = 1/2

$P(Y =1 ) = P(Y = 1 | X = 1)P(X=1) + P(Y = 1|X= 0)P(X= 0)\
= P(Y = 1 | X = 1) 1/2 +  P(Y = 1|X= 0)1/2 = p/2 + (1-0.6)/2\
= p/2 + 0.2\
$

$P(Y =0 ) = P(Y = 0 | X = 1)P(X=1) + P(Y = 0|X= 0)P(X= 0)\
P(Y = 0 | X = 1)/2 + P(Y = 0|X= 0)/2 = (1-p)/2 + 0.6/2
= 1/2 -p/2 + 0.3 = 0.8 - p/2 $

$Y tilde B(1,p/2 + 0.2)$

sea $1-alpha = 0.95$ tal que $alpha/2 = 0.025$

n > 768 por el ejercicio anterior 

== 9)
  #image("image9.png")
stdsd
asd

asd

== 10)
