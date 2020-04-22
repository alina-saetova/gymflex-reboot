<#macro footer>
    <footer>
        <div>
            <small><@spring.message 'footer.quote'/></small>
        </div>
    </footer>
</#macro>

<#macro nav>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <a class="navbar-brand" href="/">GymFlex</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="/exercises"><@spring.message 'navigation.exercises'/></a></li>
                <li class="nav-item"><a class="nav-link" href="/trainings"><@spring.message 'navigation.trainings'/></a></li>
                <li class="nav-item"><a class="nav-link" href="/calculator"><@spring.message 'navigation.calculator'/></a></li>
                <li class="nav-item"><a class="nav-link" href="/createTraining"><@spring.message 'navigation.create'/></a></li>
                <li class="nav-item"><a class="nav-link" href="/profile"><@spring.message 'navigation.profile'/></a></li>
                <li class="nav-item"><a class="nav-link" href="/chat"><@spring.message 'navigation.chat'/></a></li>
            </ul>
        </div>
    </nav>
</#macro>