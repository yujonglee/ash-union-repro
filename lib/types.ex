defmodule Repro.Types.Config do
  use Ash.Type.NewType,
    subtype_of: :union,
    constraints: [
      types: [
        union_b: [type: Repro.Domain.ResourceB],
        union_c: [type: Repro.Domain.ResourceC]
      ]
    ]
end
