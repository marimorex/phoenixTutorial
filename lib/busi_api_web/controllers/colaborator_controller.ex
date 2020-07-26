defmodule BusiApiWeb.ColaboratorController do
    use BusiApiWeb, :controller
    alias BusiApi.Directory
    alias BusiApi.Directory.Colaborator

    action_fallback BusiApiWeb.FallbackController

    def index(conn, _params) do
      colaborators = Directory.list_collaborators()
      |>IO.inspect()
      render(conn, "index.json", colaborators: colaborators)
    end

    def create(conn, %{"colaborator" => colaborator_params}) do
      with {:ok, %Colaborator{} = colaborator} <- Directory.create_collaborator(colaborator_params) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.colaborator_path(conn, :show, colaborator))
        |> render("colaborator.json", colaborator: colaborator)
      end
    end

    def show(conn, %{"id" => id}) do
      colaborator = Directory.get_collaborator!(id)
      render(conn, "show.json", colaborator: colaborator)
    end

    def update(conn, %{"id" => id, "colaborator" => colaborator_params}) do
      colaborator = Directory.get_collaborator!(id)
      with {:ok, %Colaborator{} = colaborator} <- Directory.update_collaborator(colaborator, colaborator_params) do
        render(conn, "show.json", colaborator: colaborator)
      end
    end

    def delete(conn, %{"id" => id}) do
      colaborator = Directory.get_collaborator!(id)
      with {:ok, %Colaborator{}} <- Directory.delete_collaborator(colaborator) do
        send_resp(conn, :no_content, "")
      end
    end

    def get_businesess_collaborators(conn, %{"id" => id, "year" => year}) do
      colaborators = Directory.get_businesess_collaborators(id, year)
      |>IO.inspect()
      render(conn, "index.json", colaborators: colaborators)
    end


  end
