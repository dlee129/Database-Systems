use WNBA;
go

create function FileUpload.ConvertVarcharToDate
(
    -- Add the parameters for the function here
    @VarcharDate char(10)
)
returns date
as
begin
    -- Declare the return variable here
    declare @Result int;
    declare @DateString char(8);

    set @DateString
        = concat(substring(@VarcharDate, 1, 4), substring(@VarcharDate, 6, 2), substring(@VarcharDate, 9, 2));

    if (@DateString = '00000000') return null;

    return cast(@DateString as date);



end;
go


create function FileUpload.ConvertVarcharToFloat
(
    -- Add the parameters for the function here
    @VarcharFloat char(10)
)
returns float
as
begin
    -- Declare the return variable here
 

    return cast(@VarcharFloat as float);
end;
go


create function FileUpload.ConvertVarcharToInt
(
    -- Add the parameters for the function here
    @VarcharInt char(10)
)
returns int
as
begin
    -- Declare the return variable here
 

    return cast(@VarcharInt as int);
end;
go


select bioID
     , fullGivenName
     , height       =  FileUpload.ConvertVarcharToFloat(height)
     , weight       = FileUpload.ConvertVarcharToInt(weight)
     , FileUpload.ConvertVarcharToDate(birthDate)
from wom_basketball_master as wbm;
