# React --

# Udemy course
# =============

# usually what we will do that ,
# in webpage it contains header,footer,sidebar,body elements so on,
# so i want to modify the header ,in webpage it will take because of a lines of code will be there right.

# so I react very we slipt the things into components.
# why ,to keep code managable ,maintaiable and re-useable
# if you want modify the header, Then will do changes in header block only

# Outlines:-

# 1.Basic
# 2.Debugging
# 3.Styling components
# 4.Deep components
# 5.HTML Request(AJAX)
# 6.Routing
# 7.Forms and validations
# 8.Redux
# 9.Authentications

Linked in 

what is React
	- Javascript
	-Es6 syntax
	-npm
	-javascript labirary
	-created by FB
	-open resource 2013
	-React native(mobile app)

			npx create-react_app app_name
					npx-package -> loader
					create-react_app -> tool to build our project

					npm start ->run u r application
					

					React 
						elements	
						components

-component is building block.
-componet is a function that returns UI/UI elements					

- Create a component by creating function(function returns UI elements)

<p1> elements
	properties will be there
<h1>

-properties to component
	Ex:-

 #componet is nothing but function
# 		function Header(props) //props is an object,it holds all properties of componets.
# {
#   console.log(props);//props is an obbject,it holds all properties of componets.
#   return (
#     <header>
#       <h1>{props.name}</h1>
#     </header>
#   );
# }

		# 	function App() {
  # return (
  #   <div className="App">
  #     <center>
  #       <Header name ="Pondati"/> //properties to component
  #      </center>
  #    </Header>
  #   </div>
  #   );
  #  }     	

# How to display the data in to component
# EX:-
# 	const dishes = ["roti","chapati","poori","Egg","banana"];
# dishes.map((dish) => console.log(dish));
# const worktyp = [
#   "Full-time",
#   "casual",
#   "part-time",
#   "contract"
# ];

# function Main(props){
# return(
# <section>
# <p>This the main body</p>
# <ul style = {{textAlign:"left"}}>
# {worktyp.map((work) => <li>{work}</li>)}**
# </ul>
# </section>

# );
# }
# <Main work={worktyp}/>


# Two app in single page

# import App from "./App";


# function Apptwo()
# {
#   return (
#     <h1>This is second</h1>
#   );

# }
# ReactDOM.render(
#   // // React.createElement("li",{style:{color:"red"}}, "Hello Raghavendra"),
#   // // React.createElement("li",
#   // // null, 
#   // // React.createElement("li",null,"monday"),
#   // // React.createElement("li",null,"tuesday"),
#   // // React.createElement("li",null,"wednesday"),
#   // // React.createElement("li",null,"thursday"),
#   // // React.createElement("li",null,"friday"),
#   // // ),
#   // <ul><li>monday</li>,
#   // <li>monday</li>,
#   // </ul>,
#   <div>
#     <App/>
#   <Apptwo/>
#   </div>,
  
  
#   document.getElementById('root')
# );


