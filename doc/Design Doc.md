# **CourseShopper Design Document**

## Models

1. Course (`has_many :course_status`)  
>**Database Columns:**  
>ID | Title | Number | Institute | Credits | Description | Staff | Programmes | Participant Count |

2. CourseStatus (`belongs_to :courses`)
>**Database Columns:**  
>ID | Course ID | Shopping (bool) | Taking (bool) | Recently Viewed (bool) | User ID |

## Views
1. **browse:**  
![browse](https://raw.github.com/jonmellman/project2/master/doc/mockups/Home%20Page.jpg?login=jonmellman&token=04d5af8937f2b203811d080e7e6e9335)  
2. **show\_results:**  
![show\_results](https://raw.github.com/jonmellman/project2/master/doc/mockups/Results%20Page.jpg?login=jonmellman&token=7898454bff4cd7d2dfa149428491b361)  
3. **show\_saved:**  
![show\_saved](https://raw.github.com/jonmellman/project2/master/doc/mockups/My%20Courses%20Page.jpg?login=jonmellman&token=5bff326da22d1f7efde1f01f7aa2af15)  
4. **Key:**  
![Key](https://raw.github.com/jonmellman/project2/master/doc/mockups/Key.jpg?login=jonmellman&token=0c2d064d82d48c8b62d5d1147678e989)

## Controllers
1. **CoursesController**

	Hitting 'Submit' in the `browse` view passes the search terms to `CoursesController`, which will query the Course database and passed the returned `Courses` to the `results` view to be displayed. 

	**Methods**:  
	>`lookupCourses(institute)`  
	>`lookupCourses(institute, searchTerms)`

2. **CourseShoppingController**  

	Navigating to 'My Courses' will look up the user's ID then query the `CourseStatus` database to retrieve the courses the user is shopping.

	**Methods:**
	>`lookupShoppingCourses`    
	>`index`  
	>`add`  
	>`remove`  

3. **CourseTakingController**  

	On the 'My Courses' page, tabbing to 'Courses I'm Taking' will look up the user's ID then query the `CourseStatus` database to retrieve the courses the user is taking.

	**Methods:**
	>`lookupTakingCourses`  
	`index`  
	>`add`  
	>`remove`  

	4. **CourseRecentController**  

	On the 'My Courses' page, tabbing to 'Recently Viewed' will look up the user's ID then query the `CourseStatus` database to retrieve the courses the user has recently viewed.

	**Methods:**
	>`lookupRecentCourses`  
	>`index`  
	>`add`  
	>`remove`  