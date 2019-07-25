$( document ).ready(function() {


// update helpers
  const updatePage = (object, other, custom) => {
    let id = $(`.my-${object}s`).attr("data-id")
    $.get(`/users/${id}`, (user) =>{
      $('#user-show-header').text(`my ${object}s`)

      // buttons
      let createWeek = createButton(id, object)
      $('#user-buttons').html(displayOtherButton(id, other) + createWeek)

      // content
      let contentHtml = HandlebarsTemplates[`my-${object}s-template`]({object: user[`${custom || object}s`]})
      $('#user-content').html(contentHtml)
    }, 'json')
  }

  const createButton = (id, object) => {
    return `<a class= "button create_button" href="/users/${id}/${object}s/new">Create a new ${object}.</a>`
  }

  const displayOtherButton = (id, other) =>{
    return `<a class= "button my-${other}" href="#" data-id="${id}">my ${other}</a>`
  }

  // event handlers
    $('#user-buttons').on('click', '.my-practices',  (e) =>{
      e.preventDefault()
      updatePage('practice', 'weeks', 'custom_practice')
    })

    $('#user-buttons').on('click', '.my-weeks', (e) =>{
      e.preventDefault()
      updatePage('week', 'practices')
    })


})
