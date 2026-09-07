# Modelo: briefing mínimo do projeto

Para aplicativo do zero ou projeto em andamento sem propósito, regras ou roadmap escritos. Preencha com o usuário; proposta é proposta até ser aceita. Grave no local que o projeto já usa para propósito e regras; se não houver, `docs/projeto.md`. Projeto que já tem equivalentes não ganha cópia: o mapa de fontes aponta para eles e este modelo só cobre a lacuna.

O objetivo é eliminar suposição: cada campo abaixo é uma pergunta que, sem resposta escrita, o modelo teria de chutar.

## Briefing

```markdown
## Briefing
**Problema e resultado:** <quem sofre o quê hoje · o que muda com o aplicativo · como se mede>
**Público:** <quem usa e em que contexto · quem não é público>
**Jornadas principais:** <3 a 5 verbos, ex.: cadastrar lote · calcular teto · comparar arremates>
**Fora do escopo desta versão:** <lista explícita; o que foi pedido e ficou para depois>
**Restrições:** <plataformas · dados sensíveis · integrações · orçamento · prazo, se houver>
**Referências visuais aceitas:** <aplicativo, tela ou imagem a seguir e o que copiar de cada uma>
```

Trabalho visual sem referência aceita não começa. Anote aqui a referência antes de desenhar.

## Glossário

Um significado por termo. O código usa o mesmo nome do glossário.

```markdown
## Glossário
| Termo | Significado único | Nome no código |
| --- | --- | --- |
| Teto | Maior lance que ainda respeita a meta de lucro | `teto` |
```

## Regras e decisões

Toda regra e decisão tem identificador; a linha de alinhamento cita o identificador. Use o esquema que o projeto já tem (ADR-, DT-, D-); sem esquema, `R-` para regra de produto e `D-` para decisão técnica. Decisão substituída fica na tabela com o campo "substituída por" preenchido, não é apagada.

```markdown
## Regras e decisões
| ID | Regra ou decisão | Fonte e data | Substituída por |
| --- | --- | --- | --- |
| R-01 | Total nunca negativo | reunião 2026-09-02 | |
| D-01 | Dinheiro em inteiros (centavos), nunca ponto flutuante | ADR-003 | |
```

## Roadmap

Item sem "pronto quando" observável não entra em execução: o critério é escrito com o usuário antes. Um item tem uma entrega verificável, não um tema.

```markdown
## Roadmap
| Etapa | Item | Pronto quando | Depende de | Estado |
| --- | --- | --- | --- | --- |
| 1 | Cadastro de lote | lote salvo aparece na lista após recarregar; campos inválidos são apontados | | feito · verificado · publicado |
| 2 | Paginação da lista | 1.000 lotes em páginas de 50; teste de paginação passa | Etapa 1 | |
```

Estado usa os três níveis: feito, verificado, publicado. Item marcado como concluído tem a evidência ao lado ou no arquivo de estado.

## Suposições abertas

O que o modelo precisou assumir para seguir e ainda não foi confirmado. Nada com suposição aberta conta como verificado. Confirmada, vira regra com identificador ou some; refutada, o trabalho que dependia dela é revisto.

```markdown
## Suposições abertas
| Suposição | Quem confirma | Estado |
| --- | --- | --- |
| Comissão do leiloeiro é sempre 5% | proprietário | aberta |
```
