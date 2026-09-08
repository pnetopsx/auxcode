# Modelos: mapa de fontes, checkpoint e linha de alinhamento

Copie a estrutura para o local que o projeto já usa para estado de trabalho (STATUS, docs de trabalho) e troque todo texto de exemplo por dado real; campo sem dado é omitido, não fica com o exemplo. Caminho, branch ou commit de exemplo gravado derruba a retomada, que confere um commit que nunca existiu. Podem ser duas seções do mesmo arquivo. O mapa muda pouco; o checkpoint é substituído a cada marco, nunca acumulado.

## Mapa de fontes

Só caminho/seção e papel. Fonte substituída: diga por qual, em vez de mantê-la como verdade paralela. Caminho relativo à raiz do repositório; o que só existe fora dele (CI, painel, aparelho, alvo de deploy já aceito) entra por nome, não por caminho.

```markdown
## Mapa de fontes
| Papel | Onde | Nota |
| --- | --- | --- |
| Propósito e público | docs/produto.md §1 | |
| Regras e decisões | docs/adr/ (índice em docs/adr/README.md) | ADR-012 substitui ADR-004 |
| Roadmap e etapa atual | docs/ROADMAP.md §Etapa 2 | |
| Estado e evidências | docs/STATUS.md; CI; ambiente de preview | |
| Portão e ambiente | `pnpm verify` com Node 24 (.nvmrc) · variáveis exigidas | check do PR SKIPPED não vale como portão |
```

## Checkpoint

```markdown
## Checkpoint — 2026-09-06 19:40 · feat/paginacao @ a1b2c3d + 3 sem commit
**Etapa:** 2 (docs/ROADMAP.md §Etapa 2) · **Tarefa:** <o que> · **Pronto quando:** <critério observável>
**Estado:** feito: <…> · verificado: <…> · publicado: <…>
**Próximo passo:** <uma linha; o próximo item da etapa, salvo bloqueio>
**Decisões desta rodada:** <decisão · fonte · o que substitui · motivo · alternativa mais simples descartada>
**Fatos verificados:** <…>
**Hipóteses abertas:** <…>
**Suposições abertas:** <o quê · quem confirma>
**Descartado:** <tentativa · motivo, para não repetir>
**Fora do escopo, anotado em:** <onde no backlog/roadmap>
**Não verificado:** <o que · por quê>
```

Regras: omita campo vazio; nada de logs, código ou segredo; decisão durável vai para o documento de decisões e o checkpoint só a referencia; a identificação do estado (data, branch/commit ou arquivos) é obrigatória, porque é o que a retomada confere; ela é lida na hora de gravar, não de memória, e mudança sem commit entra como `+ N sem commit`; a substituição fica confinada à seção do checkpoint: dois títulos iguais é diário. Se o arquivo mudou depois de você o ter lido nesta sessão, ou traz mudança sem commit que não saiu dela, não grave por cima: entregue o bloco no chat e diga onde ele entra. Marco não autoriza commitar.

## Linha de alinhamento

No chat, antes de tocar em código, e de novo quando a abordagem mudar:

```text
Alinhamento: <pedido> atende <item do roadmap | regra | defeito> em <fonte>. Pronto quando: <critério observável>.
```

Exemplos:

```text
Alinhamento: paginar a lista de pedidos atende E2-01 (Etapa 2, paginação) em docs/ROADMAP.md. Pronto quando: 1.000 pedidos carregam em páginas de 50, a lista vazia mostra o texto acordado e o teste de paginação passa.
```

```text
Alinhamento: corrigir o total com desconto atende a regra "total nunca negativo" em docs/adr/ADR-009.md; defeito observado no teste test_total_desconto. Pronto quando: o teste falha sem a correção e passa com ela, e o total do pedido 1234, que mostrava −40, volta a 0 na tela.
```

```text
Sem item, regra ou defeito que sustente "adicionar tema escuro". Anotado em docs/ROADMAP.md §Backlog. Quer priorizar agora ou seguimos na Etapa 2?
```
