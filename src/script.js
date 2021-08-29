document.addEventListener('DOMContentLoaded', () => {
  const eachPlayer = document.getElementsByClassName('eachPlayer')[0]
  const buttons = document.getElementById('button_container')
  const contentContainer = document.getElementById('content-container')
  const backGroundPic = document.getElementsByClassName('back')[0] 
  backGroundPic.style.background = 'url(photo/f4.jpg) no-repeat center center fixed' 
  const players = 'http://localhost:3000/api/v1/players';
// --------------------------Players Button ----------------------------------------
        buttons.addEventListener('click', function(event){
              if (event.target.className === 'allPlayers'){
                backGroundPic.style.background = "url('photo/f13.jpg') no-repeat center center fixed"
                contentContainer.innerHTML = ''
                allPlayers()
                function allPlayers(){ 
                    fetch(players)
                    .then(res => res.json())
                    .then(allPlayers => getPlayers(allPlayers))
                    }
                   function getPlayers(allPlayers){
                        allPlayers.data.forEach(player => {
                          
                          const playerObj = new Player(player, player.attributes)
                          playerObj.addPlayer()
                          })
                  }  
    }else if (event.target.className === 'allClubs'){
      backGroundPic.style.background = "url('photo/f4 (1).jpg') no-repeat center center fixed" 
         contentContainer.innerHTML = ''
          allClubs()
             function allClubs(){
                 fetch('http://localhost:3000/api/v1/clubs')
                 .then(res => res.json())
                .then(clubs => getClubs(clubs))
              }
              function getClubs(clubs){
                  clubs.data.map(club => {
                    clubObj = new Club(club, club.attributes)
                    clubObj.getAllClub()
                 })
             }
    }else if (event.target.className === 'allMatches'){
      backGroundPic.style.background  = "url('photo/f4 (2).jpg') no-repeat center center fixed"
              contentContainer.innerHTML = ''
                allMatches()
                  function allMatches(){
                    fetch('http://localhost:3000/api/v1/matches')
                    .then(res => res.json())
                    .then(matches => getMatches(matches))
                   }
                   function getMatches(matches){
                     matches.data.map(match => {
                      
                       matchObj = new Match(match, match.attributes)
                       matchObj.getAllMatch()
                })

            }
   } else if (event.target.className === 'add-new-player-button'){
    backGroundPic.style.background  = "url('photo/f7.png') no-repeat center center fixed" 
               contentContainer.innerHTML = ''
              let createPlayerForm = document.createElement('form')
              createPlayerForm.id = 'create-player-form'
              createPlayerForm.innerHTML = `
              <label>name:</label>
              <input type="text" name="name" />
              <br/>
              <label>Player Number:</label>
              <input type="number" name="number" />
              <br/>
              <label>Type:</label>
              <input type="text" name="type" />
              <br/>
              <label> Country:</label>
              <input type="text" name="country" />
              <br/>
              <label> Age:</label>
              <input type="text" name="age" />
              <br/>
              <label> Club Id:</label>
              <input type="number" name="club" />
              <br/>
              <label> Match Id:</label>
              <input type="number" name="match" />
              <br/>
              <input id=submit type="submit" />
              `
              fetch('http://localhost:3000/api/v1/matches')
              .then(res => res.json())
              .then(matches => getMatches(matches))
              function getMatches(matches){
                const select = document.createElement('select')
                select.name  = 'matches'
                select.id = 'matches'
                contentContainer.append(select)
                matches.data.map(match => { 
                  const matchObj = new Match(match, match.attributes)
                  matchObj.addMatch()
                       }) 
              }
                  fetch('http://localhost:3000/api/v1/clubs')
                    .then(res => res.json())
                    .then(clubs => getClubs(clubs))
                  function getClubs(clubs){
                    const select1 = document.createElement('select')
                    select1.id = 'clubs'
                   contentContainer.append(select1)
                      clubs.data.map(club => {
                     
                       const clubObj = new Club(club, club.attributes)
                       clubObj.getClub()
                     })
                   }
               contentContainer.innerHTML = ''
               contentContainer.append(createPlayerForm)
          }
         
  })
  document.addEventListener('submit', function(event){
    event.preventDefault()
    if (event.target.id === 'create-player-form'){
         let name = event.target.name.value 
         let number = event.target.number.value
         let type = event.target.type.value
         let country = event.target.country.value
         let age = event.target.age.value
          let club_id = event.target.club.value 
          let match_id = event.target.match.value 
          let newPlayer = {name,  number,  kind: type,  country,  age, club_id, match_id }   
           fetch('http://localhost:3000/api/v1/players', {
               method: "POST", 
               headers: {
                 'Content-Type': 'application/json',
                 'Accept': 'application/json'
               },
               body: JSON.stringify(newPlayer)
           })
           .then(res => res.json())
           .then(player => {
             console.log(player)
             const playerObj = new Player(player.data, player.data.attributes)
             playerObj.addPlayer()   
           })
        }
           })     
         document.addEventListener('click', function(event){
          if(event.target.className === 'eachPlayer'){
            backGroundPic.style.background  = "url('photo/f12.png') no-repeat center center fixed" 
           
            contentContainer.innerHTML = ''
            const id = event.target.dataset.id 
            fetch(`http://localhost:3000/api/v1/players/${id}`)
            .then(res => res.json() )
            .then(player =>  {
              eachPlayer.innerHTML = `
              <h5>Player Name: ${player.name} </h5>
              <h5>Player Number:${player.number}</h5>
              <h5> Player Type:${player.kind}</h5>
              <h5>Player Country:  ${player.country}<h5>
              <h5>Player Age:   ${player.age} <h5>
               `
                contentContainer.append(eachPlayer)
            //  const div = document.createElement('div')
                   })
                }
         })  
       let sort = document.getElementById('sort')
       sort.addEventListener('click', function(event){
           contentContainer.innerHTML = ''
            fetch(players)
            .then(response => response.json())
            .then(allPlayers => sortPlayers(allPlayers))
       })

       function sortPlayers(allPlayers){
        allPlayers.data.sort(function(a, b) {
          let nameA = a.attributes.name.toUpperCase(); // ignore upper and lowercase
          let nameB = b.attributes.name.toUpperCase(); // ignore upper and lowercase
          if (nameA < nameB) {
            return -1;
          }
          if (nameA > nameB) {
            return 1;
          }
        
          // names must be equal
          return 0;
        });


        allPlayers.data.forEach(function(player){
          const li = document.createElement('li')

          li.innerHTML = player.attributes.name

          contentContainer.append(li)
        })

       }


       
       

  })

  // items.sort(function(a, b) {
  //   var nameA = a.name.toUpperCase(); // ignore upper and lowercase
  //   var nameB = b.name.toUpperCase(); // ignore upper and lowercase
  //   if (nameA < nameB) {
  //     return -1;
  //   }
  //   if (nameA > nameB) {
  //     return 1;
  //   }
  
  //   // names must be equal
  //   return 0;
  // });
        
         
      
  




