defmodule Repro.Domain.ResourceC do
  use Ash.Resource,
    domain: Repro.Domain,
    data_layer: :embedded

  attributes do
    attribute(:a, :string)
    attribute(:b, :string)
  end

  actions do
    defaults([:read, create: [:a, :b], update: [:a, :b]])
  end
end
