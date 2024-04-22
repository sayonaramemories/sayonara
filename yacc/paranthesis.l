%{
#include "y.tab.h"
%}

%%
"(" { return '('; }
")" { return ')'; }
\n  { return '\n'; }
%%

