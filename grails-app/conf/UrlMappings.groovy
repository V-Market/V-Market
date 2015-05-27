class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/" {
            controller = "auth"
            action = "index"
        }

        "/layout" {
            view = "layouts/template"
        }

        "500"(view:'/error')
    }
}
