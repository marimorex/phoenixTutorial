# BusiApi

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

- [Business](#business)
  - [Get All Business](#http://localhost:4001/api/businesses-get)
  - [Add New Business](#http://localhost:4001/api/businesses-post)
- [Collaborators](#collaborators)
  - [Get All Colaborators From a Business and a Year](#http://localhost:4001/api/get_collaborators_businesess_by_yearidyear-get)

### Business

#### http://localhost:4001/api/businesses (GET)

Get All Businesses Registered.

**REQUEST**
Headers: `Content-Type: application/json`

**RESPONSE**
```
{
    "data": [
        {
            "date": "2020-07-23 20:07:36",
            "description": "Short description ...",
            "id": 5,
            "name": "Company 1",
            "tag": "IT, Software",
            "year": 2000
        },
        {
            "date": "2020-07-23 20:07:36",
            "description": "Short description ...",
            "id": 6,
            "name": "Company 2",
            "tag": "Marketing",
            "year": 2000
        },
        {
            "date": "2020-07-23 20:07:36",
            "description": "Short description ...",
            "id": 7,
            "name": "Company 3",
            "tag": "Accounting",
            "year": 2000
        }
    ]
}
```

---

#### http://localhost:4001/api/businesses (POST)

Get All Businesses Registered.

**REQUEST**
Headers: `Content-Type: application/json`
```
{
  "business":
    {
      "name": "Yet another company",
      "description": "Another short description!",
      "tag": "A Tag"
    }
}
```
**RESPONSE**
```
{
    "data": {
        "date": "2020-07-23 22:09:43",
        "description": "Another short description!",
        "id": 11,
        "name": "Yet another company",
        "tag": "A Tag",
        "year": null
    }
}
```

---


Now you can visit [`localhost:4001`](http://localhost:4001) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).











### Collaborators
#### http://localhost:4001/api/get_collaborators_businesess_by_year/:id/:year (GET)

Get All Collaborators that belongs to a specific Business in a specific Year .

**REQUEST**
Headers: `Content-Type: application/json`
Path Variables: id = 1, year = 2000

**RESPONSE**
```
{
    "data": [
        {
            "email": "some@gmail.com",
            "id": 1,
            "lastname": "Doe",
            "name": "Jhon"
        }
    ]
}
```

---


## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
