class ToHash
    def to_hash(obj)
        obj.instance_variables.each_with_object({}) do |var, hash| 
            key = var.to_s.delete("@")
            value = obj.instance_variable_get(var) 
            if ['Genre','Author', 'Label', 'Book', 'Movie', 'MusicAlbum'].include?(value.class.name)
                value = to_hash(value)
            end
            hash[key] = value
            hash
        end
    end
end