# require modules here
require 'pry'
require 'yaml'

def load_library(file)
  # code goes here
  emoticons = YAML.load_file(file)
  emoticons_file = emoticons.each_with_object({}){ |(key, value), new_emoticons|
      new_emoticons[key] = {}
      new_emoticons[key][:english] = value[0]
      new_emoticons[key][:japanese]= value[1]
    }
  emoticons_file
  # binding.pry

end

def get_japanese_emoticon(file, english_emoticon)
  emoticons = load_library(file)
  message ="Sorry, that emoticon was not found"

  emoticons.map {|key, value|
    if english_emoticon == value[:english]
      # binding.pry
      return value[:japanese]
    end
   }
   return message


end

def get_english_meaning(file, japanese_emoticon)
  # code goes here
  emoticons = load_library(file)
  message = "Sorry, that emoticon was not found"

  emoticons.map{|key, value|
      if value[:japanese] == japanese_emoticon
        return key
      end
      }
    return message
end
