Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DADC433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Dec 2021 16:04:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351152AbhLFQHb convert rfc822-to-8bit (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Dec 2021 11:07:31 -0500
Received: from aposti.net ([89.234.176.197]:37238 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1445063AbhLFQFd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Dec 2021 11:05:33 -0500
Date:   Mon, 06 Dec 2021 16:01:53 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] remoteproc: ingenic: Request IRQ disabled
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org
Message-Id: <57BP3R.7O3L4UCQTE0P@crapouillou.net>
In-Reply-To: <20211205111349.51213-1-lars@metafoo.de>
References: <20211205111349.51213-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Lars,

Le dim., déc. 5 2021 at 12:13:49 +0100, Lars-Peter Clausen 
<lars@metafoo.de> a écrit :
> The ingenic remoteproc driver requests its IRQ and then immediately
> disables it.
> 
> The disable is necessary since irq_request() normally enables the 
> IRQ. But
> there is a new flag IRQF_NO_AUTOEN that when specified keeps the IRQ
> disabled. Use this new flag rather than calling disable_irq().
> 
> This slightly reduce the boilerplate code and also avoids a 
> theoretical
> race condition where the IRQ could fire between irq_request() and
> disable_irq().
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/remoteproc/ingenic_rproc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/ingenic_rproc.c 
> b/drivers/remoteproc/ingenic_rproc.c
> index a356738160a4..9902cce28692 100644
> --- a/drivers/remoteproc/ingenic_rproc.c
> +++ b/drivers/remoteproc/ingenic_rproc.c
> @@ -218,14 +218,13 @@ static int ingenic_rproc_probe(struct 
> platform_device *pdev)
>  	if (vpu->irq < 0)
>  		return vpu->irq;
> 
> -	ret = devm_request_irq(dev, vpu->irq, vpu_interrupt, 0, "VPU", 
> rproc);
> +	ret = devm_request_irq(dev, vpu->irq, vpu_interrupt, IRQF_NO_AUTOEN,
> +			       "VPU", rproc);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to request IRQ\n");
>  		return ret;
>  	}
> 
> -	disable_irq(vpu->irq);
> -
>  	ret = devm_rproc_add(dev, rproc);
>  	if (ret) {
>  		dev_err(dev, "Failed to register remote processor\n");
> --
> 2.30.2
> 


