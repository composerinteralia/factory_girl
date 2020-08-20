module FactoryBot
  class Error
    def self.formatted_did_you_mean(dictionary, key)
      checker = DidYouMean::SpellChecker.new(dictionary: dictionary)
      suggestions = checker.correct(key).map(&:inspect)
      DidYouMean.formatter.message_for(suggestions)
    end

    def self.with_modified_message(error, message)
      error.class.new(message).tap do |new_error|
        new_error.set_backtrace(error.backtrace)
      end
    end
  end
  # Raised when a factory is defined that attempts to instantiate itself.
  class AssociationDefinitionError < RuntimeError; end

  # Raised when a trait is defined that references itself.
  class TraitDefinitionError < RuntimeError; end

  # Raised when a callback is defined that has an invalid name
  class InvalidCallbackNameError < RuntimeError; end

  # Raised when a factory is defined with the same name as a previously-defined factory.
  class DuplicateDefinitionError < RuntimeError; end

  # Raised when attempting to register a sequence from a dynamic attribute block
  class SequenceAbuseError < RuntimeError; end

  # Raised when defining an attribute twice in the same factory
  class AttributeDefinitionError < RuntimeError; end

  # Raised when attempting to pass a block to an association definition
  class AssociationDefinitionError < RuntimeError; end

  # Raised when a method is defined in a factory or trait with arguments
  class MethodDefinitionError < RuntimeError; end

  # Raised when any factory is considered invalid
  class InvalidFactoryError < RuntimeError; end
end
