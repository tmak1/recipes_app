function ingredientFormBuilder(i) {
  const str =  `<tr> 
  <td><label for="">${i}</label></td> 
  <td><input class="input-ingred" type="text" name="ingredient${i}"></td>
  <td><input class="input-amount" type="text" name="amount${i}"></td>
  <td><select name="measure${i}">
          <option value="">none</option>
          <option value="tablespoons">tablespoons</option>
          <option value="teaspoons">teaspoons</option>
          <option value="g">g</option>
          <option value="to taste">to taste</option>
          <option value="cans">cans</option>
          <option value="cups">cups</option>
          <option value="mL">mL</option>
          <option value="pieces">pieces</option>
      </select></td>
    <td><input class="input-others" type="text" name="others${i}"></td>
    <td><button class="remove-ingred">Delete</button></td>
  </tr>`
  return str
}

function deleteIngredient(self) {
  if($('#ingredient-rows tr').length > 1) {
    $(self).closest('tr').remove();
    $('#ingredient-rows').children().each(function(index) {
      $(this).children().find("label").text(index + 1)

      $(this).children().find($('.input-ingred'))
        .attr( "name", "ingredient" + (index + 1))

      $(this).children().find($('.input-amount'))
        .attr( "name", "amount" + (index + 1))

      $(this).children().find($("select"))
        .attr( "name", "measure" + (index + 1))
        
      $(this).children().find($('.input-others'))
        .attr( "name", "others" + (index + 1))
    })
  }
}

function deleteStep(self) {
  if($('#steps-rows div').length > 1) {
    $(self).closest('div').remove();
    $('#steps-rows').children().each(function(index) {
      $(this).find("label").text("Step" + (index + 1))
      $(this).find("input").attr( "name", "step" + (index + 1))
    })
  }
}

function addMoreIngredients() {
    var i = $('#ingredient-rows tr').length;
    i++;
    if (i <= 30) { 
      $('#ingredient-rows').append(ingredientFormBuilder(i));
    }
    $('.remove-ingred').click(function(evt){
      evt.preventDefault();
      deleteIngredient(this)
    })
}

function addMoreSteps() {
    var i = $('#steps-rows div').length;
    i++;
    if (i <= 11) {
    const str = 
            `<div> 
              <label for="">Step ${i}</label>
                <span>
                    <input type="text" name="step${i}">
                    <button class="remove-step">Delete</button>
                </span>
             </div>` 
      $('#steps-rows').append(str);
    }
    $('.remove-step').click(function(evt){
      evt.preventDefault(); 
      deleteStep(this)
    })
}

function likeIncrement(self) {
  var recipeID = $(self).children("div").text()
  $(self).addClass('heartbeat')
  $.ajax({url: "/recipe/like", 
    type: "post",
    data: { recipe_id: recipeID }, 
    success: function(result){
      $('.likes-count-card-large').children("span").text(JSON.parse(result))
      $(self).closest('.recipe-card')
        .find('.likes-count-card-small')
        .children("span")
        .text(JSON.parse(result))
      setTimeout(function(){ 
        $(self).removeClass('heartbeat') 
      }, 800);
    }
  });
}

function saveRecipe(self) {
  var ids = $(self).children("div").text().split(",")
  var userID = ids[0]
  var recipeID = ids[1]
  $(self).addClass('heartbeat')
  $.ajax({url: "/user/recipesave", 
    type: "post",
    data: { user_id: userID, recipe_id: recipeID }, 
    success: function(result){
      if (result.includes(recipeID)){
        $(self).replaceWith('<i class="fas fa-heart"></i>');
      }
      else {
        $(self).replaceWith('<i class="far fa-heart"></i>');
      }
      setTimeout(function(){ 
        $(self).removeClass('heartbeat') 
      }, 800);
    }
  });
}

function commentBuilder(post) {
  var str = `<div class="comments-container">
    <div class="comments-user-info">
      ${post['user_name']}
    </div>
    <div class="comments-meta-info">
        <div class="comments-date-info">
          ${post['post_created_at'].split(' ')[0]}
        </div>
        <div class="comments-likes">
            <a href="" class="remove-all-styles like-btn"><div style="display: none;">${post['post_id']}</div><i class="fas fa-thumbs-up"></i></a>
            ${post['post_vote']}
        </div>
    </div>
    <div class="comments-text">
        <textarea id="" cols="25" rows="5" disabled>${post['post_text']}</textarea>
    </div>
  </div>`
  return str
}

function postComment(self) {
  var ids = $(self).children("span").text().split(',')
  var userID = ids[0]
  var recipeID = ids[1]
  var postText = $('#post-comment-txt').val()
  $.ajax({url: "/comment", 
    type: "post",
    data: { user_id: userID, recipe_id: recipeID, post_text: postText }, 
    success: function(result){
      var comment = commentBuilder(JSON.parse(result))
      $('#comment-main').append(comment)
    }
  });
}

$(document).ready(function(){
  $(window).scroll(function() {
    if ($(this).scrollTop()) {
        $('#to-top').fadeIn();
    } else {
        $('#to-top').fadeOut();
    }
  });
  $("#to-top").click(function () {
    $("html, body").animate({scrollTop: 0}, 500);
  });

  $('#add-more-ingred').click(function(evt){
    evt.preventDefault();
    addMoreIngredients();
  })
  $('#add-more-steps').click(function(evt){
    evt.preventDefault();
    addMoreSteps();
  })
  $('.remove-ingred').click(function(evt){
    evt.preventDefault();
    deleteIngredient(this);
  })
  $('.remove-step').click(function(evt){
    evt.preventDefault(); 
    deleteStep(this);
  })
  $('.like-btn').click(function(evt) {
    evt.preventDefault();
    likeIncrement(this);
  })
  $('.save-btn').click(function(evt) {
    evt.preventDefault();
    saveRecipe(this);
  })
  $('#add-comment').click(function(evt) {
    evt.preventDefault();
    var text = $(this).text() == '+' ? '-' : '+'
    $(this).text(text)
    $('#comment-txt').fadeToggle()
  })
  $('#post-comment').click(function(evt) {
    evt.preventDefault();
    postComment(this)
  })
});
