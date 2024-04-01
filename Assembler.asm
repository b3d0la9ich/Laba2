section .data
    sequence dd 5, 12, 12, 23, 23, 23, 108
    sequence_size equ ($ - sequence) / 4

section .bss
    count resd 1

section .text
    global _start

_start:
    ; Инициализируем счетчик
    mov dword [count], 0

    ; Устанавливаем индекс для цикла
    mov ecx, 1

compare_loop:
    ; Загружаем текущий элемент последовательности
    mov eax, [sequence + ecx * 4]
    ; Загружаем предыдущий элемент последовательности
    mov ebx, [sequence + ecx * 4 - 4]

    ; Сравниваем текущий и предыдущий элементы
    cmp eax, ebx
    jne skip_increment

    ; Если равны, увеличиваем счетчик
    inc dword [count]

skip_increment:
    ; Увеличиваем индекс и проверяем, не достигли ли конца последовательности
    inc ecx
    cmp ecx, sequence_size
    jl compare_loop

    ; Конвертируем счетчик в строку для вывода
    mov eax, [count]
    add eax, '0' ; Преобразуем число в ASCII символ
    mov [count], eax ; Сохраняем ASCII символ обратно в памяти

    ; Выводим результат
    mov eax, 4
    mov ebx, 1
    mov ecx, count
    mov edx, 1
    int 0x80

    ; Завершаем программу
    mov eax, 60
    xor edi, edi
    syscall