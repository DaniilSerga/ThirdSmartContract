Отличие revert, require и assert заключается в передаваемых параметрах:
1) revert принимает только текст выбрасываемого искоючения, 
2) require булеву операцию и текст исключения,
3) assert только булеву операцию и выбрасывает исключения типа Panic.

Модификаторы modifier нужны для выноса условия, необходимого для выполнения функции.
Записывается в виде:
function withdraw(address payable _to) external onlyOwner {...},
Где onlyOwner - модификатор.

Нулевой адрес - адрес вида 0х000(0)

События (event) добавляют параметры, переданные в них, в специальный журнал событий, управлять которым
можно с помощью внешних средств. Для вызова события нужно написать команду: emit НазваниеСобытия(параметры).
Также для поиска по журналу событий внешними средствами по какому-то параметру, необходимо к этому
параметру дописать indexed.
