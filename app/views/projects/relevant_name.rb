def total_relevance op_name, relevant_words
  relevant_words.reduce(0) do |total, (word, value)|
    if op_name.includes? word
      total + value
    else
      total
    end
  end
end

relevant_words = { 'triangle' => 3, 'man' => 1 }
total_people = 4

p total_relevance('triangleman83', relevant_words) == total_people