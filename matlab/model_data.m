function data = model_data()
% Binary y = [yH yR yT yS yI]
data.techNames = {'Electrolysis','Renewables','Two-stage reactor','Enhanced separation','Heat integration'};
data.C0 = 100;
data.c  = [6 2 4 4 2];
data.E0 = 100;
data.e  = [-15 -28 -6 -5 -8];
data.scenarios = table(["Favourable";"Reference";"Stress"], [0.60;1.00;3.00], [0.90;1.00;1.50], [-3.0;0.0;8.0], ...
    'VariableNames', {'Scenario','pH2','pe','r'});
end
