Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D9BC4321E
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5AC8D61178
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 20:54:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237123AbhI0Uzq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 16:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237062AbhI0Uzm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 16:55:42 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBF3EC061765
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:03 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id c6-20020a9d2786000000b005471981d559so26184543otb.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 13:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=POIiA2MImMXfRFMeiQTdJT6uwva0J5aruJHkxIRDmsE=;
        b=EsLsUNu2C2Kps1gGbGXf15KGR1qB5j+7X7dgYwSyftvM2rP8Wzv3wtQkeaBmr1mu5D
         SIsUllsWbhbKiv5K53FYBcairmD61Eqq+PrMzzVOk6aRSRbWLR6zmzPigPfEhevO8yjR
         6WeDP8DQhQWE9cYIAz6gc9airqeq+vdXK+LsCU0/BpdVehHwswRzemZIyc7Chm6zx5ie
         vBaHpStoXeAvsD7roy1aXaq2Wr9fcphEOGC8z+YNjG7JXqJROIC4HM1u1Y3Nyf8xywkh
         8brf3yOt2wLWimDnMyHyzIGVhIGb9uy8YNAWQPAXK4HQk97xxU8VWhddHxmzuxipJNy0
         Oj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=POIiA2MImMXfRFMeiQTdJT6uwva0J5aruJHkxIRDmsE=;
        b=hTm26lsBGQabPxotiIHJ0fAlpydHSTUVe9EzVSLy4BR4RR6pyF19vlvK2/Vy2G1HN9
         d6gzp2Cz0a1A1Ljmjf0hGfx+ixEgVYroeY3b7LWWKBte70JGkGc3Fge7Zm/kgxApixk1
         Q+63L9Hxx0Bk+rahdojCerelVEQ0vwYdy05tBtwnMr2NARWKo+aTM9qFGQhtdbZBeHF8
         uFAY1sJnYoQqLXf6ROXYgNC11oQvYmkl6YD4cAR3AdrBFdlxikZCT6F8x4WyIoNS+GEj
         LjyHCZXZyyilUFyn0mEq96O0lx+Scq0DIG2+wlnBcDhzjRfuj1Tm8wa+4HtpVhsRcJd7
         eRRg==
X-Gm-Message-State: AOAM533izwqaLRMXFU/Dl/Z2BFNxV6DYVgpI104Pgr60+b9YsDoWOW0V
        hDtAyWECJT4P1mQAw7VPz993Pw==
X-Google-Smtp-Source: ABdhPJxA+HbAXtLen4mv68sabIYEBe1pw5B0qeFa8InDcK7Yub7886fmxPx7NhAUpT9T+EE89L/c2w==
X-Received: by 2002:a9d:7dca:: with SMTP id k10mr1842805otn.54.1632776043201;
        Mon, 27 Sep 2021 13:54:03 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z10sm4187275otq.64.2021.09.27.13.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 13:54:02 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mka@chromium.org, robh+dt@kernel.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, sidgup@codeaurora.org,
        linux-remoteproc@vger.kernel.org, rishabhb@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rjw@rjwysocki.net, mathieu.poirier@linaro.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        ulf.hansson@linaro.org, agross@kernel.org
Subject: Re: (subset) [PATCH v7 06/13] arm64: dts: qcom: sc7280: Use QMP property to control load state
Date:   Mon, 27 Sep 2021 15:53:53 -0500
Message-Id: <163277593825.1470888.7973258155806834191.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631800770-371-7-git-send-email-sibis@codeaurora.org>
References: <1631800770-371-1-git-send-email-sibis@codeaurora.org> <1631800770-371-7-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 16 Sep 2021 19:29:23 +0530, Sibi Sankar wrote:
> Use the Qualcomm Mailbox Protocol (QMP) property to control the load
> state resources on SC7280 SoCs and drop deprecated power-domains exposed
> by AOSS QMP node.
> 
> 

Applied, thanks!

[06/13] arm64: dts: qcom: sc7280: Use QMP property to control load state
        commit: 6b3207dfebdf10474f1df143892c9d78644be643

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
