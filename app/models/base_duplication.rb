class BaseDuplication
	extend ActiveModel::Naming
	extend ActiveModel::Callbacks
	include ActiveModel::Validations

	define_model_callbacks :duplication

	def self.attributes(*names)
		attr_accessor(*names)
	end

	def to_model
		self
	end

	def to_param
		nil
	end

	def persisted?
		false
	end

	def to_key
		nil
	end

	def to_partial_path
		""
	end
end
