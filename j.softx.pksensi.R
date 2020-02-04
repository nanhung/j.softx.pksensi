# Example: One-compartment pbtk model ------------------------------------
library(pksensi)
library(httk)

# Step 1. Construct 1-cpt pbtk model
pbtk1cpt <- function(t, state, parameters) {
  with(as.list(c(state, parameters)), {
    dAgutlument = - kgutabs * Agutlument
    dAcompartment = kgutabs * Agutlument - ke * Acompartment
    dAmetabolized = ke * Acompartment
    Ccompartment = Acompartment / vdist * BW;
    list(c(dAgutlument, dAcompartment, dAmetabolized), 
         "Ccompartment" = Ccompartment) 
  })
}

# Step 2. Define initial conditions, output time steps and variable
initState <- c(Agutlument = 10, Acompartment = 0, Ametabolized = 0)
t <- seq(from = 0.01, to = 24.01, by = 1)
outputs <- c("Ccompartment")

# Step 3. Generate parameter matrix 
## 3.1. Extract parameter value from httk package
pars1comp <- (parameterize_1comp(chem.name = "acetaminophen"))

## 3.2. Set parameter distributions
q <- c("qunif", "qunif", "qunif", "qnorm")
q.arg <- list(list(min = pars1comp$Vdist / 2, max = pars1comp$Vdist * 2),
              list(min = pars1comp$kelim / 2, max = pars1comp$kelim * 2),
              list(min = pars1comp$kgutabs / 2, max = pars1comp$kgutabs * 2),
              list(mean = pars1comp$BW, sd = 5))

## 3.3. Create parameter matrix
set.seed(1234)
params <- c("vdist", "ke", "kgutabs", "BW")
x <- rfast99(params, n = 200, q = q, q.arg = q.arg, replicate = 10)

# Step 4. Run simulation 
out <- solve_fun(x, time = t, func = pbtk1cpt, initState = initState, outnames = outputs)

# Step 5. Check result
plot(out)   # Visualize result
check(out)  # Print result to console
