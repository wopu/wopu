module Search
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    def search(params)
      chain = self
      { select: :s, joins: :j, where: :w, skip: :k, limit: :l }.each do |k, v|
        if params[v]
          chain = chain.send(k, params[v])
        end
      end
      chain

    end

    def page(page_number = 0)
      c=criteria
      c.options[:page] = page_number
      c.options[:skip] = page_number * (c.options[:limit] || 20)
      c
    end

    def per(number = 0)
      c = criteria
      c.options[:skip] = number * (c.options[:page] || 0)
      c.limit number
      c
    end
  end
end
