Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5063AC63798
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Nov 2020 03:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18BD52151B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Nov 2020 03:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mv7jqd2j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgKWDDV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 22 Nov 2020 22:03:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgKWDDV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 22 Nov 2020 22:03:21 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBA8C0613CF
        for <linux-remoteproc@vger.kernel.org>; Sun, 22 Nov 2020 19:03:21 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id m9so16524466iox.10
        for <linux-remoteproc@vger.kernel.org>; Sun, 22 Nov 2020 19:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cmZ2kkoeLoaVXWsbBzaDLLnsyKzK7HyWpB00+aI5R04=;
        b=mv7jqd2joqZTqXkI4wFOSBKjG7mjGzwc8NaV90PMqDA/DN8tf+ynMKFWkB0YE5Xdtu
         XwDb7MsRyYVJ31vIHzOxIdkKAuYop1oDNg2T3wdLwpn4t3bR4jiFCzi50pZH4CDb614G
         Qr/UNiKI8pabdnGpSCMyBP7x4BVvwNOw2GpgtWJlxyNdFWg5QGJtwz0saIFfU/EKpiI2
         4m7tBqqLiuDTB7I2VMH4Px+fD09edrqypQCe2O4OFa8Ko9EqMSOIsN5awSVLurciXmeh
         TBwObMWQGtRNet6CeLTeDRDEA11rp3RXV9fyts+WDXHvnjn7np2Y7SyikX1ABWRu6rii
         gBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cmZ2kkoeLoaVXWsbBzaDLLnsyKzK7HyWpB00+aI5R04=;
        b=oW12jQ6qbavOezDMMA4PlpWnqzHfFqhsScEJRmIyJF7xS7giyuUTZ4UoxNaC3qr0t6
         Y1zhvhU/ZuM/F02rWQRySTBhXunCqvNm7oNC95BmcvBZgEAGC9dEUDW8nZERquIMP2Q0
         lHQji04Y1NlqJoHxKKMNFOUpF6uaVIM3Vy2R2+QsZ6spi+OSAfVzOfMi8YklIwqcxFYU
         eKDd6mT9yVP9w10jP8HIa9mzN3mCd6R0OXhv3sZi4rEdFO5Ae9+f8Vyw0fSx0n1CeVez
         vjdsvmucZ9nOJhuTvt6LpcK9kPfmpoSbGCfmQfLckShDTRE4/OhEFjiy2xHTFq0N1qMs
         uwNA==
X-Gm-Message-State: AOAM533HDFqy967owANrH/6rFUJisA7ZocrS+xd1hTJiQp+i8tirmiKN
        DAqre9jdc15PJABna0mIy51e2cZ8+PdHK8qDDW3dkg==
X-Google-Smtp-Source: ABdhPJwptrKso09cemQUc5m/nxPNPk7xqo4MYznakzCuHAhqaRV7MRIz8vyAnBx+NtiZFKXMuZapIY5faME+27pSUxI=
X-Received: by 2002:a02:5e45:: with SMTP id h66mr10874397jab.126.1606100600165;
 Sun, 22 Nov 2020 19:03:20 -0800 (PST)
MIME-Version: 1.0
References: <20201116084413.3312631-1-tzungbi@google.com> <20201116084413.3312631-4-tzungbi@google.com>
 <20201120235020.GI4137289@xps15>
In-Reply-To: <20201120235020.GI4137289@xps15>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Mon, 23 Nov 2020 11:03:09 +0800
Message-ID: <CA+Px+wXor-iCk98JfSx8pph10=WdkjGRNacY-FBGAX3xh9x71g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc/mediatek: read IPI buffer offset from FW
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Nov 21, 2020 at 7:50 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Here you are breaking all the current implementation with a firmware image that
> doesn't have a .ipi_buffer section name.  I'm not against this change but you need
> to make sure you don't break anything else with your changes.

Thanks for your review.  And yes, this change could break MTK SCP when
working with legacy firmware.  We'll make sure the new firmware in
MT8183 also contains the .ipi_buffer section to not really break
anything.
