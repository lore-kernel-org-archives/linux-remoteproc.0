Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1662FC4361B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 17:10:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7C73230FC
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Dec 2020 17:10:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392503AbgLJRKu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 10 Dec 2020 12:10:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388961AbgLJRKs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 10 Dec 2020 12:10:48 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B37AC061793
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Dec 2020 09:10:08 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id 81so6248204ioc.13
        for <linux-remoteproc@vger.kernel.org>; Thu, 10 Dec 2020 09:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LxPYeFbmqiuc8YA5Ewflum7dVJyQs2NXh77VNKbBmOM=;
        b=v1jIJoQcl/nZjj7VeslgzSbPEzPrPrpFYskI6k4MY4HvHzJ+ddNDapCNvjEIutnYso
         DDafuUSxPIIneMf6RMKne4ZyrTGWx3GzT0q915nWx7n/MgAXMFyw9wW5yur6IOFbDAuR
         JdOihPS0URrzgXnlRBdougkyG3UnzLS3PxunUjzmKF5Qk6vCkTSnC5YgvoA1VuvLYmU+
         EioZtjRr1VDBtTJr6eAHY3sQnRfS7GWZNSUUMxvEy5elh8yeO/aMR8/SJ3fq8F/iavO6
         pfWyhgXLMwUuztpBXrtVHp2PvsPAgN/r/43s+f9zW2I5olrgwFcIuPfxPza+P8QgOBn5
         rpmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LxPYeFbmqiuc8YA5Ewflum7dVJyQs2NXh77VNKbBmOM=;
        b=E5WIr9CE92G8ym2II47CCJJtvqeWfDYRwjNFr0NuCR2LG4w55D0eUuCRBHml1Peqrc
         xAsqshjnpZKz4MWeBFR8gm7fmPP5xG9rYUoPGI45NIPA4I2KTCKczrWAmPkU9VnLOMSS
         z/RjNxiB7FW+6Ku689WAsNT2W4OneVto2CvkXrw70SZHdL6kwPxEurwuXHdoEQ3RdJPj
         D0+x5T2mZO8pg6mag10pl89zrMiYFBA4viqBM6i5z/SfgG2kQlJa8F/G1m38RTbEKkRK
         Qxy9v71q/AyJippqB/L78fF187KlYMAyWMAF2pVqLZozLRYLjmFN5Xyba34jYx1aDzSW
         tH0g==
X-Gm-Message-State: AOAM530JhkMzfReGh5oSVjjJFSMHlVmbNnVVn1Rj57Ue+oq3LdAUxwfK
        9ZGEoE5gO4BGkh55gWRfnafBTWDzigaH99EOaHrwN5dTszrGHgJF
X-Google-Smtp-Source: ABdhPJzvyOr9T1Y9nDhO6Wi5DNHo43qFzMIfvoy29vbI3YPba6rqc1w50ZEtvjhH0ZxsJuQ/N/YKMQDED5PmGh42h/Y=
X-Received: by 2002:a05:6602:2d49:: with SMTP id d9mr9126517iow.109.1607620207280;
 Thu, 10 Dec 2020 09:10:07 -0800 (PST)
MIME-Version: 1.0
References: <20201210054109.587795-1-tzungbi@google.com> <X9JUmRarnxPaXtrZ@builder.lan>
In-Reply-To: <X9JUmRarnxPaXtrZ@builder.lan>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 11 Dec 2020 01:09:56 +0800
Message-ID: <CA+Px+wUqWh+_B6rQ1kyZRALF9r-HE8ZWpgt0c9B6doxRXLZ+9g@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/mediatek: change MT8192 CFG register base
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Dec 11, 2020 at 1:02 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 09 Dec 23:41 CST 2020, Tzung-Bi Shih wrote:
>
> > The correct MT8192 CFG register base is 0x20000 off.  Changes the
> > registers accordingly.
> >
> > Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
> > Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
>
> I presume there's an associated DT change with this?
>
> I'm okay with taking this, but would like to have Matthias ack on the
> fact that we're breaking backwards compatibility with older DTS.
>
> (Or I could ack this and Matthias can take it together with the DT
> change, to reduce the breakage gap in the git history?)

Yes, it has associated DT changes.  But the board "MT8192 SCP" is
still under development, the DTS part hasn't been sent to upstream
yet.

Thus, it won't break anyone else.
