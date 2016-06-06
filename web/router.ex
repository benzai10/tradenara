defmodule Tradenara.Router do
  use Tradenara.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Tradenara.Auth, repo: Tradenara.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Tradenara do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/categories", CategoryController, only: [:index, :show]
    resources "/companies", CompanyController, only: [:index, :front, :show]
    resources "/articles", ArticleController
  end

  scope "/manage", as: :manage do
    pipe_through [:browser, :authenticate_user]

    resources "/companies", Tradenara.CompanyController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Tradenara do
  #   pipe_through :api
  # end
end
