var database = require("../database/config");

function buscarUltimasMedidas(idSensor, limite_linhas) {
    
    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top ${limite_linhas}
        luminosidade_L as luminosidade,  
                            data_hora,
                            FORMAT(data_hora, 'HH:mm:ss') as momento_grafico
                        from [dbo].[historico]
                        where fkSensor = ${idSensor}
                        order by idHistorico desc`;
    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        luminosidade_L as luminosidade, 
                        data_hora,
                        DATE_FORMAT(data_hora,'%H:%i:%s') as momento_grafico
                    from historico
                    where fkSensor = ${idSensor}
                    order by idHistorico desc limit ${limite_linhas}`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idSensor) {

    instrucaoSql = ''

    if (process.env.AMBIENTE_PROCESSO == "producao") {
        instrucaoSql = `select top 1
        luminosidade_L as luminosidade,  
                        CONVERT(varchar, data_hora, 108) as momento_grafico, 
                        fkSensor 
                        from [dbo].[historico] where fkSensor = ${idSensor} 
                    order by idHistorico desc;`;

    } else if (process.env.AMBIENTE_PROCESSO == "desenvolvimento") {
        instrucaoSql = `select 
        luminosidade_L as luminosidade, 
                        data_hora,
                        DATE_FORMAT(data_hora,'%H:%i:%s') as momento_grafico
                    from historico
                    where fkSensor = ${idSensor}
                    order by idHistorico desc limit 1`;
    } else {
        console.log("\nO AMBIENTE (produção OU desenvolvimento) NÃO FOI DEFINIDO EM app.js\n");
        return
    }

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
