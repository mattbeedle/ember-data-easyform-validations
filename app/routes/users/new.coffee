`import Ember from 'ember'`

UsersNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('user')

  # This is called when the user is saved successfully
  didSave: (user) ->
    console.log user
    @transitionTo 'users'

  # This is an error from the server. Either your client side validations are
  # not comprehensive enough, or something else whent wrong on the server.
  # Either way, you need to deal with it here.
  didNotSave: (error) ->
    console.log error

  renderTemplate: ->
    @render 'users/new',
      into: 'users'
      outlet: 'form'

  actions:
    cancel: ->
      @get('controller.content').rollback()
      @transitionTo 'users'

    submit: ->
      @get('controller.content').save()
        .then(@didSave.bind(@), @didNotSave.bind(@))

    willTransition: ->
      @controller.get('content').rollback() if @controller.get('content.isDirty')

`export default UsersNewRoute`