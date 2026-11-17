#!/bin/bash

echo "Running tests..."

# Проверяем, что файл существует
if [ ! -f "hello.sh" ]; then
    echo "❌ FAIL: hello.sh not found"
    exit 1
fi

# Проверяем, что файл исполняемый
if [ ! -x "hello.sh" ]; then
    echo "❌ FAIL: hello.sh is not executable"
    exit 1
fi

# Проверяем, что скрипт запускается
output=$(./hello.sh)
if [ $? -ne 0 ]; then
    echo "❌ FAIL: hello.sh exited with error"
    exit 1
fi

# Проверяем, что в выводе есть нужная строка
if ! echo "$output" | grep -q "Hello from CI/CD!"; then
    echo "❌ FAIL: expected output not found"
    exit 1
fi

echo "✅ All tests passed!"
exit 0
