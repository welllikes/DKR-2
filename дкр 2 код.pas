program StackDemo;
const
  MAX_SIZE = 10;
type
  TStack = record
    Data: array[1..MAX_SIZE] of Integer;
    Top: Integer;
  end;
  
procedure InitializeStack(var S: TStack);
begin
  S.Top := 0;
end;

function IsEmpty(const S: TStack): Boolean;
begin
  IsEmpty := S.Top = 0;
end;

function IsFull(const S: TStack): Boolean;
begin
  IsFull := S.Top = MAX_SIZE;
end;

procedure Push(var S: TStack; Value: Integer);
begin
  if not IsFull(S) then
  begin
    Inc(S.Top);
    S.Data[S.Top] := Value;
  end
  else
    writeln('Стек полон');
end;

function Pop(var S: TStack): Integer;
begin
  if not IsEmpty(S) then
  begin
    Pop := S.Data[S.Top];
    Dec(S.Top);
  end
  else
  begin
    writeln('Стек пуст');
    Pop := -1;
  end;
end;

procedure DisplayStack(const S: TStack);
var
  i: Integer;
begin
  if not IsEmpty(S) then
  begin
    writeln('Содержимое стека:');
    for i := 1 to S.Top do
      writeln(S.Data[i]);
  end
  else
    writeln('Стек пуст');
end;

var
  MyStack: TStack;
  Choice, Value: Integer;
begin
  InitializeStack(MyStack);

  repeat
    writeln('1. Добавить элемент в стек');
    writeln('2. Извлечь элемент из стека');
    writeln('3. Показать содержимое стека');
    writeln('0. Выход');
    write('Введите ваш выбор: ');
    readln(Choice);

    case Choice of
      1: 
      begin
        write('Введите значение для добавления: ');
        readln(Value);
        Push(MyStack, Value);
      end;
      2: writeln('Извлечено из стека: ', Pop(MyStack));
      3: DisplayStack(MyStack);
    end;
  until Choice = 0;
end.
