SHELL = /bin/sh
.PHONY: запускаем кодогенерацию
gen:
	$(FLUTTER) flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: удаление смердженых веток
delete-merged:
	$(FLUTTER) git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d

.PHONY: Запуск интеграционных тестов (all tests)
integr-test:
	$(FLUTTER) flutter test integration_test

.PHONY: генерация prod конфига
config:
	$(FLUTTER) flutter pub run environment_config:generate
