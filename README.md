# Beyond the Optimum

## Chemical Engineering Decisions with Multiple Objectives and Uncertainty

![Beyond the Optimum](assets/beyond-the-optimum-banner.png)

**Beyond the Optimum** is a MATLAB teaching package for exploring how chemical engineering decisions emerge from process models, superstructures, multiple objectives, and uncertainty.

The example was developed for the keynote:

**Beyond the Optimum: Chemical Engineering Decisions with Multiple Objectives and Uncertainty**

The central idea is simple:

> **The optimum is an answer to a mathematical question. Engineering requires a decision.**

🌐 **Project website:**  
https://zondervanedwin-collab.github.io/beyond-the-optimum/

---

## From models to decisions

The example follows one process-design problem through a sequence of increasingly realistic questions:

**What could we build?**  
→ Superstructure

**Which configurations perform best?**  
→ Optimization

**Best according to what?**  
→ Multiple objectives

**What happens when the future changes?**  
→ Uncertainty

**Which alternative should we actually choose?**  
→ Engineering decision

The resulting workflow is:

**Models → Superstructure → Optimization → Objectives → Uncertainty → Decision**

---

## The teaching example

The repository uses a deliberately simplified low-carbon methanol process as a vehicle for demonstrating several core ideas in Process Systems Engineering.

The superstructure contains five binary technology decisions:

| Variable | Technology decision |
|---|---|
| `yH` | Electrolysis instead of purchased H₂ |
| `yR` | Dedicated renewable electricity |
| `yT` | Two-stage/intercooled reactor |
| `yS` | Enhanced separation |
| `yI` | Heat integration |

With five binary decisions, the unconstrained design space contains:

**2⁵ = 32 possible configurations**

Engineering logic eliminates infeasible combinations, leaving:

**24 feasible designs**

Multi-objective analysis subsequently identifies:

**7 Pareto-optimal configurations**

So the design process can be summarized as:

> **32 possible configurations → 24 feasible designs → 7 Pareto-optimal designs → engineering decision**

---

## Repository structure

```text
beyond-the-optimum/
│
├── README.md
├── LICENSE
├── CITATION.cff
├── .gitignore
│
├── assets/
│   └── beyond-the-optimum-banner.png
│
├── matlab/
│   ├── main.m
│   ├── model_data.m
│   ├── enumerate_configurations.m
│   ├── pareto_front.m
│   ├── epsilon_constraint.m
│   ├── uncertainty_analysis.m
│   ├── output_dir.m
│   └── plotting and utility scripts
│
├── figures/
│   ├── 01_all_configurations.png
│   ├── 02_pareto_front.png
│   ├── 03_epsilon_constraint.png
│   ├── 04_scenario_costs.png
│   └── 05_maximum_regret.png
│
└── docs/
    ├── Beyond_the_Optimum_Technical_Companion.pdf
    └── Beyond_the_Optimum_Technical_Companion_v2.docx
```

---

## Running the MATLAB example

Download or clone the repository and open the `matlab` directory in MATLAB.

Run:

```matlab
main
```

The script will:

1. enumerate the feasible superstructure configurations;
2. calculate cost and emissions indices;
3. identify the Pareto-optimal designs;
4. perform an epsilon-constraint analysis;
5. evaluate Pareto designs under alternative future scenarios;
6. calculate relative regret;
7. identify the minimax-regret solution; and
8. generate the principal figures used in the teaching example.

Generated figures are written automatically to the repository-level `figures` directory.

---

## Example outputs

### Feasible design space

The first analysis evaluates all feasible configurations in terms of annualized cost and emissions.

![Feasible superstructure configurations](figures/01_all_configurations.png)

The complete binary design space contains 32 combinations. After application of the engineering logic, 24 feasible configurations remain.

---

### Beyond a single optimum: the Pareto front

When cost and emissions are considered simultaneously, there is generally no single optimum.

![Pareto front](figures/02_pareto_front.png)

Instead, the model identifies a set of **non-dominated designs**. Improving one objective beyond this front necessarily worsens the other.

For the teaching example, seven configurations form the Pareto set:

**D1, D2, D9, D17, D18, D22 and D24.**

---

### Epsilon-constraint analysis

One way of generating the trade-off between cost and emissions is the epsilon-constraint method.

![Epsilon-constraint analysis](figures/03_epsilon_constraint.png)

Instead of combining objectives using arbitrary weights, emissions are progressively constrained while cost remains the objective.

This reveals how the preferred process configuration changes as the environmental requirement becomes more stringent.

---

### The optimum moves when the future changes

A design that performs well under one set of assumptions may not remain attractive when prices, electricity conditions, or other external factors change.

![Scenario-dependent costs](figures/04_scenario_costs.png)

The example therefore evaluates the Pareto configurations under several alternative scenarios.

The purpose is not to predict one future perfectly, but to explore how sensitive today's design decision is to different plausible futures.

---

### Decision-making under uncertainty

Scenario analysis can be translated into a decision criterion using **regret**.

For each scenario, regret measures how much worse a selected design performs relative to the best design that could have been chosen if that future had been known in advance.

![Maximum regret](figures/05_maximum_regret.png)

The minimax-regret strategy selects the configuration with the smallest worst-case relative regret.

This shifts the question from:

> *Which design is optimal?*

to:

> *Which design can I most comfortably live with if my assumptions turn out to be wrong?*

---

## Mathematical idea

The topology decisions are represented by five binary variables:

