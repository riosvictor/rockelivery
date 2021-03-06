defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      "address" => "Rua de cima, 89",
      "age" => 27,
      "cep" => "12345678",
      "cpf" => "12345678901",
      "email" => "sandro@banana.com",
      "name" => "Sandro Souza",
      "password" => "123456"
    }
  end

  def user_factory do
    %User{
      id: "eed5f246-1475-4b31-9822-e123d165f518",
      address: "Rua de cima, 89",
      age: 27,
      cep: "12345678",
      cpf: "12345678901",
      email: "sandro@banana.com",
      name: "Sandro Souza",
      password: "123456"
    }
  end

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
