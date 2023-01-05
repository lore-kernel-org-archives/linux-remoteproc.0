Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F3BC53210
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Jan 2023 03:01:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbjAEDBE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Jan 2023 22:01:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbjAEDAe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Jan 2023 22:00:34 -0500
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9907E48810
        for <linux-remoteproc@vger.kernel.org>; Wed,  4 Jan 2023 19:00:33 -0800 (PST)
Received: by mail-vk1-xa2b.google.com with SMTP id v81so17643445vkv.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Jan 2023 19:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wXPv40UKiN0pdjRRG3IPp8PXZI0C6Sv6kiLqHzLCQIs=;
        b=Tfo7xSTMp3ZHBuKhEdl6YQmRWSu9evEhRA9jVD+XEmZAmX3OhILMv6/tagqg5JrWyJ
         O27AQX6qVsvvx/aztU+FHrYmR+DDWnZD4lWiXg21skl/w2F3cMa1s5PhiEFOum8ACThm
         bpho+D4ObOmG3/lykf3rbUDD+0e+0muT1Zxpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXPv40UKiN0pdjRRG3IPp8PXZI0C6Sv6kiLqHzLCQIs=;
        b=b+q9j/y4kFpGm3EFwEH5VNDmpaZq/51fMqS9x68CwA6ZGA1hA7xth8eB5aHIRA1x2s
         bASbEl3i58Xp8jnb5sKHT7e4zRTJ1G5YxX/+T0TsmypNqQ3YrAsuQVL8suhm69h4z2VD
         C7ckZa8R48vQ89L/u9SQR59vgxwC691iygwgib/PtYeJFlSZsEXQr/rTuzDJzRtgScWB
         wUP62phkIBK7o520XXhh0jKwgU8GQxA0iwnsgrlZm4Nd8y0TK4QkgbPEycegXpmCTkud
         a1DDZ/rzoU6XmHWsYTtqxmQuCQksRFu+26JgCTHlLHvssZ2z7gwQeUuM4+IwHLgpr/s7
         sqPQ==
X-Gm-Message-State: AFqh2kp7GA97RNLOIqmxbVz/sQ2tiJEmYj7tn10G+XQ37UihQqmWjcSF
        AexEEV7w58X+Ouc3CBz9xpkRHPxsX+wcjLnpdWYigg==
X-Google-Smtp-Source: AMrXdXv0eISHRGoQ1TN64WNdAr9dqLbmh2OyMms0GAzinCpYIPmx7WL0T/abKXd9uqh1oh8lQogUYj5HtSiUBb7k+Cc=
X-Received: by 2002:a1f:df84:0:b0:3d5:9e3a:538 with SMTP id
 w126-20020a1fdf84000000b003d59e3a0538mr2154545vkg.22.1672887632729; Wed, 04
 Jan 2023 19:00:32 -0800 (PST)
MIME-Version: 1.0
References: <20230104083110.736377-1-wenst@chromium.org> <20230104222213.GB2112402@p14s>
In-Reply-To: <20230104222213.GB2112402@p14s>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 5 Jan 2023 11:00:21 +0800
Message-ID: <CAGXv+5Fh13ciPjrfK2F89QJavePHcBwMwThSALxEF+5CUdA_Yg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/mtk_scp: Move clk ops outside send_lock
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Jan 5, 2023 at 6:22 AM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Jan 04, 2023 at 04:31:10PM +0800, Chen-Yu Tsai wrote:
> > Clocks are properly reference counted and do not need to be inside the
> > lock range.
> >
> > Right now this triggers a false-positive lockdep warning on MT8192 based
> > Chromebooks, through a combination of mtk-scp that has a cros-ec-rpmsg
> > sub-device, the (actual) cros-ec I2C adapter registration, I2C client
> > (not on cros-ec) probe doing i2c transfers and enabling clocks.
> >
> > This is a false positive because the cros-ec-rpmsg under mtk-scp does
> > not have an I2C adapter, and also each I2C adapter and cros-ec instance
> > have their own mutex.
> >
> > Move the clk operations outside of the send_lock range.
>
> Thanks for providing such a clear explanation - it makes my job a lot easier.
>
> >
> > Fixes: ("63c13d61eafe remoteproc/mediatek: add SCP support for mt8183")
>
> This is the wrong format for a "Fixes:" tag.  Please see
> Documentation/process/submitting-patches.rst for details.
>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> I have fixed the above and applied this patch.

Thanks, and sorry about the brain fart on my end.

ChenYu
