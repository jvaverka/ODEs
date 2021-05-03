# using DifferentialEquations

function lorenz!(du, u, p, t)
    σ, ρ, β = p
    du[1] = σ*(u[2]-u[1])
    du[2] = u[1]*(ρ-u[3]) - u[2]
    du[3] = u[1]*u[2] - β*u[3]
end

u₀ = [1.0,0.0,0.0]
p = (10, 28, 8/3)
tspan = (0.0, 100.0)
prob = ODEProblem(lorenz!, u₀, tspan, p)

sol = solve(prob)

sol.t[10],sol[10]
