Return-Path: <SRS0=FIV4=6E=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B5CC3815B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Apr 2020 18:58:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 005872084D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 20 Apr 2020 18:58:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aAUNKvGC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgDTS6g (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 20 Apr 2020 14:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgDTS6g (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 20 Apr 2020 14:58:36 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E8BC061A0C
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 11:58:36 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q19so11228222ljp.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 11:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OyRaasLaLoASyW1/WLmX+C7yyhvEwUVdH1hzQw3fL7E=;
        b=aAUNKvGCyrKNt32Q53YuPu83JPr2m78bZjek5JeaSOZXAWOSGrhq63lYEotLTLwyTV
         2lxdxzeM41bnfDEQPDVTPB4Z22UZOiLWy8uftsHy958As20WxujgDFn06bFQ7IHSzo0F
         djukFCXip2VwGYwTsqmQhzPG4l+oDShfVueps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OyRaasLaLoASyW1/WLmX+C7yyhvEwUVdH1hzQw3fL7E=;
        b=fmZ3jOe6W7DRdojNC65KUbtD2bx4DtZNJwsz1fCY8jWPsmL2Nxk4b5Uy7vQHSlQRi3
         ldaIHq9ZqVm7B62ndUHyf/ui8+hW1i7IqDPgiYoB/qf/vC+Zu5vryfUMG3BqTrt4zZvE
         yOp7QJTflq+sorfJWuzHmXFH2FrT7+udhh4rVqvMyDf+eSB0mwofDmVCx35ZdNLShGx3
         +AxQ8pyyFYcBx/Z9oF6kRtl0aSo/VLidVgOZKaq4Y+ep+MEst4WfML2UNN2j+Fgx5vX+
         1n6dSSp6aFlbXULXb/RNist9dqr58m/RHOADiwyM/ACY8zAAmIhENnFHFV0AQMNMndeX
         oNPA==
X-Gm-Message-State: AGi0PublEgxxmF7ZRusqMeFbpzAWq45UBoE12zRe91W0babO3c41O/iX
        Rz8Shw0R1ql2a8kSMOezyuNDXLlD5uo=
X-Google-Smtp-Source: APiQypLMasS+BfowQfFtfWyhYQr0k3a3sFv6mcV9xpOrN5mE2x4vJZxjsbf0uXlEwYxHVeOtTHt5Zg==
X-Received: by 2002:a2e:8087:: with SMTP id i7mr8681381ljg.99.1587409114191;
        Mon, 20 Apr 2020 11:58:34 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id m13sm211842lfk.12.2020.04.20.11.58.33
        for <linux-remoteproc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 11:58:33 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id j3so11215922ljg.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 20 Apr 2020 11:58:33 -0700 (PDT)
X-Received: by 2002:a05:651c:449:: with SMTP id g9mr11325281ljg.278.1587409112751;
 Mon, 20 Apr 2020 11:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200415071619.6052-1-sibis@codeaurora.org> <20200415071619.6052-2-sibis@codeaurora.org>
 <CAE=gft4NK8vXGwJFEtXwKroKfoSO8wPxq=fv35AVC6vSQk02ig@mail.gmail.com>
In-Reply-To: <CAE=gft4NK8vXGwJFEtXwKroKfoSO8wPxq=fv35AVC6vSQk02ig@mail.gmail.com>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 20 Apr 2020 11:57:56 -0700
X-Gmail-Original-Message-ID: <CAE=gft62yeCsK0U87doWmKhD0YC57fRB6-3g3aOLBJON4PY36Q@mail.gmail.com>
Message-ID:
 <CAE=gft62yeCsK0U87doWmKhD0YC57fRB6-3g3aOLBJON4PY36Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_mss: Remove unused
 q6v5_da_to_va function
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org, Ohad Ben Cohen <ohad@wizery.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200420185756.bmkFSqClPqGIUG5NmK6-cK-5eYbMS6UJ-6JIPRrvuvk@z>

On Mon, Apr 20, 2020 at 11:53 AM Evan Green <evgreen@chromium.org> wrote:
>
> On Wed, Apr 15, 2020 at 12:16 AM Sibi Sankar <sibis@codeaurora.org> wrote:
> >
> > Remove unsed q6v5_da_to_va function as the mss driver uses a per segment
> > dump function.
> >
> > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > ---
> >  drivers/remoteproc/qcom_q6v5_mss.c | 14 --------------
> >  1 file changed, 14 deletions(-)
> >
> > diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> > index b781fc8de3597..6a19e0e77236e 100644
> > --- a/drivers/remoteproc/qcom_q6v5_mss.c
> > +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> > @@ -196,7 +196,6 @@ struct q6v5 {
> >
> >         phys_addr_t mpss_phys;
> >         phys_addr_t mpss_reloc;
> > -       void *mpss_region;
>
> Hm, this doesn't build for me on our Chrome tree:
>
>   CC [M]  drivers/remoteproc/qcom_q6v5_mss.o
> /mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1118:16:
> error: no member named 'mpss_region' in 'struct q6v5'
>                 ptr = qproc->mpss_region + offset;
>                       ~~~~~  ^
> /mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1520:9:
> error: no member named 'mpss_region' in 'struct q6v5'
>         qproc->mpss_region = devm_ioremap_wc(qproc->dev,
> qproc->mpss_phys, qproc->mpss_size);
>         ~~~~~  ^
> /mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1521:14:
> error: no member named 'mpss_region' in 'struct q6v5'
>         if (!qproc->mpss_region) {
>              ~~~~~  ^

Whoops, ignore me, I missed the other patch in this series.
-Evan
