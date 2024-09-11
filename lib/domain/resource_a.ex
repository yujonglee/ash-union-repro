defmodule Repro.Domain.ResourceA do
  use Ash.Resource,
    domain: Repro.Domain

  attributes do
    uuid_primary_key(:id)
    attribute(:name, :string)
    attribute(:config, Repro.Types.Config)
  end

  actions do
    defaults([:read, create: [:name, :config], update: [:name, :config]])
  end
end
