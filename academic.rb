class Topic
  attr_reader   :noLectures, :name 
  
  def initialize(noLectures, name)
     @noLectures = noLectures
     @name = name
  end  
  
end

class Subject    # aka Module
  def initialize(name, noLectures, credits)
     @noLecturesPerWeek = noLectures
     @name = name
     @credits = credits
     @topics = []
  end 

  def findTopic name
      @topics.find {|topic| topic.name == name }
  end

  # A topic is added only if its noLectures does not cause the 
  # subject's total no. lectures to be exceeded. Total no. of lectures is 
  #  WKS_PER_SEMESTER * @noLecturesPerWeek.
  def addTopic topic
  	if (computeTopicTotal + topic.noLectures <= 
                     WKS_PER_SEMESTER * @noLecturesPerWeek )
       @topics << topic 
       true
    else
  	   false
    end
  end

  def removeTopic name
    result = false
    topic = findTopic name
    if topic 
       @topics.delete topic
       result = true
    end
    return result
  end

  private
  
  # Compute total no. of lectures from all topics 
  def computeTopicTotal 
  	@topics.inject(0) {|sum, topic| sum += topic.noLectures}
  end
end
