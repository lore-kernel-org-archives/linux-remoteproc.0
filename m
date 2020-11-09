Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C95C5517A
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 22:57:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7292A2074F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Nov 2020 22:57:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730684AbgKIW5o convert rfc822-to-8bit (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Nov 2020 17:57:44 -0500
Received: from aposti.net ([89.234.176.197]:54864 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730539AbgKIW5n (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Nov 2020 17:57:43 -0500
X-Greylist: delayed 599 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Nov 2020 17:57:42 EST
Date:   Mon, 09 Nov 2020 22:47:27 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] remoteproc: ingenic: Constify ingenic_rproc_ops
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Message-Id: <3NWJJQ.S916PME9WPQT@crapouillou.net>
In-Reply-To: <20201107233630.9728-2-rikard.falkeborn@gmail.com>
References: <20201107233630.9728-1-rikard.falkeborn@gmail.com>
        <20201107233630.9728-2-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

Le dim. 8 nov. 2020 à 0:36, Rikard Falkeborn 
<rikard.falkeborn@gmail.com> a écrit :
> The only usage of ingenic_rproc_ops is to pass its address to
> devm_rproc_alloc(), which accepts a const pointer. Make it const to
> allow the compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/remoteproc/ingenic_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/ingenic_rproc.c 
> b/drivers/remoteproc/ingenic_rproc.c
> index 1c2b21a5d178..26e19e6143b7 100644
> --- a/drivers/remoteproc/ingenic_rproc.c
> +++ b/drivers/remoteproc/ingenic_rproc.c
> @@ -135,7 +135,7 @@ static void *ingenic_rproc_da_to_va(struct rproc 
> *rproc, u64 da, size_t len)
>  	return (__force void *)va;
>  }
> 
> -static struct rproc_ops ingenic_rproc_ops = {
> +static const struct rproc_ops ingenic_rproc_ops = {
>  	.prepare = ingenic_rproc_prepare,
>  	.unprepare = ingenic_rproc_unprepare,
>  	.start = ingenic_rproc_start,
> --
> 2.29.2
> 


