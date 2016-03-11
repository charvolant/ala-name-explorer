package ala.name.explorer

class ExplorerTagLib {
    static namespace = 'exp'
    static bie = "http://bie-dev.ala.org.au/ala-bie"


    def nameLink = { attrs ->
        def name = attrs.name
        def id = attrs.id

        if (id)
            out << "<a href=\"${bie}/species/${id}\">${name}</a>"
        else
            out << name
    }
}
