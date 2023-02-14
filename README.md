# Air quality pando2

This application allows you to visualize and analyze the measurements of different parameters taken by sensors located in different areas. The visualization is done through graphs for each parameter measured. Thus, the analysis of the measurements by comparison of the zones is simplified.  

## Technical informations

- Ruby 3.1.2
- Ruby on Rails 7.0.4 
- Postgresql 14.7

## Difficulties

At the beginning, I chose a database schema with a table rooms and measures because I thought that sending data to stimulus would be simplified in terms of graphic formatting. However, I could not simplify my code which led me to rethink the data structure received by the stimulus controller. Therefore I decided to create a single table "measures" with the attributes room:string, catgegory:string, value:float, measured_at:datetime. This allowed me to structure the data by sending to the front-end an object of each parameter that takes as value the measures for each room.

```json
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
