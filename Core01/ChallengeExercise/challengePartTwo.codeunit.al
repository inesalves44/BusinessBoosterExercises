codeunit 50132 challengePartTwo
{
    var
        dictionary: Dictionary of [text, text];

    /// <summary>
    /// challengePart1.
    /// </summary>
    /// <param name="var1">text[1].</param>
    /// <param name="var2">text[1].</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure challengePart1(var1: text[1]; var2: text[1]): Boolean
    var
        valueOne: text;
        counter: integer;

    begin
        if not dictionary.ContainsKey('A') then begin
            dictionary.add('A', 'C');
            dictionary.add('B', 'C');
            dictionary.add('C', 'E');
            dictionary.add('D', 'E');
            dictionary.add('E', 'A, B');
            dictionary.add('F', 'B');
        end;

        valueOne := dictionary.Get(var1);
        if (valueOne = '') then
            exit(false);

        if StrLen(valueOne) > 1 then begin
            counter := 1;
            while counter <= StrLen(valueOne) do begin
                if (valueOne[counter] = var2) then
                    exit(valueOne[counter] = var2);
                counter += 1;
            end;
            exit(false);
        end;

        EXIT(valueOne = var2);
    end;


    /// <summary>
    /// FindWhoLikesPart2.
    /// </summary>
    /// <param name="var1">text.</param>
    /// <returns>Return value of type Text.</returns>
    procedure FindWhoLikesPart2(var1: text): Text
    var
        text, result, keyValue : Text;
        check: Boolean;
        counter: Integer;

    begin
        if not dictionary.ContainsKey('A') then begin
            dictionary.add('A', 'C');
            dictionary.add('B', 'C');
            dictionary.add('C', 'E');
            dictionary.add('D', 'E');
            dictionary.add('E', 'A, B');
            dictionary.add('F', 'B');
        end;

        counter := 1;

        foreach keyvalue in dictionary.Keys() do begin

            text := dictionary.Get(keyValue);

            if (text.Contains(var1)) and (var1 <> ',') then
                result := result + keyValue + '; ';
        end;

        if result = '' then begin
            message('No one likes %1', var1);
            exit('error');
        end;

        exit(result);
    end;

    /// <summary>
    /// findnumberTwo.
    /// </summary>
    /// <param name="var1">text.</param>
    /// <returns>Return value of type Text.</returns>
    procedure findnumberTwo(var1: text): Text
    var
        counter: integer;
        test: text;

    begin
        if not dictionary.ContainsKey('A') then begin
            dictionary.add('A', 'C');
            dictionary.add('B', 'C');
            dictionary.add('C', 'E');
            dictionary.add('D', 'E');
            dictionary.add('E', 'A, B');
            dictionary.add('F', 'B');
        end;

        test := dictionary.Get(var1);

        if (test = '') then begin
            message('Invalid Value');
            exit('error');
        end;

        exit(test);

    end;
}