$$
\mathbf{y} =
\begin{bmatrix}
y_H & y_R & y_T & y_S & y_I
\end{bmatrix}^{T}
$$

with:

$$
y_i \in \{0,1\}
$$

A simple engineering-logic constraint is:

$$
y_R \leq y_H
$$

which states that renewable electricity can only be selected when electrolysis is present.

More generally, the process model contains continuous operating and design variables $\mathbf{x}$ together with discrete topology variables $\mathbf{y}$.

The multi-objective problem can therefore be written conceptually as:

$$
\min_{\mathbf{x},\mathbf{y}}
\left[
C(\mathbf{x},\mathbf{y}),
E(\mathbf{x},\mathbf{y})
\right]
$$

where $C$ represents annualized cost and $E$ represents emissions.

The epsilon-constraint formulation converts the multi-objective problem into a series of single-objective problems:

$$
\min_{\mathbf{x},\mathbf{y}}
C(\mathbf{x},\mathbf{y})
$$

subject to:

$$
E(\mathbf{x},\mathbf{y}) \leq \varepsilon
$$

By progressively tightening $\varepsilon$, different trade-offs between cost and emissions are revealed, allowing the Pareto front to be constructed.

---

## Under the hood: the process superstructure

The compact MATLAB model is deliberately transparent enough for teaching. A more detailed process-synthesis formulation would include:

- component and overall material balances;
- reactor stoichiometry and conversion relations;
- recycle and separation equations;
- hydrogen-production constraints;
- electricity-source constraints;
- energy balances and heat recovery;
- equipment-capacity constraints;
- product-quality requirements;
- annualized capital and operating costs;
- environmental constraints; and
- binary engineering logic.

For example, the methanol reaction can be represented using reaction extent $\xi$:

$$
F_{CO_2}^{out} = F_{CO_2}^{in} - \xi
$$

$$
F_{H_2}^{out} = F_{H_2}^{in} - 3\xi
$$

$$
F_{MeOH}^{out} = F_{MeOH}^{in} + \xi
$$

with a topology-dependent conversion relation such as:

$$
\xi = X_{CO_2}(y_T) F_{CO_2}^{in}
$$

and separation/recycle relations of the form:

$$
F_i^r = \rho_i(y_S)F_i^{out}
$$

Heat integration can similarly be represented by:

$$
Q_{ext} \geq Q_{proc} - \eta_{HI} y_I Q_{rec}
$$

Together, continuous process equations and binary technology decisions lead naturally to a **Mixed-Integer Nonlinear Programming (MINLP)** formulation.

The detailed pedagogical formulation is developed in the Technical Companion.

---

## Technical companion

A detailed companion document is included in the `docs` directory:

**Beyond the Optimum — Technical Companion**

It contains:

- detailed description of the superstructure;
- mathematical-programming formulation;
- process balances;
- constitutive equations;
- operating and design constraints;
- environmental constraints;
- engineering logic;
- Pareto analysis;
- epsilon-constraint method;
- scenario analysis;
- minimax-regret formulation;
- explanation of the MATLAB implementation; and
- a more detailed pedagogical MINLP formulation.

PDF:

`docs/Beyond_the_Optimum_Technical_Companion.pdf`

An editable Word version is also provided.

---

## Why this is a teaching model

The numerical cost and emissions values used in the MATLAB package are **normalized teaching indices**.

The example is designed to make the structure of superstructure optimization and engineering decision-making transparent. It is **not** a validated techno-economic model of an industrial methanol plant.

The repository contains no proprietary industrial process data.

The detailed mathematical model in the Technical Companion should therefore be interpreted as a **pedagogical extension** showing how the simplified teaching example maps onto a recognizable process-systems MINLP.

---

## Connection to advanced and hybrid process modeling

The framework is intentionally model-agnostic.

The simple algebraic relations used here could be replaced by:

- rigorous first-principles process models;
- dynamic simulations;
- surrogate models;
- reduced-order models;
- machine-learning models; or
- hybrid first-principles/data-driven models.

This leads to the broader chain:

> **Better models → richer alternatives → better optimization → better engineering decisions**

The purpose of modeling is therefore not merely to predict process behaviour. Models become part of a larger decision architecture.

---

## Workshop context

This teaching example was developed for the **Advanced Process Modeling Workshop 2026**, organized by Saudi Aramco.

The broader workshop theme concerns hybrid modeling, advanced process modeling, and machine learning in reactor and process technology development.

*Beyond the Optimum* complements that theme by asking what happens **after we have built the model**:

> How do we use models to make engineering decisions when several designs, objectives, and possible futures compete?

---

## Project website

An online version of the project is available at:

**https://zondervanedwin-collab.github.io/beyond-the-optimum/**

The website provides access to the teaching material, MATLAB package, figures, and technical documentation.

---

## Citation

If you use the package in teaching, research, or presentations, please cite the repository.

GitHub provides citation information through the repository's `CITATION.cff` file using the **Cite this repository** function.

Repository:

**https://github.com/zondervanedwin-collab/beyond-the-optimum**

---

## License

The MATLAB software in this repository is released under the **MIT License**.

See `LICENSE` for details.

---

## Author

**Edwin Zondervan**  
Process Systems Engineering  
University of Twente  
The Netherlands

---

## Final thought

> **Models predict. Optimization explores. Engineers decide.**

The value of a model lies not in finding the single best answer, but in helping us make better engineering decisions.
