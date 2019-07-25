$( document ).ready(function() {
  // tip class
  class Tip{
    constructor(data){
      this.id = data.id
      this.content = data.content
      this.likes = 0
    }

    toString(){
      return HandlebarsTemplates['tips-template']({tip: this})
    }
  }

// like/unlike functions
  const updateLikes = (button, number, id) =>{
      let likes = parseInt(button.likes) + number
      let tipId = button.id
      let practiceId = button.practice
      let data = {tip:{
          id: tipId,
          likes: (likes >= 0 ? likes : 0)
        }
      }

      let update = $.ajax({
              url: `/tips/${tipId}`,
              type: 'PATCH',
              dataType: "json",
              data: data
            });
      update.done(function(){
        $(`#like-button-${tipId}`).attr('data-likes', likes)
        $(`#unlike-button-${tipId}`).attr('data-likes', likes)
        $(`#tip-${tipId}-likes`).text(likes >= 0 ? likes : 0)
      })
  }

  $('.tip-div').on('click', '.like-button', (e)=>{
    e.preventDefault()
    let $button = e.target.dataset
    updateLikes($button, 1)
  })

  $('.tip-div').on('click', '.unlike-button', (e)=>{
    e.preventDefault()
    let $button = e.target.dataset
    updateLikes($button, -1)
  })


  // submiting a tip

  $('.submit-tip').on('click', (e) => {
    e.preventDefault()
    let $button = $('.submit-tip');
    let data = {tip: {
          'action' : '/tips',
          'user_id': $button.data("user_id"),
          'practice_id': $button.data("practice_id"),
          'content' : $( '.tip-textarea' ).val()
      }
    };

    let posting = $.post('/tips', data);

    posting.done(function(data) {
      let new_tip = new Tip(data)
      $('.tip-div').append(new_tip.toString())
      $('.tip-textarea').val('').attr('placeholder', "leave message here")
      $('#tip-form').hide()
      $('.show-form').show()
      console.log(new_tip.toString())
    });
  })

})
