module HomeOfPhone
  class Base

    DEFAULT_RHYME_BOOST = 1.2

    DEFAULT_SIMILARITY_OPTIONS = {
      use_rhyme_boost: true,
      use_phoneme_accents: true
    }

    def initialize(preload_phonemes: true)
      @phonemes_loaded = false
      load_phonemes if preload_phonemes
    end

    def to_s
      "#<HomeOfPhone::Base phomes_loaded=#{@phonemes_loaded}>"
    end

    def inspect
      to_s
    end

    def load_phonemes
      phonemes
      !phonemes.nil?
    end

    def similarity(word1, word2, options=DEFAULT_SIMILARITY_OPTIONS)
      phonemes1 = get_word_phonemes(word1)
      phonemes2 = get_word_phonemes(word2)
      unless options[:use_phoneme_accents]
        phonemes1 = HomeOfPhone::Tools.remove_phoneme_accents(phonemes1)
        phonemes2 = HomeOfPhone::Tools.remove_phoneme_accents(phonemes2)
      end

      lev_dist = HomeOfPhone::Tools.levenshtein_distance(phonemes1, phonemes2)
      max_dist = [phonemes1.length, phonemes2.length].max
      raw_score = (max_dist.to_f - lev_dist.to_f) / max_dist.to_f
      rhyme_boost = options[:use_rhyme_boost] && HomeOfPhone::Tools.rhyme_ish(phonemes1, phonemes2) ? DEFAULT_RHYME_BOOST : 1.0

      final_score = [(raw_score * rhyme_boost), 1.0].min
      final_int_score = (final_score * 100).to_int
      final_int_score
    end

    private

    def phonemes
      @phonemes ||= begin
        require_relative "phonemes"
        cmu_dict = HomeOfPhone::Phonemes.cmu_dict
        @phonemes_loaded = true
        cmu_dict
      end
    end

    def get_word_phonemes(word)
      word_key = word.upcase
      raise HomeOfPhone::NoPhonemesError, "Can't find phonemes for #{word}" unless phonemes.key?(word_key)
      phonemes[word_key]
    end
  end
end
