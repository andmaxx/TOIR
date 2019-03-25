

&AtClient
Procedure Заполнить(Command)
	ЗаполнитьAtServer();
EndProcedure

&AtServer
Procedure ЗаполнитьAtServer()
	
	Запрос = Новый Запрос;
	Запрос.Текст = "SELECT
	|	ТехнологическиеОперацииРаботы.Описание КАК ОписаниеРабот
	|FROM
	|	Catalog.ТехнологическиеОперации.Работы AS ТехнологическиеОперацииРаботы
	|WHERE
	|	ТехнологическиеОперацииРаботы.Ref = &Ref";
	
	Запрос.УстановитьПараметр("Ref", Object.ТехнологическаяОперация);
	Результат = Запрос.Выполнить().Выгрузить();
	Object.Работы.Загрузить(Результат); 
EndProcedure
