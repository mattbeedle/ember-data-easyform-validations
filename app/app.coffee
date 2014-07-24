`import Ember from 'ember'`
`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`

Ember.MODEL_FACTORY_INJECTIONS = true

App = Ember.Application.extend
  modulePrefix: 'ember-data-easyform-validations' # TODO: loaded via config
  Resolver: Resolver

loadInitializers(App, 'ember-data-easyform-validations')

# This is a little ember easyform hack to make errors display when the form is
# submitted
Ember.EasyForm.Input.reopen
  errorsChanged: (->
    @set('hasFocusedOut', true)
    @showValidationError()
  )

  didInsertElement: ->
    @addObserver("context.errors.#{@property}.@each", @, 'errorsChanged')

# This is a further little ember easyform hack to map the error message text to
# the message on the DS.Error object supplied by ember-data
# https://github.com/emberjs/data/pull/958
Ember.EasyForm.Error.reopen
  errorText: (->
    @get('errors.firstObject.message') or @get('errors.firstObject')
  ).property('errors.firstObject.message', 'errors.firstObject').cacheable()

`export default App`
