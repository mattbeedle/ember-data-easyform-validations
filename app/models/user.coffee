`import DS from 'ember-data'`
`import Ember from 'ember'`

User = DS.Model.extend Ember.Validations.Mixin,
  firstName: DS.attr('string')
  lastName: DS.attr('string')
  email: DS.attr('string')
  age: DS.attr('number')
  readTerms: DS.attr('boolean', defaultValue: false)

  validations:
    firstName:
      presence: true
    lastName:
      presence: true
    email:
      presence: true
      format:
        with: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/
        allowBlank: true
        message: 'must be an email address'
    age:
      presence: true
      numericality:
        allowBlank: true
        onlyInteger: true
        greaterThan: 5
        lessThan: 80
    readTerms:
      acceptance: true

  name: (->
    "#{@get('firstName')} #{@get('lastName')}"
  ).property('firstName', 'lastName').cacheable()

`export default User`