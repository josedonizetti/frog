module HtmlRuby
class Parser
macro
  BLANK          \s+
  NAME           [a-zA-Z][\w\-]*
  COMMENTS       \/\/*
rule
  {BLANK}        //ignore comments
  {COMMENTS}     //ignore comments

  \"[^"]*\"      { [:STRING, strip(text,1)] }
  \'[^']*\'      { [:STRING, strip(text,1)] }

  {{.*}}         { [:EXPRESSION, strip(text,2)] }
  {%.*%}         { [:STATEMENT, strip(text,2)] }

  \#{NAME}       { [:ID, text] }
  \.{NAME}       { [:CLASS, text] }

  {NAME}         { [:IDENTIFIER, text] }

  .              { [text, text] }

inner
  def strip(text, size)
    text.slice(size, text.length - (size * 2)).strip
  end
end
end
