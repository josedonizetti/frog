module Frog
class Parser
macro
  BLANK          \s+
  NAME           [a-zA-Z][\w\-]*
  COMMENTS       \/\/.*
rule
  {BLANK}        //ignore blanks
  {COMMENTS}     //ignore comments

  \"[^"]*\"      { [:STRING, strip(text,1,1  )] }
  \'[^']*\'      { [:STRING, strip(text,1,1)] }

  -\s.*          { [:STATEMENT, strip(text,2,0)] }
  -.*            { [:STATEMENT, strip(text,1,0)] }
  \#{.*}         { [:EXPRESSION, strip(text,2,1)] }

  \#{NAME}       { [:ID, text] }
  \.{NAME}       { [:CLASS, text] }

  {NAME}         { [:IDENTIFIER, text] }

  .              { [text, text] }

inner
  def strip(text, left, right)
    text.slice(left, text.length - (left + right)).strip
  end
end
end
