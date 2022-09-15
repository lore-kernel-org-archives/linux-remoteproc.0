Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B2BC6FA89
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Sep 2022 14:17:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiIOORp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Sep 2022 10:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbiIOORZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Sep 2022 10:17:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75D999C8E2;
        Thu, 15 Sep 2022 07:17:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3664AB820CE;
        Thu, 15 Sep 2022 14:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEABC433C1;
        Thu, 15 Sep 2022 14:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663251442;
        bh=EwwefQT0xkcWn+q7j0xB2cBp+zLN4WWWHrU0Y8IGkK8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oAZ3lnVGns7GllzfS1jr3NvS9B2Um4Yu90X5Lm6pdfQkHxdvmhpHqPTic63Xxuk/V
         tFFYkoWkOLr1bO0amDGsUVepVRnLRP3MsT5vocGfkd1gijWRUUuZZQHMHac8y0PefZ
         6ae6lW8zmL9ajUuvGc1ZyDFkizZ+wVyvKAYQia+dSi8RteiHp2GQbt6/cll6xWsh8w
         kdKuTqi6Wt5bxK3zCMV8gNI7ww8Z/oKnQarr3rzWpqsYTgz/vVKG+fHio/USyyaJtK
         /u9rDh46dCrtXYK9ATuAhddoY43ZYV3K6N+tLYHCaMuGh0jWyGmNehnaQtzOsQ3xDp
         1urkjqhRjiHXw==
Date:   Thu, 15 Sep 2022 15:17:17 +0100
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: harden rproc_handle_vdev() against integer
 overflow
Message-ID: <YyMz7WFPavb2FFSq@work>
References: <YyMyoPoGOJUcEpZT@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyMyoPoGOJUcEpZT@kili>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 15, 2022 at 05:11:44PM +0300, Dan Carpenter wrote:
> The struct_size() macro protects against integer overflows but adding
> "+ rsc->config_len" introduces the risk of integer overflows again.
> Use size_add() to be safe.
> 
> Fixes: c87846571587 ("remoteproc: use struct_size() helper")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
>  drivers/remoteproc/remoteproc_core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index e5279ed9a8d7..4fc5ce2187ac 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -520,12 +520,13 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
>  	struct fw_rsc_vdev *rsc = ptr;
>  	struct device *dev = &rproc->dev;
>  	struct rproc_vdev *rvdev;
> +	size_t rsc_size;
>  	int i, ret;
>  	char name[16];
>  
>  	/* make sure resource isn't truncated */
> -	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
> -			avail) {
> +	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
> +	if (size_add(rsc_size, rsc->config_len) > avail) {
>  		dev_err(dev, "vdev rsc is truncated\n");
>  		return -EINVAL;
>  	}
> -- 
> 2.35.1
> 
