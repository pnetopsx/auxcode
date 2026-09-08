# Modelo: achado de revisão

Lido sob demanda, a partir dos ponteiros do passo 3 do [SKILL.md](SKILL.md). Não é carregado a cada invocação.

## Alvo do texto

Alvo do texto (briefing, regra, item do roadmap): o achado aponta termo sem número, critério não observável, conflito entre duas fontes ou lacuna, sempre citando a fonte. Pergunta de comportamento não é achado de texto: vira defeito, com esperado e observado.

## Formato do achado

```text
A-01 · <classe> · <o que está errado, em uma linha> · <identificador ferido, quando é violação> · <esperado x observado, quando é defeito> · <arquivo e trecho, teste ou reprodução> · <estado: corrigido | backlog | descartado>
ex.: A-03 · defeito · total do pedido fica negativo com desconto maior que o subtotal · R-01 · esperado 0, observado -40 · src/total.ts:42, teste test_total_desconto · corrigido
```

Sem esquema no projeto, numere `A-01…`, continuando a numeração do relatório anterior da mesma área.

Achado gravado não é apagado nem renumerado. Repetições da mesma classe e causa entram como uma linha, com a contagem completa das ocorrências, um exemplo com arquivo e trecho e a correção comum; separe só quando a correção muda.

## Relatório

Grave no local de evidências ou de estado do projeto, com área e data no nome. Já existe um da mesma área: não sobrescreva; a revisão nova continua a numeração e diz, de cada achado anterior, se segue aberto ou fechado.
