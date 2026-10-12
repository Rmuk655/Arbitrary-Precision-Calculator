# Arbitrary-Precision Calculator

An arbitrary-precision integer and decimal arithmetic library in Java, with its own `BigInteger` and `BigDecimal` classes written from scratch (no `java.math`), and a command-line front end. Built for the Software Development Fundamentals course at IIT Hyderabad; the project report is in `SDF_Java_Project_Report.pdf`.

## Features

- Arbitrarily large integers: add, subtract, multiply, divide.
- Decimal numbers with 30 digits of precision after the point.
- Division by zero is detected and reported instead of throwing.
- Command-line tool packaged as a runnable JAR, plus an optional Python wrapper.

## Build

Requires a JDK and [Apache Ant](https://ant.apache.org/).

```bash
ant jar          # produces build/jar/aarithmetic.jar
```

## Usage

```bash
java -jar build/jar/aarithmetic.jar <int|float> <add|sub|mul|div> <operand1> <operand2>
```

| Argument | Meaning |
|---|---|
| `int` / `float` | Integer or decimal arithmetic |
| `add` `sub` `mul` `div` | The operation |
| `operand1`, `operand2` | Numbers, passed as strings |

Examples:

```bash
java -jar build/jar/aarithmetic.jar int add 123456789012345678901234567890 987654321098765432109876543210
# 1111111110111111111011111111100

java -jar build/jar/aarithmetic.jar int mul 123456789012345678901234567890 987654321098765432109876543210
# 121932631137021795226185032733622923332237463801111263526900

java -jar build/jar/aarithmetic.jar float div 25.5 4.2
```

### Python wrapper

`src/main/java/python_script.py` builds the JAR with Ant and then runs it with the same arguments:

```bash
python src/main/java/python_script.py <int|float> <add|sub|mul|div> <operand1> <operand2>
```

## Layout

| Path | Contents |
|---|---|
| `src/main/java/arbitraryarithmetic/BigInteger.java` | Arbitrary-size integer implementation |
| `src/main/java/arbitraryarithmetic/BigDecimal.java` | Decimal implementation built on `BigInteger` |
| `src/main/java/arbitraryarithmetic/AInteger.java`, `AFloat.java` | Wrapper classes exposing the `add`/`sub`/`mul`/`div` API |
| `src/main/java/MyInfArith.java` | Command-line entry point |
| `src/main/java/MyInfArithTest.java` | Tests |
| `build.xml`, `pom.xml` | Ant build (primary) and Maven descriptor |
