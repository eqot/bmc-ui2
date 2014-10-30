Polymer 'bmc-ui',

  domReady: ->
    boxes = @$.base.querySelectorAll('.box')
    for box in boxes
      box.appendChild @createList()
      box.appendChild @createTextArea()

  createList: ->
    list = document.createElement 'ul'
    list.classList.add 'list'

    return list

  createListItem: (text) ->
    listItem = document.createElement 'li'
    listItem.classList.add 'list-item'
    listItem.innerText = text

    return listItem

  createTextArea: ->
    textArea = document.createElement 'textarea'
    textArea.classList.add 'textarea'
    textArea.addEventListener 'keydown', @onKeyDown.bind(@)

    return textArea

  onKeyDown: (event) ->
    if event.keyCode is 13    # Return key
      event.preventDefault()
      @addText event

  addText: (event) ->
    element = event.target
    list = element.previousSibling

    text = element.value
    list.appendChild @createListItem text

    # Clear text area
    element.value = ''
