Polymer 'bmc-ui',

  domReady: ->
    boxes = @$.base.querySelectorAll('.box')
    for box in boxes
      box.appendChild @createTextArea()

  createTextArea: ->
    textArea = document.createElement 'textarea'
    textArea.classList.add 'textarea'
    return textArea
