#set page(fill: rgb("#5ea169"))
#set page(width: 14cm, height: 18cm)

#image("assets/image.png")
#let hh = h(0.5em)
#let emv = "EMV"
#let to = $arrow.r.long$
#let eva(expr, size: 100%) = $lr(#expr|, size: #size)$
#let ECM(a) = $E C M(#a)$


- $cal(B)(theta), hh 0<theta<1$.


$ emv(theta) &= product_(i = 1)^n theta I_(x_i = 1)+ (1-theta)I_(x_i = 0)\
&= theta^(sum_(i= 1)^n I_(x_i = 1)) + (1-theta)^(sum_(i= 1)^n I_(x_i = 0))\
"Sean " B &= sum_(i= 1)^n I_(x_i = 1) quad "y"quad   n-B = (1-theta)^(sum_(i= 1)^n I_(x_i = 0))\
&= theta^B (1-theta)^(n-B)\
l(theta) &= B ln(theta) + (n-B)ln(1-theta)\
(partial l(theta))/(partial theta)&= B/theta - (n-B)/(1-theta) = 0\
=> (1-theta) B &= theta(n -B) <=> B - B theta = theta n - theta B \
=> B/n &= (sum_(i= 1)^n I_(x_i = 1))/n = (sum_(i= 1)^n x_i)/n = dash(X) = hat(theta) 
$

- $cal(P)(theta),hh 0<theta$.

$ emv(theta) &= product_(i = 1)^n sum_(k >= 0) theta^k/k! e^(-theta) I_(x_i = k)\
"Sea " B_k &= sum_(i= 1)^n I_(x_i = k) quad forall k >= 0 " tal que" sum_(k>= 0) B_k = n  \
&= product_(k>=0) (theta^k/k! e^(-theta))^(B_k)\

l(theta) &=  sum_(k>=0)  B_k ln(theta^k/k! e^(-theta))=    sum_(k>=0) (B_k ln(theta^k/k!) + ln(e^(-theta)))\
&= sum_(k>=0) (B_k ln(theta^k) -B_k ln(k!))  + n (-theta)\
(partial l(theta))/(partial theta) &= sum_(k>=0) B_k 1/(theta^k)(k theta^(k-1)) -n = sum_(k>=0) B_k k/(theta) -n = 1/theta sum_(k>=0) B_k k -n= 0\
=> hat(theta)_(E M V) &= (sum_(k>=0) B_k k)/n = (sum_(i=1)^n x_i)/n = dash(X)

$


- $cal(E)(theta), #h(0.5em) 0<theta$.

$ L(theta) &= product_(i = 1)^n  theta e^(-theta x_i) II_((0,+infinity))(x_i)\

"Supongamos que todas las" &x_i > 0 " sino" L(theta) = 0 #h(0.5em) forall theta.\

&=product_(i = 1)^n  theta e^(-theta x_i)\

l(theta) &= sum_(i=0)^n ln(theta) - theta x_i\

(partial l(theta))/(partial theta) &= sum_(i=0)^n 1/theta - x_i = 0\

=> hat(theta)_(emv) &= n/(sum_(i=1)^n x_i) = 1/dash(X)
$
Estimador de momentos de una bernulli, poison y exponencial
$dash(X), dash(X), 1/dash(X)$



El sesgo es $EE[hat(theta)] - theta $  y la varianza $VV[hat(theta)] =EE[(hat(theta)-EE[hat(theta)])^2]= EE[hat(theta)^2] - EE[hat(theta)]^2$ 

- $cal(B)(theta)$.
$ 
"Sesgo"(theta_M) + theta = EE[theta_M ] = EE[dash(X)] = sum_(i = 0)^n  EE(x_i)/n = sum_(i = 0)^n theta/n = theta 
\
"Sesgo"(theta_emv) + theta = EE[theta_emv ] = EE[dash(X)] = theta 
$

- $cal(P)(theta)$.

$ "Sesgo"(theta_M) + theta = "Sesgo"(theta_emv) + theta =  EE[theta_M ] = EE[dash(X)] = sum_(i = 0)^n  EE(x_i)/n \
= sum_(i = 0)^n theta/n = theta $

