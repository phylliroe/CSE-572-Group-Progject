// generates insert statements for populating database, look at the main() function towards the bottom for info on usage
package main

import (
	"fmt"
	"io/ioutil"
	"math/rand"
	"time"
)

var humanNames []string
var userCount, movieCount, directorCount, distributorCount, genreCount, countryCount int

func Shuffle(vals []string) {
	for len(vals) > 0 {
		n := len(vals)
		randIndex := rand.Intn(n)
		vals[n-1], vals[randIndex] = vals[randIndex], vals[n-1]
		vals = vals[:n-1]
	}
}

//	insert into service_user(first_name, last_name, email) values ('John', 'Doe', 'johndoe@gmail.com');
func users(count int) string {
	emailProviders := []string{"gmail.com", "yahoo.com", "msn.com", "hotmail.com", "icloud.com", "outlook.com"}

	var output string
	output += fmt.Sprintf("\n-- SERVICE USER TABLE\n")
	for i := 0; i < count; i++ {
		firstName := humanNames[rand.Intn(len(humanNames))]
		lastName := humanNames[rand.Intn(len(humanNames))]
		email := emailProviders[rand.Intn(len(emailProviders))]
		output += fmt.Sprintf("insert into service_user(first_name, last_name, email) values ('%v', '%v', '%v%v%v@%v');\n", firstName, lastName, firstName, lastName, rand.Intn(99), email)
	}
	return output
}

//	insert into director(director_fname, director_lname) values ('John', 'Doe');
func directors(count int) string {
	var output string
	output += fmt.Sprintf("\n-- DIRECTOR TABLE\n")
	for i := 0; i < count; i++ {
		firstName := humanNames[rand.Intn(len(humanNames))]
		lastName := humanNames[rand.Intn(len(humanNames))]
		output += fmt.Sprintf("insert into director(director_fname, director_lname) values ('%v', '%v');\n", firstName, lastName)
	}
	return output
}

//	insert into distributor(dist_name) values ('Movie Studio Inc.');
func distributors(count int) string {
	distributorNames := []string{"Tempest Coms", "Parable Networks", "Melon Electronics", "Surprisystems", "Vertexoftwards", "Spiritechnologies", "Squidustries", "Robinstone", "Microtales", "Pinnaclesun", "Marsh Networks", "Bear Paw Industries", "Sprite", "Moonnetworks", "Protonetworks", "Monarctronics", "Elviations", "Alpineshow", "Cannontronics", "Wonderstone", "Wolf Sports", "Wolf Motors", "Cave", "Whiteoutwares", "Smartechnologies", "Spicurity", "Rosecurity", "Dragonbar", "Acephone", "Accentworth", "Bull Microsystems", "Hurricane Motors", "Buck Corporation", "Nymphoods", "Cavologies", "Bumblebeelectrics", "Moondustries", "Marbledale", "Typhoonwares", "Lionessworth", "Cyclone Networks", "Butterfly Industries", "Cloud Productions", "Orco", "Tucanterprises", "Dragonetworks", "Bluetronics", "Phoenixwares", "Icestar", "Leopardlight", "Hook Sports", "Herb Limited", "Sapling Corporation", "Triumphoods", "Twisterecords", "Rosecurity", "Lionetworks", "Houndwalk", "Alpineking", "Worldforce"}
	Shuffle(distributorNames)

	var output string
	output += fmt.Sprintf("\n-- DISTRIBUTOR TABLE\n")
	for i := 0; i < count; i++ {
		name := distributorNames[i]
		output += fmt.Sprintf("insert into distributor(dist_name) values ('%v');\n", name)
	}
	return output
}

//	insert into genre(genre_name) values ('Action');
func genres(count int) string {
	genres := []string{"Action", "Anime", "Children", "Comedy", "Documentary", "Drama", "Horror", "Romance", "Sci-fi", "Fantasy"}

	var output string
	output += fmt.Sprintf("\n-- GENRE TABLE\n")
	for i := 0; i < count && i < len(genres); i++ {
		genre := genres[i]
		output += fmt.Sprintf("insert into genre(genre_name) values ('%v');\n", genre)
	}
	return output
}

//	insert into country(country) values ('United States');
func countries(count int) string {
	countries := []string{"United States", "India", "Japan", "China", "United Kingdom", "france", "Nigeria", "Egypt", "Korea", "Hong Kong"}

	var output string
	output += fmt.Sprintf("\n-- COUNTRY TABLE\n")
	for i := 0; i < count && i < len(countries); i++ {
		country := countries[i]
		output += fmt.Sprintf("insert into country(country) values ('%v');\n", country)
	}
	return output
}

