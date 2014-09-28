assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'shuffle', ->
    it "should shuffle the deck after it is empty", ->
      assert.strictEqual deck.length, 50
      i=0
      while i<51
        hand.hit()
        i++
      # assert.strictEqual deck.last(), hand.hit()
      # assert.strictEqual deck.length, 49
      # hand.playable && (assert.strictEqual deck.last(), hand.hit())
      # hand.playable && (assert.strictEqual deck.length, 48)
      assert.strictEqual deck.length, 51

  describe 'hit', ->
    it "deck should reduce card count by 1", ->
      assert.strictEqual deck.length, 50
      hand.hit()
      assert.strictEqual deck.length, 49