- $cal(E)(theta)$.

$

"Sesgo"(theta_M) + theta = "Sesgo"(theta_emv)+ theta =  EE[theta_M ] = EE[1/dash(X)] \
= n EE[1/(sum_(i =0)^n x_i)] = n EE[1/(Z)]; quad Z tilde Gamma(n,theta) 
\
"Sea" Z tilde Gamma(n,theta) => E[1/Z] = integral_(RR>0) 1/x theta^n/Gamma(n) x^(n-1) e^(-theta x) d x \
= integral_(RR>0) theta^n/(n-1)! x^(n-2) e^(-theta x) d x = theta^n/(n-1)! integral_(RR>0)  x^(n-2) e^(-theta x) d x \
= theta^n/(n-1)! (n-2)!/theta^(n-1)= theta /(n-1) 
$

$ => "Sesgo"(hat(theta))  = (n theta)/(n-1) - theta $

- Varianzas
 $EE[hat(theta)^2] - EE[hat(theta)]^2$

 - 1 y 2 
 $VV[dash(X)] = sum_(i=0)^n VV[X_i]$ por que al se indenpendientes su covarianza vale 0.
 
 $=> VV[hat(theta)] = n theta(1-theta) "para 1 y " n theta "para 2"$.

 - Para 3. 
 $ VV[hat(theta)]= VV[1/dash(X)]  = EE[1/dash(X)^2] - EE[1/dash(X)]^2 = EE[1/dash(X)^2] - (n theta)/(n-1);  $

 $ EE[1/(sum_(i=1)^n X_i)^2] = EE[1/Z^2] "con"quad Z tilde Gamma(n,theta) \
= integral_(RR>0) 1/x^2 theta^n/(n-1)! x^(n-1) e^(-theta x) d x = theta^n/(n-1)! integral_(RR>0) x^(n-3)e^(-theta x) d x \

=  theta^n/(n-1)! (n-3)!/theta^(n-2) = theta^2 /((n-1)(n-2))
\
=> VV(hat(theta)) =  theta^2 /((n-1)(n-2)) -  (n theta)/(n-1)
 $

#image("assets/image-1.png",width: 112%)

Hallar el estimador de maxima verosimilitud para cada servidor de theta para las densidades de cada servidor.

$ L(theta ) = product_(i = 1)^n theta ^4 x_i e ^(-theta^2 x_i), theta > 0
\
"Consideremos que" x_i > 0 quad forall i \

l(theta) = sum_(i=1)^n 4ln(theta ) + ln(x_i) -theta^2 x_i
\
(partial l(theta))/(partial theta)|_(theta_emv)=  sum_(i=1)^n 4/(theta ) -2 theta x_i = 4n/theta - 2theta n dash(X) = 0
\
2/theta = dash(X) <=> theta_emv =2/dash(X) 
$
la segunda derivada queda como
$ -4n/theta^2 - 2n dash(X)$ evaluando en $theta_emv$ resulta $ -4n/2 dash(X) - 2 dash(X)^2 n$ por criterio de la segunda derivada, esto es un maximo.


#image("assets/image-12.png")

#image("assets/image-metodo_delta.png")


