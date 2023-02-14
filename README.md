# Air quality pando2

This application allows you to visualize and analyze the measurements of different parameters taken by sensors located in different areas. The visualization is done through graphs for each parameter measured. Thus, the analysis of the measurements by comparison of the zones is simplified.  

## Technical informations

- Ruby 3.1.2
- Ruby on Rails 7.0.4 
- Stimulus v3.2.0
- Postgresql 14.7

## Difficulties

At the beginning, I chose a database schema with a table rooms and measures because I thought that sending data to stimulus would be simplified in terms of graphic formatting. However, I could not simplify my code which led me to rethink the data structure received by the stimulus controller. Therefore I decided to create a single table "measures" with the attributes room:string, catgegory:string, value:float, measured_at:datetime. This allowed me to structure the data by sending to the front-end an object of each parameter that takes as value the measures for each room.

```javascript
{
    "TMP" => {
       "Room 8A" => [],
       "Room B2" => [],
       "Room 8F" => []
   },
   "VOCT" => {
       "Room 8A" => [],
       "Room B2" => [],
       "Room 8F" => []
   },
    "HUM" => {
       "Room 8A" => [],
       "Room B2" => [],
       "Room 8F" => []
   },
    "CO2" => {
       "Room 8A" => [],
       "Room B2" => [],
       "Room 8F" => []
   }

}
```

## Getting started and pre-requisites

### Versions

```sh
Ruby 3.1.2
Rails 7.0.4.1
Docker Compose version v2.15.1
```
### Clonage

```sh
git clone git@github.com:Francois973/automatic-moderator.git
```

## Running app

### Setup

This action will launch all the commands to install everything the application needs to work.

```sh
docker-compose up
```

### Create database

```sh
docker-compose exec app bin/rails db:create
```

### Migrate schema

```sh
docker-compose exec app bin/rails db:migrate
```

### Fill database

```sh
docker-compose exec app bin/rails db:seed
```

### Start 🚀

```sh
docker-compose up
```
------> Start [https://localhost:3000](https://localhost:3000) 💎
