Polymer 'bmc-listitem',

  domReady: ->
    @.addEventListener 'dblclick', @edit.bind(@)
    @.addEventListener 'blur', @cancel.bind(@)

    @$.remove.addEventListener 'click', @remove.bind(@)

    @$.textarea.addEventListener 'keydown', @onKeyDown.bind(@)

  edit: ->
    @setState 'edit'

  setState: (state) ->
    if state isnt 'edit'
      @$.static.classList.remove 'hidden'
      @$.edit.classList.add 'hidden'
    else
      @$.static.classList.add 'hidden'
      @$.edit.classList.remove 'hidden'

      @$.textarea.focus()

  onKeyDown: (event) ->
    if event.keyCode is 13    # Return key
      event.preventDefault()
      @update event

    else if event.keyCode is 27   # Esc key
      event.preventDefault()
      @cancel()

  update: (event) ->
    label = event.target.value
    if label.length > 0
      @value label

    @setState 'normal'

  cancel: ->
    @setValue @getValue()

    @setState 'normal'

  value: (data) ->
    if data?
      @setValue data
    else
      @getValue()

  setValue: (data) ->
    @$.label.innerText = data
    @$.textarea.value = data

  getValue: ->
    return @$.label.innerText
