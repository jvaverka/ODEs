# using DifferentialEquations
# using Plots; gr()

# canonical exponential growth model
f(u, p, t) = 0.98u
u₀ = 1.0
tspan = (0.0, 1.0)
prob = ODEProblem(f, u₀, tspan)

sol = solve(prob)

plot(
    sol,
    linewidth = 5,
    title = "Solution to the linear ODE with a thick line",
    xaxis = "Time (t)",
    yaxis = "u(t) (in μm)",
    label = "My Thick Line!",
) # legend=false

# overlay theoretical answer
plot!(
    sol.t,
    t -> 1.0 * exp(0.98t),
    lw = 3,
    ls = :dash,
    label = "True Solution!",
)

# compute arrays of functions of `sol` using standard comprehensions, like
[t + u for (u, t) in tuples(sol)]

# interpolate solution values at specified times by
sol(0.45)

# most useful solver options are tolerances
sol = solve(prob, abstol = 1e-8, reltol = 1e-8)

# replot to see difference
plot(sol)

# overlay theoretical answer
plot!(
    sol.t,
    t -> 1.0 * exp(0.98t),
    lw = 3,
    ls = :dash,
    label = "True Solution!",
)
