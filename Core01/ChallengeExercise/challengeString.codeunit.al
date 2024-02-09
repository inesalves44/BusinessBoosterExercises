/// <summary>
/// Codeunit Id.
/// </summary>
codeunit 50133 StringResolution
{
    /// <summary>
    /// islikeString.
    /// </summary>
    /// <param name="var1">text.</param>
    /// <param name="var2">text.</param>
    /// <param name="string">Text.</param>
    /// <returns>Return value of type Boolean.</returns>
    procedure islikeString(var1: text; var2: text; string: Text): Boolean
    var
        counter: Integer;
        result: text;
    begin

        if (NOT string.Contains(var1)) or (not string.Contains(var2)) then begin
            Message('Input invalid');
            exit(false);
        end;

        counter := 1;

        while counter <= StrLen(string) do begin

            if (string[counter] = var1) then begin

                while (string[counter] <> '-') do begin
                    counter := counter + 1;
                end;

                while (string[counter] <> ' ') do begin
                    result := result + string[counter];
                    counter := counter + 1;
                end;


                counter := StrLen(string);
            end;
            counter := counter + 1;
        end;

        exit(result.Contains(var2));
    end;


    /// <summary>
    /// MyProcedure.
    /// </summary>
    /// <param name="var1">text.</param>
    /// <param name="string">Text.</param>
    /// <returns>Return value of type Text.</returns>
    procedure GetWhoLikes(var1: text; string: Text): Text
    var
        counter, temp : Integer;
        result: text;
    begin

        if (NOT string.Contains(var1)) OR (var1 = ' ') or (var1 = ',') or (var1 = ';') or (var1 = '-') then begin
            Message('Input invalid');
            exit('error');
        end;

        counter := 1;

        while counter <= StrLen(string) do begin

            if (string[counter] = var1) and ((string[counter + 1] = ' ') or (string[counter + 1] = ',')) then begin

                temp := counter;
                while (string[counter] <> ' ') and (counter > 1) do begin
                    counter := counter - 1;
                end;

                while (string[counter] <> '-') and (counter <= strlen(string)) do begin

                    result := result + string[counter];
                    COUNTER := Counter + 1;
                end;
                counter := temp;
            end;

            COUNTER := Counter + 1;
        end;

        if result = '' then
            result := 'no one';
        exit(result);
    end;

    /// <summary>
    /// CreateString.
    /// </summary>
    /// <param name="choice">integer.</param>
    /// <param name="string">VAR text.</param>
    /// <returns>Return value of type text.</returns>
    procedure CreateString(choice: integer; var string: text)
    begin
        if (choice = 1) then begin
            string := 'A-B B-C C-D D-E E;F-F ';
        end
        else begin
            string := 'A;B-C C;D-E E-A,B F-B ';
        end;
    end;
}