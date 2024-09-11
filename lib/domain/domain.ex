defmodule Repro.Domain do
  use Ash.Domain

  resources do
    resource(Repro.Domain.ResourceA)
  end
end
