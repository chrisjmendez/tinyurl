# TinyURL



### TODO Tests

Generic Link creation
- A user submits a blank form
  - Error, "Please submit a URL."

- A user submits an invalid URL. 
  - Error, "Please submit a valid URL"  

- A user submits a new :original with no :identifier
  - Success, "Here is your shortened #{:identifier}"

- A user submits an existing :original with no :identifier
  - Error, "Sorry, this URL already exists"
  - Success, "This URL was previously submitted, here is the #{:identifier}"

---

Custom Link creation
- A user submits a new :identifier with a new :original
  - Success, "Here is your custom #{:identifier}"

- A user submits an existing :identifier with a new :original
  - Error, "Sorry, this #{:identififer} is already taken, please enter a new #{:identifier}"

- A user submits a new :identifier with an existing :original
  - Success, "Here is your new #{:identifier}"
  