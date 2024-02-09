codeunit 50134 FinalChallenge
{
    /// <summary>
    /// isLike.
    /// </summary>
    /// <param name="var1">Text.</param>
    /// <param name="var2">Text.</param>
    /// <param name="dictionary">Dictionary of [text, text].</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure isLike(var1: Text; var2: Text; dictionary: Dictionary of [text, text]): Boolean
    var
        valueOne: text;
        counter: integer;
    begin

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
    /// GetIsLike.
    /// </summary>
    /// <param name="var1">Text.</param>
    /// <param name="dictionary">Dictionary of [text, text].</param>
    /// <returns>Return value of type Text.</returns>
    procedure GetIsLike(var1: Text; dictionary: Dictionary of [text, text]): Text
    var
        test: text;
    begin

        test := dictionary.Get(var1);

        if (test = '') then begin
            message('Invalid Value');
            exit('error');
        end;

        exit(test);
    end;


    /// <summary>
    /// FindWhoLikes.
    /// </summary>
    /// <param name="var1">text.</param>
    /// <param name="dictionary">Dictionary of [text, text].</param>
    /// <returns>Return value of type Text.</returns>
    procedure FindWhoLikes(var1: text; dictionary: Dictionary of [text, text]): Text
    var
        text: Text;
        keyValue: text;
        result: text;
    begin
        foreach keyvalue in dictionary.Keys() do begin

            text := dictionary.Get(keyValue);

            if (text.Contains(var1)) and (var1 <> ',') then
                result := result + keyValue + '; ';
        end;

        if result = '' then begin
            Message('no likes %1', var1);
            exit('error');
        end;

        exit(result);
    end;

    /// <summary>
    /// cleanDictionary.
    /// </summary>
    /// <param name="dictionary">VAR Dictionary of [text, text].</param>
    procedure cleanDictionary(var dictionary: Dictionary of [text, text])
    var
        counter: integer;
    begin
        Clear(dictionary);
    end;

    /// <summary>
    /// CreateADictionary.
    /// </summary>
    /// <param name="choice">Boolean.</param>
    /// <returns>Return value of type Dictionary OF [TEXT, TEXT].</returns>
    procedure CreateADictionary(choice: integer): Dictionary OF [TEXT, TEXT]
    var
        dictionary: Dictionary of [TEXT, TEXT];
    begin
        if choice = 1 then begin

            dictionary.add('A', 'B');
            dictionary.add('B', 'C');
            dictionary.add('C', 'D');
            dictionary.add('D', 'E');
            dictionary.add('E', 'F');
            dictionary.add('F', 'F');
        end
        else begin
            dictionary.add('A', 'C');
            dictionary.add('B', 'C');
            dictionary.add('C', 'E');
            dictionary.add('D', 'E');
            dictionary.add('E', 'A, B');
            dictionary.add('F', 'B');
        end;
        exit(dictionary);
    end;
}