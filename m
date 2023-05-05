Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E16C77B7C
	for <linux-remoteproc@archiver.kernel.org>; Fri,  5 May 2023 08:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbjEEI6e (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 5 May 2023 04:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjEEI6d (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 5 May 2023 04:58:33 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B95713C22
        for <linux-remoteproc@vger.kernel.org>; Fri,  5 May 2023 01:58:32 -0700 (PDT)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 69C326605707;
        Fri,  5 May 2023 09:58:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1683277110;
        bh=vSczuqXRpd27PzucATAReL2YOYyw2x1YPKAjkBTjN64=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=oaoXmrUzdzITM48AWpt/7Rw6iDm1F/bQqkqPra2cYr3ETQDKIbUYbfpGlqc1zTRMg
         3Bh4vBXQSvmRwcOJi82tYqy1xa16Ngqim9nKWEe9ep2eezCctvEsIFGmabjboUavqy
         hVMwLq+15Yt5jbySK8yduGPVkVg3JM6E/yYilQBz9si6ho+zakOAU5DHF83PDRuEax
         Vkxb2x6sUP+mZm7vTkSf/VuQwLW1dbg+ri9yGk19GpV979TkVVoLwM3+iZWWHWpXQe
         cuuiHVDup1QO/jZE8AhmUwc6gPWnMCa6x0UT5IHKGPNkbUyGWXgUq12yBfo9BrNmgz
         DCQvp6pm6JueQ==
Message-ID: <d43816cf-06ff-f887-c4b0-9c3d68ba7d72@collabora.com>
Date:   Fri, 5 May 2023 10:58:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 06/18] remoteproc: mtk_scp: Convert to platform remove
 callback returning void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
 <20230504194453.1150368-7-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230504194453.1150368-7-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Il 04/05/23 21:44, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


