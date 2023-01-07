Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC64EC678D6
	for <linux-remoteproc@archiver.kernel.org>; Sat,  7 Jan 2023 22:07:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbjAGWHm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 7 Jan 2023 17:07:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232675AbjAGWHj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 7 Jan 2023 17:07:39 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D45393DBEF
        for <linux-remoteproc@vger.kernel.org>; Sat,  7 Jan 2023 14:07:36 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-4a263c4ddbaso67842807b3.0
        for <linux-remoteproc@vger.kernel.org>; Sat, 07 Jan 2023 14:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=elw7qXq3jOpumA43FBwxV0SpG8sodKmSNxzQDO4jMU4=;
        b=z5qLcx4Rda0EtjxiYKuYQ80g5u8WAO2qP8Hj2jA2dlyrCxO2m/mW9wx6mgDu3+vA24
         HPng71YXsusAW/mLho5cPdBVVmb0ujAWkhnG2mNk/YhegetEM8ABzRuq28HdKe2z4nAK
         CfWgvapRGzrFiACUnvZ8Lzuw+42+my7tTsZPRuYRzjZAa0arYqcicKMSZXaLhrCiZ594
         kZkAuecAYkx3nKb2HvBo5NCopVl+MteBZS8SAqqKXS6D32h6XAqG2gQWRxgZq6fv1FCT
         5nB8rcwgPDo1/oVUc205jKK8A5YBrtg8QGinKH34pDeG0Gciw9xs4b6OLR2r5lfDv3HH
         hsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elw7qXq3jOpumA43FBwxV0SpG8sodKmSNxzQDO4jMU4=;
        b=5TuiM7o6wGQflX8Lc5eqcGMSCwtK2G6feyhD9seU4Z967JC+/faRAnBWuEq+zYi8pu
         OyFI1/nJ606o7Fn2O9lx24GvT2xz7/BzxwaZlp1n33S8O+HnIm5BjuUjM31zA+eaem9m
         LboI/16B7mSxS59atshclKo7CsmdIGYiHgkpedsFqQEWz5Kn+u6vJCRrjbKQFZUdtP+U
         ly2qakud3YoeurHr5nGwGmS2qtIXEZDzH7GabG/yA9kOJFhyrExCtR2WpFa0HP2EyP+0
         Qv9zvPfViXzbYgzpjkaoCMOfBLCwshR8uqPvQq7guryJlNsoRDySAdpHmBUOlNfS548i
         QgsQ==
X-Gm-Message-State: AFqh2kpr67WEVTGs6wjwuBfkO6aIxqxikTs7i8zwmGXbmgO2Zm8bgysv
        uYT23io9GNmhhkQhP9qLrcamxjMSBm+T9QPIpG6RSg==
X-Google-Smtp-Source: AMrXdXvKV0OXLtA0FmnMOsCtGIAb7aEQlTUjBiU06PetpNO14N0IJBQJiS1NZOLiK4iCi8M79AQj1NQehnnW+E93Lsg=
X-Received: by 2002:a05:690c:fd5:b0:4a4:7135:9214 with SMTP id
 dg21-20020a05690c0fd500b004a471359214mr4049303ywb.378.1673129255954; Sat, 07
 Jan 2023 14:07:35 -0800 (PST)
MIME-Version: 1.0
References: <e0ced334-e6c1-caeb-322a-f67a23ee58da@linaro.org>
 <CAA8EJpr0A=VjWEv6NPaZ-t_3TgNaWpsVO8_inJhxqoThry_zZA@mail.gmail.com>
 <17e2d99d-31e5-b29a-e729-4f4d70b2efbc@linaro.org> <CAA8EJprcVT=vyEhU0Nbtr4Wu1YxcGs+NLNxtpTaFtaJSTqvgYw@mail.gmail.com>
 <3afcb445-7a62-ced7-eb54-1b2d8a9085ce@linaro.org>
In-Reply-To: <3afcb445-7a62-ced7-eb54-1b2d8a9085ce@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 8 Jan 2023 00:07:24 +0200
Message-ID: <CAA8EJpp8jnZV1Wkw1T6g95s0QNZLKKN_ve+tqmNsFVCFo0wudg@mail.gmail.com>
Subject: Re: Annoying message on the console for the db845c board
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        "agross@kernel.org" <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, 7 Jan 2023 at 21:01, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
>
> Hi Dmitry,
>
> thanks for your help
>
> On 07/01/2023 15:11, Dmitry Baryshkov wrote:
> > On Fri, 6 Jan 2023 at 22:08, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> >>
> >> On 06/01/2023 19:14, Dmitry Baryshkov wrote:
> >>> On Fri, 6 Jan 2023 at 18:37, Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> >>>>
> >>>>
> >>>> Hi all,
> >>>>
> >>>> Does anyone have an idea on how to fix these timeout messages ? They are
> >>>> displayed again and again every 5 seconds and that saturates the
> >>>> filesystem after awhile.
> >>>
> >>> Could you please check that you have CONFIG_QCOM_RMTFS_MEM enabled and
> >>> the rmtfs daemon running?
> >>> I think that's the usual cause of such messages.
> >>
> >> Yes, I have the option and the daemon running:
> >>
> >> zcat /proc/config.gz | grep CONFIG_QCOM_RMTFS_MEM
> >> CONFIG_QCOM_RMTFS_MEM=y
> >>
> >> ps -ef | grep rmtfs
> >> root      9888     1  2 20:07 ?        00:00:00 /usr/bin/rmtfs -r -P -s
> >
> > I don't seem to be able to reproduce it here. Could you please share
> > your kernel commit, .config and md5sums of
> > /lib/firmware/qcom/sdm845/m*
> >
> > Thank you.
>
> I have this message since I began to use the board, so v6.2-rc2 is the
> latest commit where the message appears.
>
> Here are the checksums:
>
> 5533fa7714fb3cce82e87f53ef176f2b  /lib/firmware/qcom/sdm845/mba.mbn

This doesn't correspond to the firmware I know. Could you please your
/lib/firmware to the firmware files we have released to the
linux-firmware archive?

[skipped the rest of md5sums]

I've tested the v6.2-rc1. With the firmware from linux-firmware I do
not see these message. I posted the output of savedefconfig for my
.config to https://pastebin.ubuntu.com/p/t4KzQ4QWSF/

Could you please recheck with this input? Maybe something is missing?

-- 
With best wishes
Dmitry
