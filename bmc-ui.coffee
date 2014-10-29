Polymer 'bmc-ui',

  domReady: ->
    boxes = @$.base.querySelectorAll('.box')
    for box in boxes
      textarea = document.createElement 'textarea'
      textarea.classList.add 'textarea'
      box.appendChild textarea
