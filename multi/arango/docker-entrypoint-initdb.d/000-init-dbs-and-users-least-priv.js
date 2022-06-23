// create a db appdb
db._createDatabase("appdb");

// setup appuser and appadmin
var users = require("@arangodb/users");
users.save("appadmin", "secretpassword");
users.save("appuser", "secretpassword");

// setup access for appadmin
// grant appadmin admin access to appdb
users.grantDatabase("appadmin", "appdb", "rw", true); // true = active user
// grant appadmin admin access to all collections in appdb
users.grantCollection("appadmin", "appdb", "*", "rw");

// setup access for appuser
// grant appuser read access to appdb
users.grantDatabase("appuser", "appdb", "ro", true);
// grant appadmin read access to all collections in appdb
users.grantCollection("appuser", "appdb", "*", "ro");
