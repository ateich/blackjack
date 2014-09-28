assert = chai.assert

describe "rules", ->
  deck = null
  hand = null
  dealer = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()
    dealer = deck.dealDealer()

  it "dealer should win when score is higher than player and not busted", ->
    # collection = new Deck()
    # assert.strictEqual collection.length, 52
    #setting player hand to lose against any dealer hand
    playerScore = -100
    dealerWon = false
    test = ->
      # console.log 'test'
      dealerWon = true

    dealer.on('win',test)
    dealer.stand([0])
    assert.strictEqual dealerWon, true

  it "player should win when score is higher than dealer and not busted", ->
    playerWon = false
    test = ->
      # console.log 'player won'
      playerWon = true

    hand.on('win', test)
    dealer.on('lose', test)
    if dealer.scores()[0] == 21 || dealer.scores()[1] == 21
      dealer = deck.dealDealer()
    dealer.stand([21])
    assert.strictEqual playerWon, true

  it "dealer should win if player and dealer have same scores", ->
    dealerWon = false
    test = ->
      dealerWon = true

    dealer.on('win', test)
    playerScores = [dealer.scores()[0], dealer.scores()[1]]
    dealer.stand(playerScores)
    assert.strictEqual dealerWon, true

  it "player should lose when bust", ->
    dealerWon = false
    test = ->
      dealerWon = true

    hand.on('lose', test)
    hand.scores = ->
      return [22]
    hand.bustOr21()
    assert.strictEqual dealerWon, true

  it "dealer should lose when bust", ->
    dealerWon = true
    test = ->
      dealerWon = false

    dealer.on('lose', test)
    dealer.scores = ->
      return [22]
    dealer.compare([0])
    assert.strictEqual dealerWon, false

