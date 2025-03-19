#import "@preview/polylux:0.4.0": *
#import "@preview/metropolis-polylux:0.1.0" as metropolis
#import metropolis: new-section, focus

#show: metropolis.setup.with(
  text-font: "DejaVu Sans Mono",
  math-font: "DejaVu Sans Mono",
  code-font: "DejaVu Sans Mono",
  text-size: 22pt,
  footer: [Silen Celeste Locatelli - 19.03.2025], 
)

#set page(paper: "presentation-16-9")
#set text(size: 25pt, font: "DejaVu Sans Mono")



#slide[
    #show: focus
    #text(size: 0.8em)[
    Hurl, API testing in plain text
  ]

]

#slide[
  = About me

    - Married
    - I code, I read and I play Handball
    - Living in Baselland

]


#slide[
  = About me

  - Optravis LLC
  - Rust Basel
  - Fullstack, lately with Rust + HTMX

]

#new-section[Files]


#slide[
  = felix_json.hurl
```json
GET {{target}}/api/cats
HTTP 200
[Asserts]
jsonpath "$.cats[0].name" == "Felix"
```
]

#slide[
  = felix_html.hurl
```json
GET {{target}}
HTTP 200
Content-Type: text/html; charset=UTF-8

[Asserts]
xpath "string(/html/head/title)" contains "Felix""
```
]

#slide[
  = garfield_color.hurl
```json
GET {{target}}
HTTP 200
[Captures]
cat-id: xpath "normalize-space(//div[@id='cat0'])"

GET {{target}}/api/cats/{{cat-id}}
HTTP 200
[Asserts]
jsonpath "$.color" == "orange"

```
]

#new-section[Commands]

#slide[
= Command
```bash
hurl felix.hurl --variable target=localhost:9090 --test
```
]

#slide[
= Command - expl.
```bash
hurl someDir/**/*.hurl --variable target=localhost:9090 --test
```
]

#slide[
= Command - templating - var file


```bash
hurl someDir/**/*.hurl --variables-file my_vars --test
```

---

#text(size: 0.7em)[
  my_vars file
]

```env
target=localhost:9090
foo=bar
```

] 

#slide[
= Command - templating - env var


```bash
export HURL_somevar=somevalue
hurl someDir/**/*.hurl --variables-file my_vars --test
```

]

#slide[
= Command - report 


```bash
hurl felix.hurl my_vars --test --html-report .
```

]


#new-section[Ideas for a setup]

#slide[
= Setup - wait for healthy - ht/health.hurl
```json
GET {{target}}/api/healthz
HTTP 200
[Asserts]
```
---
```bash
hurl ht/health.hurl --retry 60 --delay 1000 /
    --variables-file ht/hurl.env /
    --test /
    --jobs 1
```

]

#slide[
= Setup - asserting tests - ht/foo.hurl
```json
GET {{target}}/api/foo
Authorization: {{token}}
HTTP 200
[Asserts]
jsonpath "$.important_property" contains "test_string"
```
---
```bash
hurl ht/*.hurl --variables-file ht/hurl.env /
   --test /
   --jobs 1
```

]

#slide[
= Setup - env file - ht/hurl.env

```env
token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJz...........
target=localhost:9090

```
]


#new-section[Small Showcase]

#slide[
= Showcase

```bash
htmx-workshop-meetup-10
```

]