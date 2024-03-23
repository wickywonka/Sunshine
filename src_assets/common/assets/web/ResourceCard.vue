<template>
    <div class="card p-2">
        <div class="card-body">
            <h2>{{ $t('resource_card.resources') }}</h2>
            <br>
            <p>{{ $t('resource_card.resources_desc') }}</p>
            <div class="card-group p-4 align-items-center">
                <a class="btn btn-success m-1" href="https://app.lizardbyte.dev" target="_blank">
                    {{ $t('resource_card.lizardbyte_website') }}</a>
                <a class="btn btn-primary m-1" href="https://qm.qq.com/q/3tWBFVNZ" target="_blank">
                    <i class="fab fa-fw fa-discord"></i> 加入串流裙</a>
                <a class="btn btn-secondary m-1" href="https://github.com/qiin2333/moonlight-android/releases/tag/shortcut" target="_blank">
                    <i class="fab fa-fw fa-github"></i> 威力加强版 Moonlight-Android 下载</a>
            </div>
        </div>
    </div>
    <!-- Legal -->
    <div class="card p-2 mt-4">
        <div class="card-body">
            <h2>{{ $t('resource_card.legal') }}</h2>
            <br>
            <p>{{ $t('resource_card.legal_desc') }}</p>
            <div class="card-group p-4 align-items-center">
                <a class="btn btn-danger m-1" href="https://github.com/LizardByte/Sunshine/blob/master/LICENSE"
                    target="_blank">
                    <i class="fas fa-fw fa-file-alt"></i> {{ $t('resource_card.license') }}</a>
                <a class="btn btn-danger m-1" href="https://github.com/LizardByte/Sunshine/blob/master/NOTICE"
                    target="_blank">
                    <i class="fas fa-fw fa-exclamation"></i> {{ $t('resource_card.third_party_notice') }}</a>
            </div>
        </div>
    </div>
</template>
