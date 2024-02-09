/// <summary>
/// Codeunit challengePartOne (ID 55116).
/// </summary>
codeunit 50131 challengePartOne
{
    var
        array: array[10] of Text;


    /// <summary>
    /// isLikePartOne.
    /// </summary>
    /// <param name="textOne">Text[1].</param>
    /// <param name="textTwo">Text[1].</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure isLikePartOne(textOne: Text[1]; textTwo: Text[1]): Boolean
    var
        valueOne: integer;
        valueTwo: Integer;
        counter: Integer;
    begin
        array[1] := 'A';
        array[2] := 'B';
        array[3] := 'C';
        array[4] := 'D';
        array[5] := 'E';
        array[6] := 'F';
        counter := 1;
        valueOne := 0;
        valuetwo := 0;

        while counter <= 6 do begin
            if textone.Contains(array[counter]) then begin
                valueOne := COUNTER;
            end;
            if textTwo.Contains(array[counter]) then begin
                valueTwo := counter;
            end;
            counter += 1;
        end;

        if (valueOne = 0) or (valueTwo = 0) then begin
            Message('Invalid Input');
            exit(false);
        end;

        exit((valueOne + 1 = valueTwo) or ((valueOne = valueTwo) and (valueone = 6)));
    end;

    /// <summary>
    /// FindIslIKE.
    /// </summary>
    /// <param name="text">Text[1].</param>
    /// <returns>Return value of type text[1].</returns>
    procedure FindIsLike(text: Text[1]): text
    var
        counter, value : integer;
        test: Text;
    begin
        array[1] := 'A';
        array[2] := 'B';
        array[3] := 'C';
        array[4] := 'D';
        array[5] := 'E';
        array[6] := 'F';

        counter := 1;
        value := 0;

        while (counter <= 6) do begin
            if (text.Contains(array[counter])) then begin
                value := counter;
            end;
            counter += 1;
        end;

        if (value = 0) then begin
            Message('Value not valid');
            exit('wrong');
        end;

        if value = 6 then begin
            test := format(array[6]) + '; ' + format(array[5]);
            exit(test);
        end;

        if value = 1 then begin
            Message('No one');
            exit('no one');
        end;

        exit(array[value - 1])
    end;
}