Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61494C433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Feb 2021 17:18:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3714564E49
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Feb 2021 17:18:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238338AbhBDRRo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 Feb 2021 12:17:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:58304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237386AbhBDRRg (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 Feb 2021 12:17:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 105E864F6C;
        Thu,  4 Feb 2021 17:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612459016;
        bh=4kbkHi3GCFWdJhpe+j8dWP0W/1NJJRTee0nUBDLf2mo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iED3joqbBocU9a6ef8oA9mVPNBkQbg2r/kfDbGa7xVfngLbaT1NMsi9vv95A4vVZq
         plBf8KFtvbvsIeE3X2AFEDg+ORpsZxf7pH6wVDH21Wux6F0ivtXJaYayRtKruWUJLM
         FAAhsFzlbKVIncTMxm2LDK+gMM/M+vZy4riZ4fFIOEgBLEDBhgopnXRIg3B+FLbPFF
         dP89KEE3JSkheB6K76OaRMP4qqWRRTZZ/j2sF2gnceRUKKrER//4O94ehpINKFC/6X
         w1grjB3+G6MrIzrOIJY2u/gQ+AEkL2tK9I6+9r2MlDvxLqQeC0ogK1Im0D7eYuCnyV
         8X6/EaZHeBgbQ==
Received: by mail-oi1-f172.google.com with SMTP id k25so4418817oik.13;
        Thu, 04 Feb 2021 09:16:56 -0800 (PST)
X-Gm-Message-State: AOAM532qmyA4KyTf1MVm8JGAMyHJaaMSMXdtjQoR+kyRjc4xWAvtYq39
        r5FOcfkrd5fMs50X3RYd+eRjzutYXSYnRiV9JQQ=
X-Google-Smtp-Source: ABdhPJzAbjseVdNh18mnAtJHEELLf6BF1925L/wgaNknmBjsPi1sa7VLaU0BTWl/yJC2jjuXCj2czRVNZF5+NW5Y4po=
X-Received: by 2002:aca:d908:: with SMTP id q8mr300430oig.67.1612459015329;
 Thu, 04 Feb 2021 09:16:55 -0800 (PST)
MIME-Version: 1.0
References: <20210204154010.1585457-1-arnd@kernel.org> <c326e5c8-e394-88bc-24f4-4dd8e246db3c@linaro.org>
In-Reply-To: <c326e5c8-e394-88bc-24f4-4dd8e246db3c@linaro.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 4 Feb 2021 18:16:38 +0100
X-Gmail-Original-Message-ID: <CAK8P3a24WPVX3t4_X=muLfYUXtK6UOOHATrLQT3y_tWSb2XYrQ@mail.gmail.com>
Message-ID: <CAK8P3a24WPVX3t4_X=muLfYUXtK6UOOHATrLQT3y_tWSb2XYrQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom: fix glink dependencies
To:     Alex Elder <elder@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <clew@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Arnd Bergmann <arnd@arndb.de>, Suman Anna <s-anna@ti.com>,
        "Andrew F. Davis" <afd@ti.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Colin Ian King <colin.king@canonical.com>,
        linux-remoteproc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Feb 4, 2021 at 5:16 PM Alex Elder <elder@linaro.org> wrote:
>
> On 2/4/21 9:40 AM, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Building the remoteproc drivers into the kernel while the qcom_glink
> > code is in a loadable module results in a link error:
> >
> > ld.lld: error: undefined symbol: qcom_glink_ssr_notify
> >>>> referenced by vmlinux.o:(glink_subdev_unprepare)
> >
> > Add a Kconfig dependency to avoid this.
>
> So if they're incompatible in that way it's declared in the
> header but not defined in the kernel so the link fails.
>
> And at issue is anything that calls qcom_add_glink_subdev(),
> which is qcom_q6v5_{adsp,mss,pas,wcss}.c, and those are
> selected by CONFIG_QCOM_Q6V5_{ADSP,MSS,PAS,WCSS}.
>
> But I don't see why QCOM_WCNSS_PIL needs the dependency.
>
> Can you explain that?  Other that that this looks good
> to me (and I'll offer reviewed-by with your response).

The problem is that QCOM_WCNSS_PIL selects
QCOM_RPROC_COMMON, so qcom_common.o is built-in
whenever QCOM_WCNSS_PIL=y, and this will lead to the
same link failure, regardless of whether the function is needed
or not.

       Arnd
