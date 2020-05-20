Return-Path: <SRS0=BznH=7C=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C21C433DF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 20 May 2020 14:47:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CFF0207D4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 20 May 2020 14:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="n0wsLkMB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgETOrX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 May 2020 10:47:23 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:52718 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgETOrX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 May 2020 10:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1589986040; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t1ZlYSu22epfMxRnYs8iJPp9xd2l4qnINjM6pWxZLyo=;
        b=n0wsLkMBoiYntekMmPHEN2V2OECWGEeQN1i5/tL9YBi8rdiM8+wsgjM3ZI5zJaJWb/i1ON
        ucQ6mteX6lzyJ3vr3knTNdV2SY4yZEIwmab0Mj8CEbXEXUr6otiq+PMJlfIXtzx7QFc1oZ
        Mlrj62HUWfuaBTR+QkZIqhYHua9urVY=
Date:   Wed, 20 May 2020 16:47:10 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] remoteproc: Fix an error code in devm_rproc_alloc()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
Message-Id: <M2XMAQ.69YYPQMEVN31@crapouillou.net>
In-Reply-To: <20200520120705.GH172354@mwanda>
References: <20200520120705.GH172354@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Dan,

Le mer. 20 mai 2020 =E0 15:07, Dan Carpenter <dan.carpenter@oracle.com>=20
a =E9crit :
> The comments say that this function should return NULL on error and=20
> the
> caller expects NULL returns as well so I have modified the code to=20
> match.
> Returning an ERR_PTR(-ENOMEM) would lead to an OOps.
>=20
> Fixes: 305ac5a766b1 ("remoteproc: Add device-managed variants of=20
> rproc_alloc/rproc_add")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Alright, makes sense.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  drivers/remoteproc/remoteproc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_core.c=20
> b/drivers/remoteproc/remoteproc_core.c
> index 0cc015fabf78..9f04c30c4aaf 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2297,7 +2297,7 @@ struct rproc *devm_rproc_alloc(struct device=20
> *dev, const char *name,
>=20
>  	ptr =3D devres_alloc(devm_rproc_free, sizeof(*ptr), GFP_KERNEL);
>  	if (!ptr)
> -		return ERR_PTR(-ENOMEM);
> +		return NULL;
>=20
>  	rproc =3D rproc_alloc(dev, name, ops, firmware, len);
>  	if (rproc) {
> --
> 2.26.2
>=20


