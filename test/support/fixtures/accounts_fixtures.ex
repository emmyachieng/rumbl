defmodule Rumbl.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rumbl.Accounts` context.
  """

  @doc """
  Generate a unique credential email.
  """
  def unique_credential_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a credential.
  """
  def credential_fixture(attrs \\ %{}) do
    {:ok, credential} =
      attrs
      |> Enum.into(%{
        email: unique_credential_email(),
        password_hash: "some password_hash"
      })
      |> Rumbl.Accounts.create_credential()

    credential
  end
end
