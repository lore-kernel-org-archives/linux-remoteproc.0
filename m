Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4AFC4338F
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 20:12:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DEA760F21
	for <linux-remoteproc@archiver.kernel.org>; Mon, 23 Aug 2021 20:12:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232016AbhHWUNN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 23 Aug 2021 16:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbhHWUNN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 23 Aug 2021 16:13:13 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B18DC061760
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 13:12:30 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id a20-20020a0568300b9400b0051b8ca82dfcso18686470otv.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Aug 2021 13:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=T3aLvLM2O4rTIM/hjwo8wxmi8jVUyEo5mZNqWnT5ijY=;
        b=e1/0WKjkx0NykdS0E7ZS6i5F7KoKFeO4wVRqf5mSbmfGF8/WfgWljKL6ReGfK7QPlC
         beYVj1wM0v1kA2jsJVVxmkRSUdn1OXhBF4QqG/Hgjz9AKU37aD3Dds157c20Y6rgKnrJ
         dcMoVqDS8LbGJdD6ivm+ewh1+CNoEOE+IsxP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=T3aLvLM2O4rTIM/hjwo8wxmi8jVUyEo5mZNqWnT5ijY=;
        b=aG+RDPc1rRWHEcAIAnDOVCG8Y5lALBkXSxGaWKx7YsJD+hZMjw5K8CNWXyPxRfdRb4
         86/URu6N9pHSkPR6AgN9rwTLf58eDAKVAzh6Vjsd4nCvkXgAplXxpGUrIqavldYAX/A5
         dxeVuEOPS5jxX8AqF/WIP3+MCp0ATVITzMXKk7bg/9dmb2UG0BzNXYuopKcdjf+eOZ4z
         ztO5ZbsHCc6tN/KUX5wxgKfz4kuNSaRvxzGSKAiXIHYF6x0XPB4tW9A/InK1AEqQ70FH
         pUIlfzKIgZVHQlXj6W8RbiXDkI5n+7EmW4JH9eruwQ/XZPNJ+Oa1NaMRajASYkFIljEp
         kjUg==
X-Gm-Message-State: AOAM532dGX8CYmFwnB7sfP5TE2tUgVhvmqP2bHAiKc9FF6CKkbeGazFP
        8RjTf7tYpA0jmkJW+k4t4ff3hSdGhzhqxlqtDPey3g==
X-Google-Smtp-Source: ABdhPJySqRjAf/fO69VpPpmTzzfi1BHc2sBeUb9FRXviv5jmRZgBthGWPGOLVPJdXs2cJXP/7osKwD86QLe/a/8ZVJg=
X-Received: by 2002:a05:6830:2473:: with SMTP id x51mr22290941otr.34.1629749549652;
 Mon, 23 Aug 2021 13:12:29 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Aug 2021 15:12:29 -0500
MIME-Version: 1.0
In-Reply-To: <1629344185-27368-9-git-send-email-sibis@codeaurora.org>
References: <1629344185-27368-1-git-send-email-sibis@codeaurora.org> <1629344185-27368-9-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 23 Aug 2021 15:12:29 -0500
Message-ID: <CAE-0n50g=tKv7dmRKPZsOsT8ezTOXK2MmCxPo4hT5vek8KYc2w@mail.gmail.com>
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: sc7280: Add nodes to boot modem
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

Quoting Sibi Sankar (2021-08-18 20:36:23)
> Add miscellaneous nodes to boot the modem and support post-mortem debug
> on SC7280 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
