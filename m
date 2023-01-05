Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBE3C5479D
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Jan 2023 09:04:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbjAEJEW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Jan 2023 04:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbjAEJDr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Jan 2023 04:03:47 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D434C50E7A
        for <linux-remoteproc@vger.kernel.org>; Thu,  5 Jan 2023 01:03:33 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id a64so33989923vsc.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Jan 2023 01:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bq6fbrm89Wj505hes5KkebMmopf15cqL74ic5xUS4cE=;
        b=aPoc/z738CDp+KaBXVHqKE1NJZKoDra2i+6EHl9mUA3mxfsljgABCG68ysGZnNPiD8
         ycH86LyVMdaImb3lcVJBoy23vImWTnjOqVgv6yrVXbOBLEs+16ZtF6d4ejKLSE5dETlt
         CS423HZshmzYe4YKkxuw3y2g5Lu7dSiYSTVno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq6fbrm89Wj505hes5KkebMmopf15cqL74ic5xUS4cE=;
        b=J0CFtNJA296VZsd22s6fD2z0p8Iz6pNkaejufYQEIjVSIDJNHQZgYxBQ2e0LNVp+iT
         leedXJVgqePyjysrlS4oE9eOCJhyBQaERbxeBSMQB1Jls/lDR/wd7c9MjNMpM+w1Z62E
         LHPNpYQs/eFwsMqoG1Ypb3zHNtjwRKScHvVBeHvIw7NJ4uXHVLLxG7Fptd50BKrtSUrm
         /Y7pNqlMTirv2rhCsyYxn3DG2LFU+3oHo/DiQNANC75ZF0h1ZOTNFs6+lalRyifZ0P4N
         DIgL592qwJj9IUYm4xjrq61YFbtkO8Pn97683RtI5ldTEHcFpmUYDDmHnuLHpjb9uDzO
         Wnvg==
X-Gm-Message-State: AFqh2kqXiB8XcbqTEfcoVXPufo+xaJWc/vLbbO2T+AsPqT+ZF6pq9Qia
        +XjQpbSYOGTrjKPJCU2LiSA4EvygIQBU801TGqkNdaRz++QcUw==
X-Google-Smtp-Source: AMrXdXuwCTR2fGOnMCsRQriJ+OQnC29RZ3V9tgnKJfLzj3aPE/ztb1euD+ZmDTzJF3h82BlYIZgmzUbg8fFoBOfJikI=
X-Received: by 2002:a67:c514:0:b0:3ce:b8eb:717e with SMTP id
 e20-20020a67c514000000b003ceb8eb717emr491817vsk.26.1672909412991; Thu, 05 Jan
 2023 01:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20230104083110.736377-1-wenst@chromium.org>
In-Reply-To: <20230104083110.736377-1-wenst@chromium.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 5 Jan 2023 17:03:21 +0800
Message-ID: <CAGXv+5FSc4H5QtMTZP7jj+SjDcU2u024cPm9LEAdT3oUoBusNg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/mtk_scp: Move clk ops outside send_lock
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Tzung-Bi Shih <tzungbi@kernel.org>,
        Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Jan 4, 2023 at 4:31 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Clocks are properly reference counted and do not need to be inside the
> lock range.
>
> Right now this triggers a false-positive lockdep warning on MT8192 based
> Chromebooks, through a combination of mtk-scp that has a cros-ec-rpmsg
> sub-device, the (actual) cros-ec I2C adapter registration, I2C client
> (not on cros-ec) probe doing i2c transfers and enabling clocks.
>
> This is a false positive because the cros-ec-rpmsg under mtk-scp does
> not have an I2C adapter, and also each I2C adapter and cros-ec instance
> have their own mutex.
>
> Move the clk operations outside of the send_lock range.

Well this managed to untangle the lockdep warning a bit, but it still
appears. I'll keep looking into it.
