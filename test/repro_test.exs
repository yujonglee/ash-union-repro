defmodule ReproTest do
  use ExUnit.Case

  describe "repro" do
    setup do
      form =
        Repro.Domain.ResourceA
        |> AshPhoenix.Form.for_create(:create, forms: [auto?: true])

      %{form: form}
    end

    test "union_a", %{form: form} do
      try do
        form
        |> AshPhoenix.Form.submit(
          params: %{
            "name" => "foo",
            "config" => %{
              "_union_type" => "union_a",
              "a" => "a",
              "b" => "b"
            }
          }
        )
      rescue
        e in RuntimeError ->
          assert e.message
                 |> String.contains?("but no type with that name was found in the constraints")
      end
    end

    test "union_b", %{form: form} do
       {:ok, record} =  form
        |> AshPhoenix.Form.submit(
          params: %{
            "name" => "foo",
            "config" => %{
              "_union_type" => "union_b",
              "a" => "a",
              "b" => "b"
            }
          }
        )

        assert record.config.type == :union_b
        assert record.config.value.a == "a"
        assert record.config.value.b == "b"
    end

    test "union_c", %{form: form} do
      {:ok, record} =  form
      |> AshPhoenix.Form.submit(
        params: %{
          "name" => "foo",
          "config" => %{
            "_union_type" => "union_c",
            "a" => "a",
            "b" => "b"
          }
        }
      )

      assert record.config.type == :union_c
      assert record.config.value.a == "a"
      assert record.config.value.b == "b"
    end
  end
end