a)

    $T_1 = e^(-1/dash(X)_n)$

    $sqrt(n) (dash(X)_n - 1/theta) to^D N(0, 1/theta^2)\
 sqrt(n), " Es una sucesion creciente"\
 "Tomando: " q(theta) = e^(-1/theta), "es "C^infinity.\
 q'(theta) = 1/theta^2 e^(-1/theta) \
 "Evaluando en "1/theta:
 q´(1/theta) = theta^2 e^(-theta) eq.not 0 "si "theta eq.not 0.\
 "Esto se cumple por que es condicíon que" theta>0 "para ser una exponencial."
 $
 
    $=> sqrt(n) (T_1^((n)) - e^(-1/theta)) to^D theta^2 e^(-theta) N(0,1/theta^2) = N(0, theta^2 e^(-2theta))$

    Para:

    $T_2^((n)) = 1/n sum_(i=1)^n I_[1,+ infinity)(X_i) tilde B i (n,P(X_1>1))$
    
    pues $I_[1,infinity) (X_i) tilde B i(1,p) "con " p = P(X_1 > 1)$ y suma de "n" binomiales indenpendientes de parametro p es $B i (n,p) $  

    $T_2^((n)) = 1/n sum_(i = 1)^n B i (1,p) \
    EE( B i (1,p) ) = p ; VV( B i (1,p) ) = p (1-p)\
    sqrt(n) (T_2^((n)) - p) to^D N(0, p (1-p))\
     = N(0, e^(theta) (1-e^theta))  $


    De $T_1$ tenemos $ N(0, theta^2 e^(-2theta)) = A$

    De $T_2$ tenemos $ N(0, e^(theta) (1-e^theta))= B$

    #image("assets/image-ECM.png")
    #image("assets/image-ECM_VV.png")

    $ECM(A) = VV(A) + (BB(A))^2 =  sqrt( theta^2 e^(-2theta))+ 0 +theta^2 = theta e^(-theta) + theta^2\
    ECM(B) = VV(B) + (BB(B))^2 =  sqrt( e^(theta) (1-e^theta))+ 0 +theta^2 \
    = sqrt( e^(theta) (1-e^theta)) + theta^2\  
    ECM(A) > ECM(B) <=>theta e^(-theta)+theta^2 - (sqrt( e^(theta) (1-e^theta)) + theta^2) >0\
    <=> theta e^(-theta) - sqrt( e^(theta) (1-e^theta)) > 0; 1-e^theta >= 0 <=> 1>= e^theta\
    theta^2 e^(-2theta) - e^(theta) (1-e^theta)=theta^2 e^(-2theta)-e^(theta)  +e^(2theta) >0\
    <=> theta^2 e^(-2theta) + e^(2theta)> e^theta; theta in (-infinity,1] , x^2 <= x "con" x in (0,1], theta^2 e^(-2theta)<0\
    => abs!\
    ECM(B)<ECM(A) $

    La distribucion de B por tener menor ECM que A. para la mayoria de los theta's
    #image("assets/image-991.png")

b)

    No se.

#image("assets/image-17.png")

a) $q(mu)= P_mu (X<=2)$
 
 $ emv(mu)\
 L(mu) = product_(i = 1)^n 1/(sigma sqrt(2 pi)) e^(-(x_i-u)^2/(2 sigma^2)) \
 l(mu) = sum_(i = 1)^n (-(x_i-u)^2/(2 sigma^2) -ln(sigma sqrt(2 pi)))\
 
 eva((partial l(mu))/(partial mu))_mu_emv = 0 = sum_(i = 1)^n -2(x_i-u)  (-1)/(2 sigma^2) = (n dash(X) -n mu)/sigma^2\
 <=>  dash(X) = mu $
 $ emv(sigma^2) =(sum_(i = 1) ^(n)(x_i-mu_1)^2)/n $
 
 Estimo $mu$ con $mu_emv$ luego estimo $q(mu)$ con $q(mu_emv)$ tal que:

 $ P_mu_emv (X<=2) = integral_(-infinity)^2 1/( sqrt(2 pi)) e^(-(x-dash(X))^2/(2)) d x $

 $"Sea:" f :RR to RR\
 f(theta) = integral_(-infinity)^2 1/( sqrt(2 pi)) e^(-(x-theta)^2/(2)) d x\
 sqrt(n)(f(mu_emv) - f(mu)) to^(D) f'(mu)N(0,1)$
 
 Calculemos  $f'(theta)$
 
 $=integral_(-infinity)^2 1/( sqrt(2 pi)) (x-theta) e^(-(x-theta)^2/(2)) d x = sqrt(2)/sqrt( pi) integral_(-infinity)^((2-theta)/sqrt(2)) y e ^(-y^2) d y = sqrt(2)/sqrt( pi) eva([-1/2 e ^(-y^2)])_(-infinity)^((2-theta)/sqrt(2))= -1/sqrt(2 pi) e^(-(2-theta)^2/2)
 
 $

 Por lo tanto:
 $ sqrt(n)(f(mu_emv) - f(mu))to^(D) -1/sqrt(2 pi) e^(-(2-mu)^2/2) N(0,1) = N(0,e^(-(2-mu)^2)/(2 pi))$

 Su distribución asintotica seria:
 $N(0,e^(-(2-mu)^2)/(2 pi))$
 
