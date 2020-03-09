// generates insert statements for populating database, look at the main() function towards the bottom for info on usage
package main

import (
	"fmt"
	"io/ioutil"
	"math/rand"
	"time"
)

// Generate insert statements for Users table
//		insert into users(first_name, last_name, email) values ('John', 'Doe', 'johndoe@gmail.com');
func users(count int) string {
	humanNames := []string{"Jack", "Lewis", "James", "Logan", "Daniel", "Ryan", "Aaron", "Oliver", "Liam", "Jamie", "Ethan", "Alexander", "Cameron", "Finlay", "Kyle", "Adam", "Harry", "Matthew", "Callum", "Lucas", "Nathan", "Aiden", "Dylan", "Charlie", "Connor", "Thomas", "Alfie", "Joshua", "William", "Jayden", "Andrew", "Kai", "Max", "Ben", "Samuel", "Luke", "Tyler", "Rory", "David", "Michael", "Riley", "Noah", "Cole", "Joseph", "John", "Archie", "Jacob", "Fraser", "Rhys", "Ross", "Calum", "Jay", "Josh", "Euan", "Mason", "Owen", "Sam", "Leo", "Robert", "Scott", "Leon", "Robbie", "Benjamin", "Caleb", "Oscar", "Harris", "Murray", "Sean", "Christopher", "Kieran", "Aidan", "Jake", "Evan", "Kayden", "Arran", "Angus", "Brodie", "Ewan", "Muhammad", "Alex", "Declan", "Finn", "Blair", "Ollie", "Reece", "Corey", "Kian", "Harrison", "Taylor", "Kaiden", "Kenzie", "Cody", "Craig", "Mohammed", "Calvin", "Mark", "Jude", "Luca"}
	emailProviders := []string{"gmail.com", "yahoo.com", "msn.com", "hotmail.com", "icloud.com", "outlook.com"}

	var output string
	output += fmt.Sprintf("\n-- USERS TABLE\n")
	for i := 0; i < count; i++ {
		firstName := humanNames[rand.Intn(len(humanNames))]
		lastName := humanNames[rand.Intn(len(humanNames))]
		email := emailProviders[rand.Intn(len(emailProviders))]
		output += fmt.Sprintf("insert into users(first_name, last_name, email) values ('%v', '%v', '%v%v%v@%v');\n", firstName, lastName, firstName, lastName, rand.Intn(99), email)
	}
	return output
}

// Generate insert statements for Movies table
//		insert into movie(title, director_id, distributor_id, country_id, genre_id, release_year) values ('The House on the Hill',2,2,4,4,2002);
func movies(count int) string {
	movieNames := map[string]int{"Dave Chappelle: Sticks & Stones": 2019, "Bee Movie": 2007, "The Irishman": 2019, "El Camino: A Breaking Bad Movie": 2019, "6 Underground": 2019, "End of Watch": 2012, "The Foreigner": 2017, "The Other Guys": 2010, "Pete Davidson: Alive From New York": 2020, "Marriage Story": 2019, "Freaks": 2018, "The Two Popes": 2019, "Spenser Confidential": 2020, "MR. RIGHT": 2015, "The Dark Knight": 2008, "The Secret Life of Pets 2": 2019, "American Assassin": 2017, "Spider-Man: Into the Spider-Verse": 2018, "ZZ TOP: THAT LITTLE OL' BAND FROM TEXAS": 2019, "Avengers: Infinity War": 2018, "Hancock": 2008, "Takers": 2010, "Step Brothers": 2008, "Murder Mystery": 2019}

	fmt.Println(len(movieNames))

	var output string
	var total int = 0
	output += fmt.Sprintf("\n-- MOVIE TABLE\n")
	for movieTitle, movieYear := range movieNames {
		output += fmt.Sprintf("insert into movie(title, director_id, distributor_id, country_id, genre_id, release_year) values ('%v',%v,%v,%v,%v,%v);\n", movieTitle, rand.Intn(10)+1, rand.Intn(10)+1, rand.Intn(10)+1, rand.Intn(10)+1, movieYear)
		total++
		if total >= count {
			break
		}
	}
	return output
}

func main() {
	rand.Seed(time.Now().UnixNano())

	var output string

	// the integer fed into each function is the number of insert statements to be generated
	// comment out any line below to disable generation of that table
	// output is saved to insert.sql
	output += users(1)
	output += movies(2)

	err := ioutil.WriteFile("insert.sql", []byte(output), 0644)
	if err != nil {
		panic(err)
	}
	fmt.Println(output)
}
