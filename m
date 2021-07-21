Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2682C636CA
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:46:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8B0B61029
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:46:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbhGUFF3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Jul 2021 01:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbhGUFFR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Jul 2021 01:05:17 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEA2C0613DF
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:45:54 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id o72-20020a9d224e0000b02904bb9756274cso1062766ota.6
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=dNfcxQisjjJv5eOHz1IDkcy0UHigEE+DFspSgTRkRS0=;
        b=TmXoRy3h4S4nFy3pzooJOmvDq4Nlw9Mwyudp8nErttrXML7dj1of1i8ptfUEpePAQT
         n0d3VZwXzyngirIwAIGbg5mZjQtO+FgvZQUN0xjrx954BhzuklPhnurxjZmfa1Lv6MD1
         Kk57AEJ0JCSnu5rG3QYABH7B3tYUJj2rHBISw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=dNfcxQisjjJv5eOHz1IDkcy0UHigEE+DFspSgTRkRS0=;
        b=csGPJCUenHVOxKrJkctFxgYVFbpm7FEh8ZgHOuP1q2BrLInlglZ/eg3uMchyFFJHyO
         v3ou98iq4T9PJJ2klOg4H0Xj4T9aNkyNX8LARKhofyKVgp2nRwg+L8JkgvbA/Wqae1VV
         yLLI9tgyyeTaSOUhWNCLpzyhbcpi3orlt0FFYzSTyOuP3u1GrSKdFNzEa6GxhWuE5LSU
         mwlHP0oJ6WcLcNhEXGFdy/si6hU1cfOIZwGwvNGhuitgpAdQZ+pWvCLwgYC/vt3Z0jHV
         TwhiD67G7KoZbonSnDDSWsM6Nb4NdD1I+SJFXJMYWQZkXpE+YwVMGfh+e4u+CpLOC6v2
         SsDw==
X-Gm-Message-State: AOAM532lIjnu7jyDrZAXe/lncEaL1ASe27tQ2OzsSxiw6bwP/FOebucr
        sBVePYoSgmqxPQUsv7RrB28CMNTQeVKZEDz2dzTrhQ==
X-Google-Smtp-Source: ABdhPJwZnht3Kr2prR9o7Uwl1hUh3Rla9OGuKEOgfIbY2MFf609ZjI1kLJEbk8naHTyMzMVjSRkQgRiOyGVRCVR2GXo=
X-Received: by 2002:a9d:1b6e:: with SMTP id l101mr10056846otl.34.1626846354073;
 Tue, 20 Jul 2021 22:45:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:45:53 +0000
MIME-Version: 1.0
In-Reply-To: <1626775980-28637-10-git-send-email-sibis@codeaurora.org>
References: <1626775980-28637-1-git-send-email-sibis@codeaurora.org> <1626775980-28637-10-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:45:53 +0000
Message-ID: <CAE-0n528hftzM-JTv57k9P+Ac3M9Ug0PosFiCquzMQ=jNZ0H5Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] arm64: dts: qcom: sc7280: Add Q6V5 MSS node
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

Quoting Sibi Sankar (2021-07-20 03:12:59)
> This patch adds Q6V5 MSS PAS remoteproc node for SC7280 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
