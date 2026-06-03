# Peppol UBL → HTML invoice renderer

Feed in a Peppol BIS Billing 3.0 UBL document (an **Invoice** or **CreditNote**
XML) and get back a clean, standalone HTML version of it, using the official
OpenPEPPOL stylesheet.

## Usage

```bash
./render-invoice.sh <input.xml> [output.html] [language]
```

- `input.xml` – the Peppol UBL invoice/credit-note file
- `output.html` – optional; defaults to the input name with a `.html` extension
- `language` – optional label language, `en` (default) or `no`

Example:

```bash
./render-invoice.sh examples/sales-order-example.xml
# -> writes examples/sales-order-example.html
```

The generated HTML is self-contained (CSS is inlined), so you can open it in any
browser or email it as-is.

## What's here

- `stylesheet-ubl.xslt` – the official OpenPEPPOL BIS Billing 3.0 stylesheet (XSLT 2.0)
- `render-invoice.sh` – wrapper that runs the transform
- `lib/saxon-he.jar` – Saxon-HE 9.9, the XSLT 2.0 engine (needs Java)
- `examples/` – a sample invoice and its rendered HTML

## Requirements

Java (any modern JRE). The XSLT 2.0 engine (Saxon-HE) is bundled in `lib/`.
