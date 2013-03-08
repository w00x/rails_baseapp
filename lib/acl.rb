module Acl
  
  ACL_CONFIG = YAML.load_file("#{Rails.root}/config/acl.yml")
  
  def is_allow(rol,controller,action = nil)
    if ACL_CONFIG[rol]
      if ACL_CONFIG[rol]["allow"]["__all"]
        return true
      else
        if ACL_CONFIG[rol]["allow"][controller]
          if action != nil
            if ACL_CONFIG[rol]["allow"][controller].include?("__all")
              return true
            elsif ACL_CONFIG[rol]["allow"][controller].include?(action)
              return true
            end
          else
            return true
          end
        end
      end
    end
    
    return false
  end
end