//	insert into movie(title, director_id, distributor_id, country_id, genre_id, release_year) values ('The House on the Hill',2,2,4,4,2002);
func movies(count int) string {
	movieNames := map[string]int{"Dave Chappelle: Sticks and Stones": 2019, "Bee Movie": 2007, "The Irishman": 2019, "El Camino: A Breaking Bad Movie": 2019, "6 Underground": 2019, "End of Watch": 2012, "The Foreigner": 2017, "The Other Guys": 2010, "Pete Davidson: Alive From New York": 2020, "Marriage Story": 2019, "Freaks": 2018, "The Two Popes": 2019, "Spenser Confidential": 2020, "MR. RIGHT": 2015, "The Dark Knight": 2008, "The Secret Life of Pets 2": 2019, "American Assassin": 2017, "Spider-Man: Into the Spider-Verse": 2018, "ZZ TOP: THAT LITTLE OL BAND FROM TEXAS": 2019, "Avengers: Infinity War": 2018, "Hancock": 2008, "Takers": 2010, "Step Brothers": 2008, "Murder Mystery": 2019, "Tall Girl": 2019}

	var output string
	var total int = 0
	output += fmt.Sprintf("\n-- MOVIE TABLE\n")
	for movieTitle, movieYear := range movieNames {
		output += fmt.Sprintf("insert into movie(title, director_id, dist_id, country_id, genre_id, release_year) values ('%v',%v,%v,%v,%v,%v);\n", movieTitle, rand.Intn(directorCount)+1, rand.Intn(distributorCount)+1, rand.Intn(countryCount)+1, rand.Intn(genreCount)+1, movieYear)
		total++
		if total >= count {
			return output
		}
	}
	return output
}

//	insert into watched_list(user_id, movie_id, rating) values (1234,4332,'good');
func watchedList(count int) string {
	var output string
	output += fmt.Sprintf("\n-- WATCHED_LIST TABLE\n")
	for i := 0; i < count; i++ {
		rating := "good"
		if rand.Intn(2) == 1 {
			rating = "bad"
		}
		output += fmt.Sprintf("insert into watched_list(user_id, movie_id, rating) values (%v,%v,'%v');\n", rand.Intn(userCount)+1, rand.Intn(movieCount)+1, rating)
	}
	return output
}

//	insert into watch_list(user_id, movie_id) values ('11','23');
func watchList(count int) string {
	var output string
	output += fmt.Sprintf("\n-- WATCH_LIST TABLE\n")
	for i := 0; i < count; i++ {
		output += fmt.Sprintf("insert into watch_list(user_id, movie_id) values (%v,%v);\n", rand.Intn(userCount)+1, rand.Intn(movieCount)+1)
	}
	return output
}

//	insert into friends_list(user_id, friend_id) values (2,23);
func friendsList(count int) string {
	var output string
	output += fmt.Sprintf("\n-- FRIENDS_LIST TABLE\n")
	for i := 0; i < count; i++ {
		output += fmt.Sprintf("insert into friends_list(user_id, friend_id) values (%v,%v);\n", rand.Intn(userCount)+1, rand.Intn(userCount)+1)
	}
	return output
}

//	insert into recommendations(user_id, movie_id) values(23,11);
func recommendations(count int) string {
	var output string
	output += fmt.Sprintf("\n-- RECOMMENDATIONS TABLE\n")
	for i := 0; i < count; i++ {
		output += fmt.Sprintf("insert into recommendations(user_id, movie_id) values(%v,%v);\n", rand.Intn(userCount)+1, rand.Intn(movieCount)+1)
	}
	return output
}

func main() {
	humanNames = []string{"Jack", "Lewis", "James", "Logan", "Daniel", "Ryan", "Aaron", "Oliver", "Liam", "Jamie", "Ethan", "Alexander", "Cameron", "Finlay", "Kyle", "Adam", "Harry", "Matthew", "Callum", "Lucas", "Nathan", "Aiden", "Dylan", "Charlie", "Connor", "Thomas", "Alfie", "Joshua", "William", "Jayden", "Andrew", "Kai", "Max", "Ben", "Samuel", "Luke", "Tyler", "Rory", "David", "Michael", "Riley", "Noah", "Cole", "Joseph", "John", "Archie", "Jacob", "Fraser", "Rhys", "Ross", "Calum", "Jay", "Josh", "Euan", "Mason", "Owen", "Sam", "Leo", "Robert", "Scott", "Leon", "Robbie", "Benjamin", "Caleb", "Oscar", "Harris", "Murray", "Sean", "Christopher", "Kieran", "Aidan", "Jake", "Evan", "Kayden", "Arran", "Angus", "Brodie", "Ewan", "Muhammad", "Alex", "Declan", "Finn", "Blair", "Ollie", "Reece", "Corey", "Kian", "Harrison", "Taylor", "Kaiden", "Kenzie", "Cody", "Craig", "Mohammed", "Calvin", "Mark", "Jude", "Luca"}
	rand.Seed(time.Now().UnixNano())

	var output string

	// the integer fed into each function is the number of insert statements to be generated
	// comment out any line below to disable generation of that table
	// output is saved to insert.sql
	// run with golang command `go run ./`
	userCount = 30
	movieCount = 20
	directorCount = 15
	distributorCount = 15
	genreCount = 10
	countryCount = 10

	output += users(userCount)
	output += directors(directorCount)
	output += distributors(distributorCount)
	output += genres(genreCount)
	output += countries(countryCount)
	output += movies(movieCount)
	output += watchedList(20)
	output += watchList(20)
	output += friendsList(15)
	output += recommendations(20)

	err := ioutil.WriteFile("insert.sql", []byte(output), 0644)
	if err != nil {
		panic(err)
	}
	fmt.Println(output)
	fmt.Println("saved locally to file: insert.sql")
}
