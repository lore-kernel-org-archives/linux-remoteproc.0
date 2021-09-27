Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C485C4321E
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 23:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87F72611C5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 23:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238203AbhI0XPi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 19:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238144AbhI0XPg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 19:15:36 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35803C061575
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 16:13:58 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so20917534otb.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 16:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fGTt2hnfWiF6e7IYGzXXWDUKyh0sx2hrjsxfMx+frmk=;
        b=bqDgmGGkGcNjFJyVl93eWsMtetWorm4Y5NpIDD6z8sKlV/AAZrMxEToHIVeiAlqoUU
         8lGHMB6zWrpHjYLEc//Ur49ue1GQJZP8598jcs8uv/Z1kjtDy7F7vnoXotv0GVTm8Hbg
         7Dy9FL84QNA8O7IAnoDeoVRF6TOcvW5MAdRSw0x3TFR9xgzPo7uYXKIv9dlmO+vXQeol
         RBWH7ccRfEyk62GSNtMDKcqt5eNr/S0KhH8NMc9jfGWBWrA9OWFTyO2cJL/Y0cFFwl6U
         CurhskZAxcY+Vdg3jiIkwyaB+brt0wgenOr+9hKNIGZpwcfEDabnKXs/0DQWuyAGlBu5
         AKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fGTt2hnfWiF6e7IYGzXXWDUKyh0sx2hrjsxfMx+frmk=;
        b=FK/DuwXZp6owenK9Wpu1rwUSotYLqq7AzCjXpmny1vqluXcyZ3mqdoQzUQ1VpNjMGw
         Ox6wVOlFPWKUMyk8e/N1VdY/YmWRJpN/Jp4lcyLLddQkGmQFAW8rrgNawapFTXtcriJr
         6WcO5KwqqSEdLKpDnHSlsNKBM9s4DmjRSEnnTmVK7eT/Cga5E/w/4iJ+6xqUteCU3Aat
         KXc9IMPrPdWxfPcKJE9VBAyCnmHnCRbSTIf5m4eEmLY/RohFfz9OY4bondi6kHTtPYKv
         XGuqL3L3yx9d48x829EzGV4J/0OjaxdQy5oc7ykdBQGL0SQ2FfYU+5K6mNOkv0OPkeRO
         MrPA==
X-Gm-Message-State: AOAM530KCYd5wXZPEp6lZ577iQ0QAJ8gcKSty6NvO7jVepvJKGGFXr51
        3WpTL2KwinzU+Xzi1MylX6JDv21L7xjZ8w==
X-Google-Smtp-Source: ABdhPJwHC7Lr7HpBuR21ixlUXCwVbpfVNFO9RX/rYG9B2yRCe1NnnWqO5rDMMr1PT1LNN01H2Inukw==
X-Received: by 2002:a9d:6347:: with SMTP id y7mr2206399otk.241.1632784437605;
        Mon, 27 Sep 2021 16:13:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p21sm4162268oip.28.2021.09.27.16.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 16:13:57 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     robh+dt@kernel.org, mka@chromium.org, will@kernel.org,
        Sibi Sankar <sibis@codeaurora.org>, swboyd@chromium.org,
        saiprakash.ranjan@codeaurora.org
Cc:     evgreen@chromium.org, linux-remoteproc@vger.kernel.org,
        robin.murphy@arm.com, linux-kernel@vger.kernel.org,
        joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        devicetree@vger.kernel.org, dianders@chromium.org, ohad@wizery.com,
        mathieu.poirier@linaro.org
Subject: Re: (subset) [PATCH v5 05/10] remoteproc: mss: q6v5-mss: Add modem support on SC7280
Date:   Mon, 27 Sep 2021 18:13:52 -0500
Message-Id: <163278440375.1524647.12772375211634032908.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631886935-14691-6-git-send-email-sibis@codeaurora.org>
References: <1631886935-14691-1-git-send-email-sibis@codeaurora.org> <1631886935-14691-6-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 17 Sep 2021 19:25:30 +0530, Sibi Sankar wrote:
> Add out of reset sequence support for modem sub-system on SC7280 SoCs.
> It requires access to an additional set of qaccept registers, external
> power/clk control registers and halt vq6 register to put the modem back
> into reset.
> 
> 

Applied, thanks!

[05/10] remoteproc: mss: q6v5-mss: Add modem support on SC7280
        commit: 529a0113177abe487614a0cba462d9973caa8c2a

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
