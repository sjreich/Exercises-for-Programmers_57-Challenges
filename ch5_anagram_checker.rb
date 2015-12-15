require 'rspec'

def anagrams?(word1, word2)
  sorted(word1) == sorted(word2)
end

def sorted(word)
  word.chars.sort
end

describe 'anagrams?' do
  it 'returns true only for actual anagrams' do
    expect(anagrams?('tone', 'note')).to be_truthy
    expect(anagrams?('onte', 'ante')).to be_falsey
  end
end

# the hard way

def hard_anagrams?(word1, word2)
  if lengthi(word1) == lengthi(word2)
  else
    false 
  end
end

def lengthi(word)
  index = 0
  while word[index] do
    index += 1
  end
  index
end

describe 'hard anagrams?' do
  it 'returns true only for actual anagrams' do
    expect(hard_anagrams?('tone', 'note')).to be_truthy
    expect(hard_anagrams?('onte', 'ante')).to be_falsey
  end
end

describe 'lengthi' do
  it 'returns the length of the word' do
    expect(lengthi("hotdog")).to eq(6)
    expect(lengthi("hot dog")).to eq(7)
  end
end