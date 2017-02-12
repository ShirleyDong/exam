require 'minitest/autorun'
require_relative 'academic'

class TestSubject < MiniTest::Test
  def setup
    @subject = Subject.new 'Module 1',2,5
    @topic1 = Topic.new(6,"topic 1") ;
    @topic2 = Topic.new(7,"topic 2") ;

    @topic5 = Topic.new(6,"topic 5") ;
    @topic3 = Topic.new(5,"topic 3") ;;

  end

  def teardown
      @subject = @topic1 = @topic2 = @topic3 = nil
  end
  
  def test_find_topic
      addSomeTopics
      # Normal
      result = @subject.findTopic 'topic 2'
      assert_equal @topic2, result
      result = @subject.findTopic 'topic 4'
      assert_nil result
   end

   def test_remove_topic
     addSomeTopics
     # Normal
     result = @subject.removeTopic 'topic 1'
     assert result
     assert_nil @subject.findTopic 'topic 1'
     result = @subject.removeTopic 'topic X'
     assert_equal false, result
   end

  def test_add_topic
        # Normal
        result = @subject.addTopic @topic1
        assert result
        assert_equal @topic1, @subject.findTopic('topic 1')
        # Extra setup
        @subject.addTopic @topic2
        @subject.addTopic @topic3        
        # Error
        topic4 = Topic.new 20, 'topic 4'
        result = @subject.addTopic topic4
        assert_equal false, result
        assert_nil @subject.findTopic 'topic 4'
        # Boundry
        topic4 = Topic.new 6, 'topic 4'
        result = @subject.addTopic topic4
        assert result
        assert_equal topic4, @subject.findTopic('topic 4')
     end

   def addSomeTopics
      @subject.addTopic @topic1
      @subject.addTopic @topic2
      @subject.addTopic @topic3
  end
end

