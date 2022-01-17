Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086F4C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 17 Jan 2022 22:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbiAQWUm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 17 Jan 2022 17:20:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbiAQWUm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 17 Jan 2022 17:20:42 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10ECBC061574
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jan 2022 14:20:42 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id y14so25659297oia.9
        for <linux-remoteproc@vger.kernel.org>; Mon, 17 Jan 2022 14:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xhr/8PyjF82playpsZgDwn7GZ3zk/pxys25m7YWmU/8=;
        b=G/FZBWn/6nacx9MKONmB44KAKpK06JvnT6PA3mnA4URLwtFFRbidb4sFIgLTe5uzdz
         kofrM1qeA89dfv94hoSveCD+adff1/Fi0WSxxHz84zfw2qutyIzySwWOo+u/rsa7cKlV
         eojQ5dlYfUqX0tHEdvYUKjUlBKve9UOpKixmBJwp0O1QGkIq408omGDLFv4uOdBPjUeY
         ueZkUSccCNtxzBxdgn+67OBl3rVX7AbiIHLyi9Mp0xT/AkYouPaoPCIsXrNuFjWH7FVW
         3lHZuQhvWFXnIHOmv1jsnFsI2oKQlosXbgwOe3eMe3GJaFGggN3RGJAOuq95G6vZNMLg
         yUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xhr/8PyjF82playpsZgDwn7GZ3zk/pxys25m7YWmU/8=;
        b=Ypb2NDEDdeD5ePbI5diQp+6OAo7xMTNeS7mHHlHW8mUD0rvOSa3pjpdDk6MsfyZbrz
         bNGkCDK6lrePvxgSbzNbyTiIG2/ffK+MhILAQT3davmAaiOLhK7xp6TnN4EaynGeFcL/
         5XtfY/mTKLZpGSQguLWxo03hkOv07Cb1msr/QnOS/fLDHm/ZyHEBiGV7y4BV1T9qeCvu
         K2rv+ZDfs5pjjwRKNj0du7vFDPS2U+c/6AkFj/ke7fY9jf1V0/RLIXwM68WkkMwJtfuF
         WIBipvy5mFt8CnQzAuEUa38lJNn6E4Gnqhh3WiuEljG+y3d74Lgqbv20EnPXjutzjJO9
         DGwA==
X-Gm-Message-State: AOAM530XpmH4Zhem1OA88MguREwbTUNYxP6hzp/KsgsOWAHimShcwx34
        SRW7HLpvyCD3hcD9nLOPEERUOg==
X-Google-Smtp-Source: ABdhPJy/GoE19ffhi1guWHFtKQBoh6FhV0xuxaGd79tXyqyoq+uTAvG91zjYU29gXo/yrDv9mWnCWg==
X-Received: by 2002:a05:6808:aa7:: with SMTP id r7mr8584981oij.47.1642458041421;
        Mon, 17 Jan 2022 14:20:41 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i22sm1454643ood.36.2022.01.17.14.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 14:20:40 -0800 (PST)
Date:   Mon, 17 Jan 2022 16:20:38 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     linux-remoteproc@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: Query on moving Recovery remoteproc work to a separate wq
 instead of system freezable wq
Message-ID: <YeXrtuQglDwhNvLm@builder.lan>
References: <ea64436c-3d9b-9ac1-d4e8-38f15142a764@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea64436c-3d9b-9ac1-d4e8-38f15142a764@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 17 Jan 09:09 CST 2022, Mukesh Ojha wrote:

> Hi,
> 
> There could be a situation there is too much load(of tasks which is affined

As in "it's theoretically possible" or "we run into this issue all the
time"?

> to particular core) on a core on which  rproc
> recovery thread will not get a chance to run with no reason but the load. If
> we make this queue unbound, then this work
> can run on any core.
> 
> Kindly Let me if i can post a proper patch for this like below.
> 
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -59,6 +59,7 @@ static int rproc_release_carveout(struct rproc *rproc,
> 
>  /* Unique indices for remoteproc devices */
>  static DEFINE_IDA(rproc_dev_index);
> +static struct workqueue_struct *rproc_recovery_wq;
> 
>  static const char * const rproc_crash_names[] = {
>         [RPROC_MMUFAULT]        = "mmufault",
> @@ -2487,7 +2488,7 @@ void rproc_report_crash(struct rproc *rproc, enum
> rproc_crash_type type)
>                 rproc->name, rproc_crash_to_string(type));
> 
>         /* Have a worker handle the error; ensure system is not suspended */
> -       queue_work(system_freezable_wq, &rproc->crash_handler);
> +       queue_work(rproc_recovery_wq, &rproc->crash_handler);
>  }
>  EXPORT_SYMBOL(rproc_report_crash);
> 
> @@ -2532,6 +2533,12 @@ static void __exit rproc_exit_panic(void)
> 
>  static int __init remoteproc_init(void)
>  {
> +       rproc_recovery_wq = alloc_workqueue("rproc_recovery_wq", WQ_UNBOUND
> |
> +                               WQ_HIGHPRI | WQ_FREEZABLE |
> WQ_CPU_INTENSIVE, 0);

Afaict this is not only a separate work queue, but a high priority, "cpu
intensive" work queue. Does that really represent the urgency of getting
the recovery under way?

Regards,
Bjorn

> +       if (!rproc_recovery_wq) {
> +               pr_err("creation of rproc_recovery_wq failed\n");
> +       }
> +
> 
> Thanks,
> Mukesh
