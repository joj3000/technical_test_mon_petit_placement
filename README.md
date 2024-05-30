# Technical test for Mon Petit Placement


Creation of a mini app : 

- OAuth2, OpenId and biometric authentication.
- User CRUD.
- Simple rouring with go_router.
- Simple exception handling.



### How to make it work locally

`$ git clone https://github.com/yoannpicquenot/technical-test-api.git`

`$ cd <path_to_folder>/technical-test-api`

`$ npm install -ci`

`$ npm start`

Inside the app folder, replace the following lines:

    // replace this
	String urlAuth = "technical-test-api.onrender.com";
	// with this
	String urlAuth = "10.0.2.2:8080"; 
	/// or with whatever the local express server gives you