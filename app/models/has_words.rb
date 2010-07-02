module HasWords
  
  def words_join_table_name
    self.class.reflections[:words].through_reflection.table_name
  end
  
  def word_counts
    raise "The record must be saved!" if self.new_record?
    result = connection.execute("
      SELECT count(#{words_join_table_name}.id)
      FROM words 
      LEFT JOIN #{words_join_table_name} ON #{words_join_table_name}.word_id = words.id and #{words_join_table_name}.#{self.class.table_name.singularize}_id = #{self.id}
      GROUP BY words.id
      ORDER BY words.id;").map {|h| h.values.first.to_i }
      # [{0=>"1", "count(word_uses.id)"=>"1"}, {0=>"2", "count(word_uses.id)"=>"2"}, {0=>"3", "count(word_uses.id)"=>"3"}]  
      
      
      
      #.inject([]) {|m, x| m +  [x.first.to_i]}
  end
end
  
  

