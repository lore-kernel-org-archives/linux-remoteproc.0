Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96277C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 22:56:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 782BB611BD
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 22:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237697AbhI0W6D (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 18:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237976AbhI0W6C (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 18:58:02 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69694C06176E
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 15:56:23 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id v17-20020a4ae051000000b002b5a56e3da3so2101505oos.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 15:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lLTtH4hZnMTDUXtG8QKxhCYz72VTXTnMX/KxhuwvS5Q=;
        b=uSFwX0imDyQ63j6benweN26xLl88rv6aO4w9SDKy+32Il6TonkY97iPFgESmGgvDHu
         StUokDsNrre8uRActn1E2d6IOWtSPKdESbrgwo7RMNY9ot/RnkmKFwQof3RdRqX9/2a3
         2amS4vBugNgpjTwyJ1tpq9I5IQKOTsGCzqIb3MZHY7u6yJ7B0bZq9wHdEEFQoWYi9fq6
         1lETN6nU0fSETrM3DOhRni2I3VpFJpu0EAH7fYNS5XY+Db0WlpJQkfFDMnjzMp+i/phY
         yoI2CVKMKYeDNNVfPNEkcTtAUSVevWmdJnRvBVyStMQRJRKmQhHIBqcQbp8YziHoTgQn
         BiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lLTtH4hZnMTDUXtG8QKxhCYz72VTXTnMX/KxhuwvS5Q=;
        b=JPDeEfojJM6doabYc4oZl5KpluEZhIiSMIqCn1/+e5+Tgxs1qaW41+qqGcmRXjWVcx
         9DwjzR9yoMC6tMtZRUpX8YfAjG8fTePT9ZGwpBMO3rnG2hoV6eGPlh77yjxUnmASmD6P
         F+YVmzCNgiqC9EbjdFi3oRNiYnJ0BorBaicDH5hKFvNXcBhbYzPY1BHm3anC/aAmoONy
         N2sJd4ZBus3WxlOqbPWesPnpuYZn2m+qEtzOMmyEURRyuePWSG8Lz4Q8JLm26UIsTriJ
         HsdRHZdJysAeT5LcXLd+/cRI4JxtSqHkp93PtUREPV9gZ2qA44H7YqestLEzCZea/Jnk
         3snQ==
X-Gm-Message-State: AOAM5316dr7PkoUROMb5LB/t3Lh7ERXF3ljbaMeCKnqstUuvu90zwKn+
        mxBYS4Ms/OX02NlUEbjEXd4v8A==
X-Google-Smtp-Source: ABdhPJxN9pDoeXMNZfAHDNKwyo6/0etpQuQQZlma4UN8UEzcOHf2GLratD2IucJK8My0eqs6iqiiLw==
X-Received: by 2002:a4a:ded2:: with SMTP id w18mr2103037oou.77.1632783382762;
        Mon, 27 Sep 2021 15:56:22 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w184sm4231084oie.35.2021.09.27.15.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 15:56:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     robh+dt@kernel.org, mka@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, will@kernel.org,
        swboyd@chromium.org
Cc:     robin.murphy@arm.com, linux-kernel@vger.kernel.org,
        joro@8bytes.org, linux-arm-kernel@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        evgreen@chromium.org, dianders@chromium.org,
        p.zabel@pengutronix.de, mathieu.poirier@linaro.org,
        ohad@wizery.com, devicetree@vger.kernel.org, agross@kernel.org
Subject: Re: (subset) [PATCH v5 00/10] Add Modem support on SC7280 SoCs
Date:   Mon, 27 Sep 2021 17:56:16 -0500
Message-Id: <163278329751.1522839.17169491081318211175.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631886935-14691-1-git-send-email-sibis@codeaurora.org>
References: <1631886935-14691-1-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 17 Sep 2021 19:25:25 +0530, Sibi Sankar wrote:
> This patch series adds support for booting the Modem Q6 DSP found on
> Qualcomm's SC7280 SoCs.
> 
> Depends on:
> qmp_send: https://patchwork.kernel.org/project/linux-arm-msm/cover/1630420228-31075-1-git-send-email-deesin@codeaurora.org/
> rproc qmp: https://patchwork.kernel.org/project/linux-arm-msm/cover/1631800770-371-1-git-send-email-sibis@codeaurora.org/
> 
> [...]

Applied, thanks!

[06/10] arm64: dts: qcom: sc7280: Update reserved memory map
        commit: eca7d3a366b3ab9f31e142c13a43c5b0f94a920d
[07/10] arm64: dts: qcom: sc7280: Add/Delete/Update reserved memory nodes
        commit: f83146890172da67443c7b80e529fd1781046c65
[08/10] arm64: dts: qcom: sc7280: Add nodes to boot modem
        commit: dddf4b0621d61b8203d500ef85a853626ff42432
[09/10] arm64: dts: qcom: sc7280: Add Q6V5 MSS node
        commit: 4882cafb99c2b004b9773631fb00ca6d96dc0124
[10/10] arm64: dts: qcom: sc7280: Update Q6V5 MSS node
        commit: 0025fac17b313cca5c640dd57cbf38d01ce10b27

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
