const double temperaturaAguaNaturalDefault = 10; // reference: https://app.eraclimate.com/emissions-estimator?gclid=CjwKCAjwxr2iBhBJEiwAdXECw_F2nzVA-4RtpcQRVkiwGTOBFZSzAOVCPirtp2nExOZzN3Dc4kWbLhoCwsMQAvD_BwE
const double temperaturaAguaAposAquecimentoDefault = 40; // reference: https://www.gov.br/ebserh/pt-br/hospitais-universitarios/regiao-centro-oeste/hc-ufg/comunicacao/noticias/qual-e-a-temperatura-ideal-para-o-banho#:~:text=Segundo%20Camilla%20de%20Barros%20Borges,de%20dores%20musculares%20e%20articulares.
const double fatorEmissaoCarbonoNaGeracaoEletricidadeBrasilKgCO2PorkWh = 42.6; // dado de 2019 reference:
// https://www.gov.br/mcti/pt-br/acompanhe-o-mcti/sirene/dados-e-ferramentas/fatores-de-emissao
// https://www.gov.br/mcti/pt-br/acompanhe-o-mcti/cgcl/paginas/Despacho_2023_janmar.xlsx

// O valor de emissão de dióxido de carbono (CO2) por quilowatt-hora (kWh) de eletricidade varia de acordo com a fonte de geração de energia elétrica em cada país ou região.
//Em geral, as fontes de energia que produzem menos emissões de CO2 por kWh são as fontes renováveis, como solar, eólica e hidrelétrica, enquanto as fontes fósseis, como carvão e gás natural, produzem mais emissões de CO2 por kWh.
// No Brasil, a emissão média de CO2 por kWh de eletricidade gerada é de cerca de 0,48 kgCO2e/kWh, de acordo com dados do Ministério de Minas e Energia do Brasil. No entanto, esse valor pode variar dependendo da região do país e da fonte de geração de energia elétrica utilizada.
// Caso queira obter informações mais precisas sobre a emissão de CO2 por kWh em sua região, é possível entrar em contato com a companhia de energia elétrica local ou consultar os relatórios e dados publicados pelas agências reguladoras de energia do país.