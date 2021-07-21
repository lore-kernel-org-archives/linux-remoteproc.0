Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A4CC07E9B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:43:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A30186101E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:43:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232930AbhGUFCn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Jul 2021 01:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233144AbhGUFCf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Jul 2021 01:02:35 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AED8BC061768
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:43:07 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id y66so1726486oie.7
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hf6xnyfDVscdnIm8e7vP+O/z70LiWfZSeXYc2Hpl7+w=;
        b=E4800xZKn+NlHsQnmsuVG/meEmTucGlq57gF16OMqcSd0n/WDSZI8WYMQlLDYud2c1
         UksJe1i6LAR0beBLUSWnB5wf6wGMss2ET70L3tJdVp3fy97KNRxmvxLbYrhW15SE21WZ
         QxMBzZyP0628qUAMQAeGRAXdBPxyvpwEY8rHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hf6xnyfDVscdnIm8e7vP+O/z70LiWfZSeXYc2Hpl7+w=;
        b=B05hT8XuedbW5zP2F4jKuo2bJ/GVtzFYBL77KvnAmQu9q2GPI0uUR4yDRnQEHu+tz4
         J8Uv9DduB/XM5ipvCMuhrgGR9qT5D1yVJUznEzMf6kMVLXGa+qW1V7Rr3mJpfBow2nkc
         8Dp+S9YAMnci8ckruwr1F4KCvMHjGwaZUE1huv1gxOZVlhDoiVG1TCW/4SUBAvY/9Wo0
         NdBLz3a6sOY2HsM0kUmM32aNOSXvMnsjg7o0Omp1VFT/wXYNd9vbylod9tVHgCDmeC3v
         mx6rW83VTDuAwMrLEv36KsZ5ZmWmUPF1skAWwKmDls8H717y10PgB4Taqa78CaplvB92
         5E9g==
X-Gm-Message-State: AOAM531PccLWvMrPGAFuo95vQLPiI+kWxMZ/ky/jlBj4x+HBwAqp5a04
        h8SlTSZuZdTe5JH/TPEwSQN1JbdiGAO7WHT0zVjtlg==
X-Google-Smtp-Source: ABdhPJyhZM62w2HxLyrWYJERIKW0NCE7R9SVmmZHO4rQTZuOycq38dOFGmHxqXcA6yNvQkyQaqSc8x7Mz3BzfO4EovI=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr1525356oib.166.1626846187144;
 Tue, 20 Jul 2021 22:43:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:43:06 +0000
MIME-Version: 1.0
In-Reply-To: <1626775980-28637-8-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org> <1626775980-28637-8-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:43:06 +0000
Message-ID: <CAE-0n53We+CzBFpzdN7pGgrjqeALmJO4dgHVtc0JVQw+Jw+u+g@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: sc7280: Add/Delete/Update
 reserved memory nodes
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-07-20 03:12:57)
> Add, delete and update platform specific reserved memory nodes.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
