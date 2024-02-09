page 50130 ChallengePartOne
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(DicOne)
            {
                Caption = 'Dicionary One';
                field(dictionaryOne; 'A like B like C like D like E like F like F')
                {
                    ApplicationArea = All;
                    Caption = 'This is the dictionary one: ';
                }

            }
            group(DicTwo)
            {
                Caption = 'Dicionary Two';
                field(dictionaryTwo; 'A and B like C | C and D like E | E like A and B | F like B')
                {
                    ApplicationArea = All;
                    Caption = 'This is the dictionary two: ';
                }


            }
            group(Input)
            {
                Caption = 'Exercises Part 1';
                field(input1; InputOne)
                {
                    ApplicationArea = All;
                    Caption = 'letter number one';
                }
                field(input2; inputTwo)
                {
                    Caption = 'letter number two';
                    ApplicationArea = All;
                }
            }
            group(SecondInput)
            {
                Caption = 'Exercises Part 2';
                field(INPUT3; inputthree)
                {
                    Caption = 'letter number three';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CompareOne)
            {
                ApplicationArea = All;
                Caption = 'Compare Dictionary One';
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    test: Boolean;
                begin
                    test := challenge.isLikePartOne(inputOne, inputTwo);
                    if test then begin
                        Message('is like');
                    end
                    else begin
                        Message('is not');
                    end;
                end;
            }
            action(getIsLike)
            {
                ApplicationArea = All;
                Caption = 'Get is Like Dictionary One';
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    text: Text;
                begin
                    text := challenge.FindIsLike(inputthree);
                    if text = 'wrong' then
                        exit;
                    Message('%1 is liked by %2', inputThree, text);
                end;
            }
            action(ComparePart2)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'Compare Dictionary Two';

                trigger OnAction()
                var
                    test: Boolean;
                begin
                    if challengeTwo.challengePart1(inputOne, inputTwo) then begin
                        Message('is Like');
                        exit;
                    end;
                    Message('is not like');
                end;
            }
            action(FindPart2)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Caption = 'get is Like Dictionary Two';

                trigger OnAction()
                var
                    text: Text;
                begin
                    text := challengeTwo.FindWhoLikesPart2(inputthree);
                    if text = 'error' then
                        exit;
                    Message('%1 is liked %2', inputThree, text);
                end;
            }
            action(IsLikeTotal)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    choice: integer;
                    result: Boolean;
                begin
                    if dictionary.ContainsKey('A') then begin
                        challengeTotal.cleanDictionary(dictionary);
                    end;
                    choice := Dialog.StrMenu('Dictionary One,Dictionary Two', 2, 'choose a dictionary');

                    dictionary := challengeTotal.CreateADictionary(choice);

                    result := challengeTotal.isLike(inputOne, inputTwo, dictionary);

                    if result then begin
                        Message('Is Like!');
                    end
                    else
                        Message('Is not Like');
                end;
            }
            action(GetIsLikeTotal)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    test: integer;
                    result: Text;
                begin
                    if dictionary.ContainsKey('A') then begin
                        challengeTotal.cleanDictionary(dictionary);
                    end;

                    test := Dialog.StrMenu('Dictionary One,Dictionary Two', 2, 'choose a dictionary');
                    dictionary := challengeTotal.CreateADictionary(test);

                    result := challengeTotal.FindWhoLikes(inputThree, dictionary);

                    IF result = 'error' then
                        exit;
                    Message('%1 is liked by %2', inputThree, result);
                end;
            }
            action(isLikesString)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    choice: integer;
                    result: Boolean;
                begin

                    Clear(string);
                    choice := Dialog.StrMenu('Dictionary One,Dictionary Two', 1, 'choose a dictionary');


                    challengestring.CreateString(choice, string);


                    result := challengestring.islikeString(inputOne, inputTwo, string);

                    if result then begin
                        Message('Is Like!');
                    end
                    else
                        Message('Is not Like');
                end;
            }
            action(GetIsLikeSgtring)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    test: integer;
                    result: Text;
                begin
                    clear(string);

                    test := Dialog.StrMenu('Dictionary One,Dictionary Two', 2, 'choose a dictionary');
                    challengestring.CreateString(test, STRING);

                    result := challengestring.GetWhoLikes(inputThree, string);

                    IF result = 'error' then
                        exit;
                    Message('%1 is liked by %2', inputThree, result);
                end;
            }
        }
    }

    var
        inputOne, inputThree, inputTwo : Text[1];
        challenge: Codeunit challengePartOne;
        challengeTwo: Codeunit challengePartTwo;
        challengeTotal: Codeunit FinalChallenge;
        challengestring: Codeunit StringResolution;
        dictionary: Dictionary of [text, text];
        string: text;
}