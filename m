Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB35C636CA
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:32:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D381610D2
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Jul 2021 05:32:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbhGUEvr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Jul 2021 00:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232586AbhGUEvg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Jul 2021 00:51:36 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12DBC061766
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:31:49 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id s11-20020a4ae48b0000b02902667598672bso305342oov.12
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 22:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=iRPUyrruWY5GwoLCx2fyzi5QyJrWlyLr3Fr1E55Ngd8=;
        b=EpcA5f3AHsurgT6qqruahYyDxEmLckPfsqTtDMJ1DaZ/LLtjF0nHZXQx4E7JyPuOpG
         q6DX0VFKM7uI5ak8eqMnjYLd8bJMW8O3hHh4wCy2DDZcovcVqUYBPozeMaahUyk0L8jk
         H7QN+up8rw+cRxD5LV1c0A5sNEdBRJIsm6c2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=iRPUyrruWY5GwoLCx2fyzi5QyJrWlyLr3Fr1E55Ngd8=;
        b=R6NZoma8fo0GPS9FhiV/eiFHMDgww6SxlrpfEhGy2UkxpK8x/tSL3NElyIuUBCJa+1
         xeYMvMQuUWYpS67/QP2gncA3WYNq6be917R9YdNk0PJP2LfIxp0PVkDosWFxAfIn7rh7
         mBpvlHMNkSi3pPearY/GMOM7E3rOuF1KeprPkgCgmx0K7+LNJKA5RkpnBbTZ3EJa23+3
         cfztJGp1NBE8qsCp5XoTYPV5DSl0W13kgp3Abt+bPY+86bpFy8MhyOrWMaZqohDsFz48
         V1gjejC7M85ssA0qBtz5hXe7kT+8ApoOVCpNtjnfiTsyinU6OetR6DWN0Dy1qaPTA574
         Z6bA==
X-Gm-Message-State: AOAM533oG/xfaGOHRLHIKFzHf2KvWeg0kt2H8Y8jLzApQQZbPv6H9igi
        UXzZSbBVI2OI599VyuSFHEd2zWlSD2RxbPdnmE2aCQ==
X-Google-Smtp-Source: ABdhPJxEN4rB7s7W8R+0MjeKeH9tRLHXIQkKLHUFOBtwz9Bh4/yLDdVVegY5XDhlBibHzB6n0GbWiPdws64KBoYnmQU=
X-Received: by 2002:a4a:e206:: with SMTP id b6mr23349411oot.16.1626845509094;
 Tue, 20 Jul 2021 22:31:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:31:48 +0000
MIME-Version: 1.0
In-Reply-To: <1626755807-11865-2-git-send-email-sibis@codeaurora.org>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org> <1626755807-11865-2-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 21 Jul 2021 05:31:48 +0000
Message-ID: <CAE-0n51G-gYm=yjkF_rzCRFmhCVhxws-FtgGNbtetrJZHJwU-A@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] dt-bindings: soc: qcom: aoss: Drop the load
 state power-domain
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2021-07-19 21:36:35)
> The power-domains exposed by AOSS QMP node are used to notify the Always
> on Subsystem (AOSS) that a particular co-processor is up/down. These
> co-processors enter low-power modes independent to that of the application
> processor and their states are expected to remain unaltered across system
> suspend/resume cycles. To achieve this behavior let's drop the load
> power-domain and replace them with generic qmp_send interface instead.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
