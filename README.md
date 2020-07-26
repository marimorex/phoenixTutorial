# BusiApi

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

- [Businesses](#businesses)
  - [Get All Business](#http://localhost:4001/api/businesses-get)
  - [Get a Business](#http://localhost:4001/api/businessesid-get)
  - [Add a Business](#http://localhost:4001/api/businesses-post)
  - [Update a Business](#http://localhost:4001/api/businessesid-put)
  - [Delete a Business](#http://localhost:4001/api/businessesid-delete)
- [Collaborators](#collaborators)
  - [Get All Collaborators](#http://localhost:4001/api/collaborators-get)
  - [Get one Collaborator](#http://localhost:4001/api/collaboratorsid-get)
  - [Add a Collaborator](#http://localhost:4001/api/collaborators-post)
  - [Update a Collaborator](#http://localhost:4001/api/collaboratorsid-put)
  - [Delete a Collaborator](#http://localhost:4001/api/collaboratorsid-delete)
  - [Get All Colaborators From a Business and a Year](#http://localhost:4001/api/get_collaborators_businesess_by_yearidyear-get)

### Businesses

#### http://localhost:4001/api/businesses (GET)

Get All Businesses Registered.

**REQUEST**
Headers: `Content-Type: application/json`

**RESPONSE**
```
{
    "data": [
        {
            "collaborators": {
                "data": [
                    {
                        "email": "some@gmail.com",
                        "id": 1,
                        "lastname": "Doe",
                        "name": "Jhon"
                    }
                ]
            },
            "date": "2020-07-26 00:39:09",
            "description": "Short description ...",
            "id": 1,
            "name": "Company 1",
            "tag": "IT, Software",
            "year": 2000
        },
        {
            "collaborators": {
                "data": [
                    {
                        "email": "some@gmail.com",
                        "id": 2,
                        "lastname": "Dow",
                        "name": "Jane"
                    }
                ]
            },
            "date": "2020-07-26 00:39:09",
            "description": "Short description ...",
            "id": 2,
            "name": "Company 2",
            "tag": "Marketing",
            "year": 2000
        },
        {
            "collaborators": {
                "data": [
                    {
                        "email": "some@gmail.com",
                        "id": 3,
                        "lastname": "Other",
                        "name": "Some"
                    }
                ]
            },
            "date": "2020-07-26 00:39:09",
            "description": "Short description ...",
            "id": 3,
            "name": "Company 3",
            "tag": "Accounting",
            "year": 2000
        }
    ]
}
```

---
#### http://localhost:4001/api/businesses/:id (GET)

Get one Business Registered.

**REQUEST**
Headers: `Content-Type: application/json`
Path Variables: `id` = `1`

**RESPONSE**
```
{
    "data": {
        "collaborators": {
            "data": [
                {
                    "email": "some@gmail.com",
                    "id": 1,
                    "lastname": "Doe",
                    "name": "Jhon"
                }
            ]
        },
        "date": "2020-07-26 00:39:09",
        "description": "Short description ...",
        "id": 1,
        "name": "Name Updated",
        "tag": "IT, Software",
        "year": 2000
    }
}
```

---
#### http://localhost:4001/api/businesses (POST)

Store a new Business.

**REQUEST**
Headers: `Content-Type: application/json`
```
{
  "business":
    {
      "name": "Yet another new company",
      "description": "Another new short description!",
      "tag": "A Tag",
      "year": "2000"
    }
}
```
**RESPONSE**
```
{
    "date": "2020-07-26 00:51:36",
    "description": "Another new short description!",
    "id": 4,
    "name": "Yet another new company",
    "tag": "A Tag",
    "year": 2000
}
```

---
#### http://localhost:4001/api/businesses/:id (PUT)

Update a Business

**REQUEST**
Headers: `Content-Type: application/json`
Path Variables: `id` = `1`
```
{
  "business":
    {
      "name": "Name Updated"
    }
}
```
**RESPONSE**
```
{
    "data": {
        "collaborators": {
            "data": [
                {
                    "email": "some@gmail.com",
                    "id": 1,
                    "lastname": "Doe",
                    "name": "Jhon"
                }
            ]
        },
        "date": "2020-07-26 00:39:09",
        "description": "Short description ...",
        "id": 1,
        "name": "Name Updated",
        "tag": "IT, Software",
        "year": 2000
    }
}
```

---
#### http://localhost:4001/api/businesses/:id (DELETE)

Delete one Business.

**REQUEST**
Headers: `x-access-token`
Path Variables: id = 2

**RESPONSE**
```
 If ok no Response

```

---
### Collaborators
#### http://localhost:4001/api/collaborators (GET)

Get All Collaborators Registered.

**REQUEST**
Headers: `Content-Type: application/json`

**RESPONSE**
```
{
    "data": [
        {
            "business": {
                "description": "Short description ...",
                "id": 1,
                "name": "Name Updated",
                "tag": "IT, Software",
                "year": 2000
            },
            "email": "some@gmail.com",
            "id": 1,
            "lastname": "Doe",
            "name": "Jhon"
        },
        {
            "business": {
                "description": "Short description ...",
                "id": 2,
                "name": "Company 2",
                "tag": "Marketing",
                "year": 2000
            },
            "email": "some@gmail.com",
            "id": 2,
            "lastname": "Dow",
            "name": "Jane"
        },
        {
            "business": {
                "description": "Short description ...",
                "id": 3,
                "name": "Company 3",
                "tag": "Accounting",
                "year": 2000
            },
            "email": "some@gmail.com",
            "id": 3,
            "lastname": "Other",
            "name": "Some"
        }
    ]
}
```

---
#### http://localhost:4001/api/collaborators/:id (GET)

Get one Collaborator Registered.

**REQUEST**
Headers: `Content-Type: application/json`
Path Variables: `id` = `1`

**RESPONSE**
```
{
    "data": {
        "business": {
            "description": "Short description ...",
            "id": 1,
            "name": "Name Updated",
            "tag": "IT, Software",
            "year": 2000
        },
        "email": "some@gmail.com",
        "id": 1,
        "lastname": "Doe",
        "name": "Jhon"
    }
}
```

---
#### http://localhost:4001/api/collaborators (POST)

Store a new Collaborator.

**REQUEST**
Headers: `Content-Type: application/json`
```
{
  "colaborator":
    {
      "name": "Some Other Collaborator Name",
      "lastname": "Some Other Collaborator LastName",
      "email": "some_email@some.com",
      "business_id": 2
    }
}
```
**RESPONSE**
```
{
    "email": "some_email@some.com",
    "id": 4,
    "lastname": "Some Other Collaborator LastName",
    "name": "Some Other Collaborator Name"
}
```

---
#### http://localhost:4001/api/collaborators/:id (PUT)

Update a Collaborator

**REQUEST**
Headers: `Content-Type: application/json`
Path Variables: `id` = `1`
```
{
  "colaborator":
    {
      "name": "Name Updated"
    }
}
```
**RESPONSE**
```
{
    "data": {
        "business": {
            "description": "Short description ...",
            "id": 1,
            "name": "Name Updated",
            "tag": "IT, Software",
            "year": 2000
        },
        "email": "some@gmail.com",
        "id": 1,
        "lastname": "Doe",
        "name": "Name Updated"
    }
}
```

---
#### http://localhost:4001/api/collaborators/:id (DELETE)

Delete one Business.

**REQUEST**
Headers: `x-access-token`
Path Variables: id = 2

**RESPONSE**
```
 If ok no Response
```

---

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
