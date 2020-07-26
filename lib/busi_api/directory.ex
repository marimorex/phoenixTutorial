defmodule BusiApi.Directory do
  @moduledoc """
  The Directory context.
  """

  import Ecto.Query, warn: false
  alias BusiApi.Repo

  alias BusiApi.Directory.Business

  @doc """
  Returns the list of businesses.

  ## Examples

      iex> list_businesses()
      [%Business{}, ...]

  """
  # def list_businesses do
  #   query = from b in Business,
  #           join: c in assoc(b, :colaborators),
  #           preload: [colaborators: c]
  #   Repo.all(query)
  # end

  def list_businesses, do: Repo.all(Business) |> Repo.preload([:colaborators])


  @doc """
  Gets a single business.

  Raises `Ecto.NoResultsError` if the Business does not exist.

  ## Examples

      iex> get_business!(123)
      %Business{}

      iex> get_business!(456)
      ** (Ecto.NoResultsError)

  """
  def get_business!(id), do: Repo.get!(Business, id) |> Repo.preload([:colaborators])

  @doc """
  Creates a business.

  ## Examples

      iex> create_business(%{field: value})
      {:ok, %Business{}}

      iex> create_business(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_business(attrs \\ %{}) do
    %Business{}
    |> Business.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a business.

  ## Examples

      iex> update_business(business, %{field: new_value})
      {:ok, %Business{}}

      iex> update_business(business, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_business(%Business{} = business, attrs) do
    business
    |> Business.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a business.

  ## Examples

      iex> delete_business(business)
      {:ok, %Business{}}

      iex> delete_business(business)
      {:error, %Ecto.Changeset{}}

  """
  def delete_business(%Business{} = business) do
    Repo.delete(business)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking business changes.

  ## Examples

      iex> change_business(business)
      %Ecto.Changeset{data: %Business{}}

  """
  def change_business(%Business{} = business, attrs \\ %{}) do
    Business.changeset(business, attrs)
  end

  @spec get_businesess_collaborators(any, any) :: any
  def get_businesess_collaborators(id,year) do
    query = from b in Business,
                where: b.id == ^id and b.year == ^year,
                join: c in Colaborator,
                on: c.business_id == b.id,
                select: c
    Repo.all(query)
  end

  alias BusiApi.Directory.Colaborator

  def list_collaborators, do: Repo.all(Colaborator) |> Repo.preload([:business])

  def get_collaborator!(id), do: Repo.get!(Colaborator, id) |> Repo.preload([:business])

  def create_collaborator(attrs \\ %{}) do
    %Colaborator{}
    |> Colaborator.changeset(attrs)
    |> Repo.insert()
  end

  def update_collaborator(%Colaborator{} = colaborator, attrs) do
    colaborator
    |> Colaborator.changeset(attrs)
    |> Repo.update()
  end

  def delete_collaborator(%Colaborator{} = colaborator) do
    Repo.delete(colaborator)
  end

  def change_collaborator(%Colaborator{} = colaborator, attrs \\ %{}) do
    Colaborator.changeset(colaborator, attrs)
  end

end
