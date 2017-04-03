class DSLHash
  class DSLHashContext
    # Геттер для inner_hash
    attr_reader :inner_hash
    
    def initialize
      # Объявляем пустой хеш
      @inner_hash = {}
    end

    def method_missing name, *args, &block
      # Проверяем, нет ли уже такого ключа. Не обязательно, но почему бы и нет
      if @inner_hash.key? name
        raise "Key '#{name}' is already defined"
      end

      # Проверяем, если нам дали блок - значит запускаем его в новом DSLHashContext
      if block_given?
        context = DSLHashContext.new

        context.instance_eval &block
        
        # Записываем результат вложенного хеша в переменную
        result = context.inner_hash
      else
        # Если нет ни блока ни аргументов - выдаем ошибку
        if args.size == 0
          raise "No block or args given"
        # Если один аргумент - пишем строку
        elsif args.size == 1
          result = args[0]
        # Если аргументов > 1, пишем весь массив
        else
          result = args
        end
      end

      # Записываем в хеш результат result по ключу name
      @inner_hash[name] = result
    end
  end

  def self.build &block
    if block_given?
      # Создаем инстанс контекста
      context = DSLHashContext.new
      # Запускаем в нем наш хеш
      context.instance_eval &block
      # Возвращаем внутренний хеш
      return context.inner_hash
    else
      raise "No block given"
    end
  end
end