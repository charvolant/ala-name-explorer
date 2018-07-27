package ala.name.explorer

import au.org.ala.names.model.LinnaeanRankClassification
import au.org.ala.names.model.MetricsResultDTO
import org.apache.commons.lang.StringUtils

class ExplorerController {
    def explorerService

    def index() {
        LinnaeanRankClassification source = new LinnaeanRankClassification();
        MetricsResultDTO result = null
        String errors = "", issues = ""
        def soundex;

        source.kingdom = StringUtils.trimToNull(params.kingdom)
        source.phylum = StringUtils.trimToNull(params.phylum)
        source.klass = StringUtils.trimToNull(params.klass)
        source.order = StringUtils.trimToNull(params.order)
        source.family = StringUtils.trimToNull(params.family)
        source.species = StringUtils.trimToNull(params.species)
        source.infraspecificEpithet = StringUtils.trimToNull(params.infraspecificEpithet)
        source.scientificName = StringUtils.trimToNull(params.scientificName)
        source.authorship = StringUtils.trimToNull(params.authorship)
        source.rank = StringUtils.trimToNull(params.rank)
        if (source.scientificName) {
            result = explorerService.find(source)
            errors = result?.errors?.inject("", { acc, val -> acc + (acc.isEmpty() ? "" : ", ") + val.name()})
            issues = result.lastException?.message ?: ""
            soundex = explorerService.soundex(source.scientificName)
        }
        render(view: "/index", model: [source: source, result: result, soundex: soundex, matchErrors: errors, issues: issues])
    }
}