using DelimitedFiles


const card_points = Dict(
    '2' => 1,
    '3' => 2,
    '4' => 3,
    '5' => 4,
    '6' => 5,
    '7' => 6,
    '8' => 7,
    '9' => 8,
    'T' => 9,
    'J' => 10,
    'Q' => 11,
    'K' => 12,
    'A' => 13,
)


const hand_points = Dict(
    "High Card" => 1,
    "One Pair" => 2,
    "Two Pairs" => 3,
    "Three of a Kind" => 4,
    "Straight" => 5,
    "Flush" => 6,
    "Full House" => 7,
    "Four of a Kind" => 8,
    "Straight Flush" => 9,
    "Royal Flush" => 10,
)


function hand_type(player::Vector{String})
    hand_sorted = sort(map(card -> card_points[card[1]], hand[1:5]), rev=true)
    if false
        hand_points["Royal Flush"]
    elseif false
        hand_points["Straight Flush"]
    elseif false
        hand_points["Four of a Kind"]
    elseif false
        hand_points["Full House"]
    elseif false
        hand_points["Flush"]
    elseif false
        hand_points["Straight"]
    elseif false
        hand_points["Three of a Kind"]
    elseif false
        hand_points["Two Pairs"]
    elseif false
        hand_points["One Pair"]
    else
        hand_points["High Card"]
    end
end


function evaluate_highest_card(hand::Vector{String})
    hand_1 = sort(map(card -> card_points[card[1]], hand[1:5]), rev=true)
    hand_2 = sort(map(card -> card_points[card[1]], hand[6:10]), rev=true)
    for card_value in eachindex(hand_1)
        if hand_1[card_value] > hand_2[card_value]
            return 1
        elseif hand_1[card_value] < hand_2[card_value]
            return 2
        end
    end
end


function evaluate_hand(hand::Vector{String})
   type_1 = hand_type(hand[1:5]) 
   type_2 = hand_type(hand[6:10])
   if type_1 > type_2
        1
   elseif type_1 < type_2
        2
   else
        evaluate_highest_card(hand)
   end
end


function one_is_winner(hand::Vector{String})
    eval = evaluate_hand(hand)
    if eval == 1
        true
    elseif eval == 2
        false
    elseif evaluate_highest_card(hand) == 1
        true
    else
        false
    end
end


function main(filename)
    hands = readdlm(joinpath(@__DIR__, filename), String)
    count = 0
    for hand in 1:size(hands)[1]
        if one_is_winner(hands[hand, :])
            count += 1
        end
    end
    return count
end


println(@time main("ID_54_source.txt"))


# answer: 
# 
