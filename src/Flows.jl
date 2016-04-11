VERSION >= v"0.4.5" && __precompile__()

module Flows

import 
    Base: (*), +, -, string, show, write, writemime

export TimeExpression, TimeVariable, TimeLinearCombination
export SpaceExpression, SpaceVariable, SpaceLinearCombination
export AutonomousFunction
export FunctionExpression, AutonomousFunctionExpression, FlowExpression
export E, coefficient, substitute, simplify
export print_time_expression_register, print_space_expression_register
export t_zero, x_zero
export t_derivative

export @t_vars, @x_vars, @funs

#export _str, _expand, _collect
#export _register, _str_flat_arg_name, _get_register_key
#export _time_expression_index, _time_expression_register
#export _space_expression_index, _space_expression_register


_str_from_objref(x) = hex(Int(pointer_from_objref(x)))

include("time_expressions.jl")
include("space_expressions.jl")
include("constructors.jl")
include("library.jl")

function __init__()
    global t_zero = _register(TimeLinearCombination([])) 
    global x_zero = _register(SpaceLinearCombination(Tuple{SpaceExpression, Real}[], 0)) 
end

end 
