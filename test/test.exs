defmodule French do
  quote do
    defmacro si(condition, clauses) do
      Kernel.if(condition, clauses)
    end
  end
end

defmodule Foo do
  import French

  def bar(bool) do
    si bool do
      true
    end
  end
end
