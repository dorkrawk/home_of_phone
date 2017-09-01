class HomeOfPhone::Tools

  def self.levenshtein_distance(s, t)
    m = s.length
    n = t.length
    return m if n == 0
    return n if m == 0
    d = Array.new(m+1) {Array.new(n+1)}

    (0..m).each {|i| d[i][0] = i}
    (0..n).each {|j| d[0][j] = j}
    (1..n).each do |j|
      (1..m).each do |i|
        d[i][j] = if s[i-1] == t[j-1]  # adjust index into string
                    d[i-1][j-1]       # no operation required
                  else
                    [ d[i-1][j]+1,    # deletion
                      d[i][j-1]+1,    # insertion
                      d[i-1][j-1]+1,  # substitution
                    ].min
                  end
      end
    end
    d[m][n]
  end

  def self.rhyme_ish(phonemes1, phonemes2)
    longest = [phonemes1, phonemes2].max_by(&:length)
    ending = (longest.length / 4.0).ceil
    phonemes1[-ending..-1] == phonemes2[-ending..-1]
  end

  def self.remove_phoneme_accents(phonemes)
    phonemes.map { |p| p.gsub(/[^a-zA-Z ]/,'') }
  end
end