b)

 Buscar una función $g$ tal que $EE[g(X_1)] = q(mu)$ y luego estimar $EE[g(X_1)]$ con $1/n sum _(i = 1)^n g(X_i)$

 $EE[g(X_1)] = q(mu) =  P_mu (X<=2)\
 EE[g(X_1)] = integral_RR g(x) 1/( sqrt(2 pi)) e^(-(x-mu)^2/(2)) d x\
 "Tomando "g(x) = I_(-infinity,2](x) $ se cumple.

 Luego:

 $1/n sum _(i = 1)^n g(X_i)=hat(q(mu))\
 1/n sum _(i = 1)^n  I_(-infinity,2](x_i) = hat(q(mu))$ 
 
 $I_(-infinity,2](X_i) tilde B(P (X_i<=2))\
  
   hat(q(mu)) = 1/n B i(n,p )\
  (hat(q(mu))-p)sqrt(n) =  (1/n B i(n,p) )-p)sqrt(n) to^D N(0,p(1-p))\
  "Con "p =  P_mu (X_i<=2)
  
  $

#image("assets/image-18.png")

a)
    
    $ theta_emv = max_(1<=i<=n){x_i}$

    $EE(theta_emv) to theta$ ejercicio 9

    $VV(theta_emv) = (n theta²)/(n+2) - (n/(n+1)theta)²\= (n theta²)/(n+2) -(n^2theta^2)/(n+1)^2 to theta^2-theta^2 = 0 $

    $theta_emv$ es debilmente consistente.

    Mas aun

    $P(abs(theta_emv-theta)>epsilon) = P(theta >max(x_1,dots,x_n) + epsilon) \
    = product_(i =1)^n P(theta - epsilon>X_i) = 1/theta^n (theta - epsilon)^n \
    = (1 -epsilon/theta)^n to 0\
    => theta_emv to^P theta$

    Es fuertemente consistente

    $n(theta - X^((n))) to^D W tilde exp(1/(theta)), quad X^((n)) = max(U_1,dots,U_n)$

    $n(X^((n)) - theta) = -n(theta - X^((n))) to^D W tilde -exp(1/(theta))$
    
    Es una exponencial reflejada, su soporte es $II_(-infinity,0]$

b) 

    $theta_M = 2 dash(X)\
    EE(theta_M) = 2 EE(dash(X))= 2 theta/2 = theta\
    
    VV(theta_M) = 1/n theta^2/3  to 0$
    
    $dash(X) to^p  theta/2\
    2 dash(X) to^p theta $

    su distribucion asintotica
    
    $ 2sqrt(n)(dash(X) - theta) to^D N(0,theta^2/3)$


#image("assets/image-19.png")

a)
    
    $hat(theta)_"Mom" (X)\
  EE(X)= theta/(theta + 1)\
  1/n sum_(i=1)^n X_i = EE(X)\
  1/n sum_(i=1)^n X_i = theta_M/(theta_M + 1)= 1 - 1/(theta_M + 1) <=> 1-dash(X) = 1/(theta_M + 1) <=> theta_M = 1/(1 - dash(X))-1\
  $

b)
    
    $1/(1 - dash(X))-1 to^p 1/(1 - theta/(theta + 1))-1 = (theta+1)-1 = theta  $

    es fuertemente consistente

c)

    $theta_M = 1/(1 - dash(X))-1\
    "sea" g(x) = 1/(1 - x)-1\
    g(theta/(theta + 1)) = theta\

    g'(x) = 1/(1-x)^2\
    g'(theta/(theta + 1)) = 1/(1-theta/(theta + 1))^2 = (theta + 1)^2\
    
    sqrt(n)(hat(theta)_"Mom" (X) - theta) to^D  (theta + 1)^2 N(0,theta/((theta+1)^2 (theta + 2)) )=N(0,theta (theta+1)^2/(theta + 2) )$



    
    