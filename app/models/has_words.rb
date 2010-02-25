module HasWords
  
  def words_join_table_name
    self.class.reflections[:words].through_reflection.table_name
  end
  
  def word_counts
    raise "The record must be saved!" if self.new_record?
    connection.execute("
      SELECT count(#{words_join_table_name}.id)
      FROM words 
      LEFT JOIN #{words_join_table_name} ON #{words_join_table_name}.word_id = words.id and #{words_join_table_name}.#{self.class.table_name.singularize}_id = #{self.id}
      GROUP BY words.id
      ORDER BY words.id;").inject([]) {|m, x| m +  [x.first.to_i]}
  end
end
  
  