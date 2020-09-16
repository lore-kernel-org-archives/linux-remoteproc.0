Return-Path: <SRS0=iWym=CZ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDFBC43461
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Sep 2020 17:29:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E182B222C8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Sep 2020 17:29:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mNTDCrov"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgIPR3P (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Sep 2020 13:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbgIPR3H (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Sep 2020 13:29:07 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0F29C061352
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2020 10:17:51 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id c3so3545341plz.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Sep 2020 10:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=icqQdJptZU1+Cli7+KP35XPpco/lrViFrPCj4c4ItTU=;
        b=mNTDCrovWeR++HPoKJ5nc9Jd4bCTN0psmXsvkS5E3/I1fy+W6uAlWjYQsHgbHwIjZT
         7rW0VJ1LogMzOqE+y/JfsZJsMrGDIOaoBaWZZmqKsie1JUYETlh8qdq2SSI2nhoZ27I7
         FZQfkeVKS19jy6I03LnAS/dFZwDUNick/O9kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=icqQdJptZU1+Cli7+KP35XPpco/lrViFrPCj4c4ItTU=;
        b=c3AOct5nsf1yQBX1pKc5OJ/QyGNEsFLDuW76+f8mq43K9d0LWV2Usk2YYq57M/XwUM
         yLgy77epEPnHK/3FTTjBCuKpyzsnl/Lxqs3wPhc1bJ1CDQsXYpeJ3U6qm1AbDMAPRdZH
         U8EJkWDW6WtQ8K4P+BNSf0sn4Nd84DKVPPBtm0MSLiY+jkDlAqD0mpaU8YGrpFzDhOB/
         0PipGQYgVp8qevNSEFVnwyG/lqxXzcXSpcAkLzOWcSjYBl29BWp531mnWMujGat441ui
         wDyER80c1DOxVsH04VA9j521vCKbxc39w0spp35UXgUIn/YnSCGpLCxK8PD6J2j3+bJh
         byYQ==
X-Gm-Message-State: AOAM533As0Rrx9AiogrpswJDxW5vQ+GZyMSWt2hUhkF0zmVi+STFF4sH
        2mLfQCLPaNaqpT7W1NNpsBLB4w==
X-Google-Smtp-Source: ABdhPJwls/xnxK0gmUalIkWlfpej7xUrnrowqMX77b9HSLjNZLh8iL4/eR5Em7wKVHXEpoKFK6BvkQ==
X-Received: by 2002:a17:902:8643:b029:d1:920c:c1db with SMTP id y3-20020a1709028643b02900d1920cc1dbmr25400194plt.42.1600276671136;
        Wed, 16 Sep 2020 10:17:51 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x4sm17420010pff.57.2020.09.16.10.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 10:17:50 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200916145252.16024-1-sibis@codeaurora.org>
References: <20200916145252.16024-1-sibis@codeaurora.org>
Subject: Re: [PATCH v2] remoteproc: qcom_q6v5: Assign mpss region to Q6 before MBA boot
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ohad@wizery.com, evgreen@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org
Date:   Wed, 16 Sep 2020 10:17:48 -0700
Message-ID: <160027666863.4188128.6191735162530147774@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2020-09-16 07:52:52)
> On secure devices which support warm reset, the MBA firmware requires
> access to the modem region to clear them out. Hence provide Q6 access
> to this region before MBA boot. This will be a nop during a modem SSR.
>=20

Does it need a Fixes: tag? Probably.

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>=20

Trivia time!

>=20
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom=
_q6v5_mss.c
> index c401bcc263fa..f989ca81d374 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -931,6 +931,16 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>                 goto assert_reset;
>         }
> =20
> +       /* Some versions of the MBA firmware will upon boot wipe the MPSS=
 region as well, so provide

Should have /* on a line by itself.

> +        * the Q6 access to this region.
> +        */
> +       ret =3D q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false, =
true,
> +                                     qproc->mpss_phys, qproc->mpss_size);
> +       if (ret) {
> +               dev_err(qproc->dev, "assigning Q6 access to mpss memory f=
ailed: %d\n", ret);
> +               goto disable_active_clks;
> +       }
> +
>         /* Assign MBA image access in DDR to q6 */
>         ret =3D q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false, t=
rue,
>                                       qproc->mba_phys, qproc->mba_size);
> @@ -1137,8 +1147,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
> =20
>         /**

Should be /* instead of /**, the latter is for kernel-doc which this is
not.

>          * In case of a modem subsystem restart on secure devices, the mo=
dem
> -        * memory can be reclaimed only after MBA is loaded. For modem co=
ld
> -        * boot this will be a nop
> +        * memory can be reclaimed only after MBA is loaded.
>          */
>         q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, false,
>                                 qproc->mpss_phys, qproc->mpss_size);
