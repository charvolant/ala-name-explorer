package ala.name.explorer

import au.org.ala.names.model.ALAParsedName
import au.org.ala.names.model.LinnaeanRankClassification
import au.org.ala.names.model.MetricsResultDTO
import au.org.ala.names.search.ALANameSearcher
import au.org.ala.names.util.TaxonNameSoundEx
import org.gbif.api.model.checklistbank.ParsedName
import org.gbif.nameparser.PhraseNameParser

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

    def soundex(String name) {
        PhraseNameParser parser = new PhraseNameParser()
        ParsedName pn = parser.parse(name)
        String genus = TaxonNameSoundEx.treatWord(pn.genusOrAbove, "genus")
        String species = pn.isBinomial() ? TaxonNameSoundEx.treatWord(pn.specificEpithet, "species") : null
        return [genus: genus, species: species]
    }
}