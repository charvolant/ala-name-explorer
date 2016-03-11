package ala.name.explorer

import au.org.ala.names.model.LinnaeanRankClassification
import au.org.ala.names.model.MetricsResultDTO
import au.org.ala.names.search.ALANameSearcher
import grails.transaction.Transactional

class ExplorerService {
    def grailsApplication

    MetricsResultDTO find(LinnaeanRankClassification cl) {
        ALANameSearcher searcher = new ALANameSearcher(grailsApplication.config.explorer.indexDir)
        MetricsResultDTO results = searcher.searchForRecordMetrics(cl, true, true)
        if (results.result?.isSynonym()) {
            def ansr = searcher.searchForRecordByLsid(results.result.acceptedLsid)
            if(ansr != null) {
                ansr.setMatchType(results.result.matchType)
                results.setResult(ansr)
            }
        }
        return results
    }
}