Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E89C43334
	for <linux-remoteproc@archiver.kernel.org>; Sun,  3 Jul 2022 04:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbiGCEAG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 3 Jul 2022 00:00:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232705AbiGCD7Y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 2 Jul 2022 23:59:24 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F7BDEA6
        for <linux-remoteproc@vger.kernel.org>; Sat,  2 Jul 2022 20:57:53 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id r8-20020a4abf08000000b00425b1256454so1236376oop.13
        for <linux-remoteproc@vger.kernel.org>; Sat, 02 Jul 2022 20:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nt2X+uNdLrpqdwW0aiTYtzYyC6r+nlmftQUdxFVU4Xo=;
        b=BPMHef0X/UE+4gfLJA/7h77BuJDDzVheYqkpw++CWW1epTNRvaYvKEFhd47ROXcSsG
         FxLj4ooKK5PwIH27TXSsHnONma/iG6enxCHozjekdUvETqDuLexD8kDRSHH70cQQifWq
         SKga7najfdqZe9ox6b8qxJwrFeQH5adIMWau/iORHltnLhQt7C2uY+OBYNQrGIc7TKqL
         iyfiMJ3kN4GgikvTXDcCjP0dtVloWvajjiLncFDaM+Veb7tXmMQtmj2IWwBmzmo0vcoU
         Sc8jsv/EvLZT5Zab3DdKIfVJd+RwuJF4fLB+BNmEvI1tIANuQdyX1I/T3gE5yqRelPrL
         Ezug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nt2X+uNdLrpqdwW0aiTYtzYyC6r+nlmftQUdxFVU4Xo=;
        b=WIt94HdtKBiN2jOfu/kTNKioIFQqWDoLPCLuFgcSwNGw1zgNa5duE9h6b/FtlDXcWk
         i3rUEfRd8J/Scvp0Q91NDIq5iCG69tVM/ZUptcnhEerHjS7p0SY/1TjmKMx89Yp14tEA
         nOSt64k7G5aqYHbtmTX6afuHCL7dreBf/g/Mw4SKTe5Hfez06fHYOYRZngAT0R7j8Od6
         lLUvY5n+YFovEt3gq7oPm1CWJ5Odtr0TF8pJn9f5/HeX12HfgudBwOHfQBIiiXAVN+Vn
         IpazKn613htViMBVWSlczitFHn1PRcyEVTqHJKoiBau8N+gTJmIHWUpTvr8JCCrIyVSz
         9IMQ==
X-Gm-Message-State: AJIora8ZpToagX2ZUrVVXCzuTcnyyemYdjJf4Jwr9YfSlzMR5Qa43U/e
        u2DifZuLtvlFY+YXSfNcN8WrLQ==
X-Google-Smtp-Source: AGRyM1vE0ezP6iYXpSJ8kJRFJ+KDpplJyvj1NhwUowXIodyfRExwifaK97ELp5c/+kfnP67lB6y+Ew==
X-Received: by 2002:a4a:3813:0:b0:425:8005:1289 with SMTP id c19-20020a4a3813000000b0042580051289mr9430592ooa.63.1656820671202;
        Sat, 02 Jul 2022 20:57:51 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:50 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     robh+dt@kernel.org, Sibi Sankar <quic_sibis@quicinc.com>,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        swboyd@chromium.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        mka@chromium.org, agross@kernel.org
Subject: Re: (subset) [PATCH v4 1/3] arm64: dts: qcom: sc7280: Add proxy interconnect requirements for modem
Date:   Sat,  2 Jul 2022 22:56:44 -0500
Message-Id: <165682055969.445910.10978173770600627077.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1652978825-5304-2-git-send-email-quic_sibis@quicinc.com>
References: <1652978825-5304-1-git-send-email-quic_sibis@quicinc.com> <1652978825-5304-2-git-send-email-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 19 May 2022 22:17:03 +0530, Sibi Sankar wrote:
> Add interconnects that are required to be proxy voted upon during modem
> bootup on SC7280 SoCs.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sc7280: Add proxy interconnect requirements for modem
      commit: a0cdc83fa89b3a53cf03ecd338832392be0dd4b3

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
