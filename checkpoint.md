# Modelos: mapa de fontes, checkpoint e linha de alinhamento

Cole os dois blocos no local que o projeto já usa para estado de trabalho (STATUS, docs de trabalho). Podem ser duas seções do mesmo arquivo. O mapa muda pouco; o checkpoint é substituído a cada marco, nunca acumulado.

## Mapa de fontes

Só caminho/seção e papel. Fonte substituída: diga por qual, em vez de mantê-la como verdade paralela.

```markdown
## Mapa de fontes
| Papel | Onde | Nota |
| --- | --- | --- |
| Propósito e público | docs/produto.md §1 | |
| Regras e decisões | docs/adr/ (índice em docs/adr/README.md) | ADR-012 substitui ADR-004 |
| Roadmap e etapa atual | docs/ROADMAP.md §Etapa 2 | |
| Estado e evidências | docs/STATUS.md; CI; ambiente de preview | |
```

## Checkpoint

```markdown
## Checkpoint — 2026-09-06 19:40 · feat/paginacao @ a1b2c3d
**Etapa:** 2 (docs/ROADMAP.md §Etapa 2) · **Tarefa:** <o que> · **Pronto quando:** <critério observável>
**Estado:** feito: <…> · verificado: <…> · publicado: <…>
**Próximo passo:** <uma linha; o próximo item da etapa, salvo bloqueio>
**Decisões desta rodada:** <decisão · fonte · o que substitui>
**Fatos verificados:** <…>
**Hipóteses abertas:** <…>
**Descartado:** <tentativa · motivo, para não repetir>
**Fora do escopo, anotado em:** <onde no backlog/roadmap>
**Não verificado:** <o que · por quê>
```

Regras: omita campo vazio; nada de logs, código ou segredo; decisão durável vai para o documento de decisões e o checkpoint só a referencia; a identificação do estado (data, branch/commit ou arquivos) é obrigatória, porque é o que a retomada confere.

## Linha de alinhamento

No chat, antes de tocar em código, e de novo quando a abordagem mudar:

```text
Alinhamento: <pedido> atende <item do roadmap | regra | defeito> em <fonte>. Pronto quando: <critério observável>.
```

Exemplos:

```text
Alinhamento: paginar a lista de pedidos atende Etapa 2, item 3, em docs/ROADMAP.md. Pronto quando: 1.000 pedidos carregam em páginas de 50 e o teste de paginação passa.
```

```text
Alinhamento: corrigir o total com desconto atende a regra "total nunca negativo" em docs/adr/ADR-009.md; defeito observado no teste test_total_desconto. Pronto quando: o teste falha sem a correção e passa com ela.
```

```text
Sem item, regra ou defeito que sustente "adicionar tema escuro". Anotado em docs/ROADMAP.md §Backlog. Quer priorizar agora ou seguimos na Etapa 2?
```
