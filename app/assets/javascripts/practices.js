$( document ).ready(function() {
  // SHOW PAGE
    // initial page set up
    const hideElements = () => {
      let next = $('#next-button')
      let previous = $('#previous-button')
      if (previous.attr("data-practiceId") === "1") {previous.hide()}
      if (next.attr("data-last-practice") === next.attr("data-practiceId")) {next.hide()}
      $('#tip-form').hide()
    }
    hideElements()
  
  
   // content updaters
    const updateButtonLinks = (practiceId) => {
      $('#next-button').show().attr("data-practiceId", practiceId)
      $('#previous-button').show().attr("data-practiceId", practiceId)
      $('#add').attr("href", `/practices/${practiceId}/plans/new`)
      $('#delete').attr("href", `/practices/${practiceId}`)
      $('#update').attr("href", `/practices/${practiceId}/edit`)
      $('.submit-tip').attr("data-practice_id", practiceId)
    }
  
    const updatePracticeContent = (practice) =>{
      $('#practice-name').text('more of ... ' + practice.name + ',')
      $('#practice-category').text('because i want to better ' + practice.category + '.')
      $('#description').text(practice.description)
  
  }
  
  const sortTips = (practice) => {
    return practice.tips.sort((b,a) => (a.likes > b.likes) ? 1 : ((b.likes > a.likes) ? -1 : 0));
  }
  
  const updateTips = (practice) => {
    $('.tip-div').html("")
    let sorted = sortTips(practice)
    sorted.forEach(tip => {
      let new_tip = HandlebarsTemplates['tips-template']({tip: tip})
      $('.tip-div').append(new_tip)
    })
  }
  
    const updatePage = (practiceId) =>{
      let current_user_id = parseInt($('#user').attr("data-user_id"))
      $.get(`/practices/${practiceId}.json`, (practice) =>{
        hideElements()
        updatePracticeContent(practice)
        updateButtonLinks(practiceId)
        $('.show-form').show()
        updateTips(practice)
      })
    }
  
    // event handlers
    $('.wrapper').on('click', '#next-button', (e) => {
      e.preventDefault()
      let nextId = parseInt($("#next-button").attr("data-practiceId")) + 1
      updatePage(nextId)
    })
  
    $('.wrapper').on('click', '#previous-button', (e) => {
      e.preventDefault()
      let previousId = parseInt($("#previous-button").attr("data-practiceId")) - 1
      updatePage(previousId)
    })
  
    // show tip form
    $('.show-form').on('click', (e) =>{
      e.preventDefault()
      $('.show-form').hide()
      $('#tip-form').slideDown('slow')
    })
  })
  