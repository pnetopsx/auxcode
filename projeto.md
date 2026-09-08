# Modelo: briefing mínimo do projeto

Para aplicativo do zero ou projeto em andamento sem propósito, regras ou roadmap escritos. Preencha com o usuário; proposta é proposta até ser aceita. Grave no local que o projeto já usa para propósito e regras; se não houver, `docs/projeto.md`. Projeto que já tem equivalentes não ganha cópia: o mapa de fontes aponta para eles e este modelo só cobre a lacuna.

O objetivo é eliminar suposição: cada campo abaixo é uma pergunta que, sem resposta escrita, o modelo teria de chutar.

Briefing derivado de projeto em andamento: cada campo e cada regra levam a fonte que os sustenta (arquivo:linha, commit, decisão). Campo sem fonte não vira palpite marcado como proposta; vira a pergunta, escrita no lugar do valor, ou linha em Suposições abertas.

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

Ao apresentar o briefing para aceite, diga quais jornadas ainda não têm item no roadmap e pergunte, para cada uma: agora, etapa futura ou fora do escopo? Jornada sem resposta fica em Suposições abertas, não vira item nem exclusão por conta própria.

## Glossário

Um significado por termo. O código usa o mesmo nome do glossário.

```markdown
## Glossário
| Termo | Significado único | Nome no código |
| --- | --- | --- |
| ex.: Teto | Maior lance que ainda respeita a meta de lucro | `teto` |
```

## Regras e decisões

Toda regra e decisão tem identificador; a linha de alinhamento cita o identificador. Use o esquema que o projeto já tem (ADR-, DT-, D-); sem esquema, `R-` para regra de produto e `D-` para decisão técnica. Decisão substituída fica na tabela com o campo "substituída por" preenchido, não é apagada.

```markdown
## Regras e decisões
| ID | Regra ou decisão | Motivo · alternativa descartada | Fonte e data | Substituída por |
| --- | --- | --- | --- | --- |
| ex.: R-01 | Total nunca negativo | pedido do proprietário · nenhuma alternativa cogitada | reunião 2026-09-02 | |
| ex.: D-01 | Dinheiro em inteiros (centavos), nunca ponto flutuante | float diverge do formatador · Decimal descartado por peso no bundle | ADR-003 | |
```

## Roadmap

Item sem "pronto quando" observável não entra em execução: o critério é escrito com o usuário antes. Um item tem uma entrega verificável, não um tema.

Classes a percorrer ao escrever o "pronto quando", quando o pedido as toca: caminho principal · fluxo alternativo · estado vazio · falha prevista (entrada inválida, item inexistente) · limite e volume · integração fora do ar · recuperação, quando a mudança grava dados ou muda esquema. Classe que não vale para o item vira exclusão escrita em "fora do escopo", não fica em branco. Pergunte só a classe que decide a direção; as demais seguem como suposição registrada.

```markdown
## Roadmap
| ID | Etapa | Item | Pronto quando | Depende de | Estado |
| --- | --- | --- | --- | --- | --- |
| ex.: E1-01 | 1 | Cadastro de lote | lote salvo aparece na lista após recarregar; campos inválidos são apontados | | feito · verificado · publicado |
| ex.: E2-01 | 2 | Paginação da lista | 1.000 lotes em páginas de 50; teste de paginação passa | E1-01 | |
```

Estado usa os três níveis: feito, verificado, publicado. Item marcado como concluído tem a evidência ao lado ou no arquivo de estado.

O ID do item não muda nem é reaproveitado; reordenar e repriorizar é livre, porque a citação é pelo ID, não pela posição. Item cancelado fica na tabela com Estado `cancelado · substituído por <ID>`; item novo entra com ID novo.

## Suposições abertas

O que o modelo precisou assumir para seguir e ainda não foi confirmado. Nada com suposição aberta conta como verificado. Confirmada, vira regra com identificador ou some; refutada, o trabalho que dependia dela é revisto.

```markdown
## Suposições abertas
| Suposição | Quem confirma | Estado |
| --- | --- | --- |
| ex.: Comissão do leiloeiro é sempre 5% | proprietário | aberta |
```
