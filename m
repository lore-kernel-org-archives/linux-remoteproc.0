Return-Path: <SRS0=SCme=63=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CC0C47077
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 00:55:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C61E120753
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 00:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ITZ6s8nf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732057AbgEMAzb (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 May 2020 20:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732078AbgEMAza (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 May 2020 20:55:30 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D873C05BD09
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2020 17:55:30 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id s69so2066505pjb.4
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 May 2020 17:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+aVsTRV0Vd7AjARuX1FSoP3j3p4vMbsUynYNIWG2zcg=;
        b=ITZ6s8nfqeBtfn0oVoLGCgrnjOV1Xy0pZ3QdECW67KsV/hkeylPh/9bZ5pY1ytrDEv
         MYdwBAJh+8DHuXK6VaGPgTKlQozijma7VAZhrA2jziS2Wlfl2Aj0GO+oGXYBdvOHYkNI
         1zyQX/hfzOnC2niIDuG1u0ohwO0xg+hWVawxT9+Pn0+2OOKKwn0xZv2Qvv+BXw3KPfaT
         Ba0QGr4CYQTEmMg3MUxArtF/PEekKi386oRGyi9pXGwCAQiIgxbtoqYViHsSJgREiy1K
         Y7ilsmDsR0Th/RdJdnf+j5yqKLOCA3bz1sKYYSDzKdxvqgerEGPd3qk7PmVJDXYSzYoI
         zGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+aVsTRV0Vd7AjARuX1FSoP3j3p4vMbsUynYNIWG2zcg=;
        b=l+3xlVn3RIoDZeBo1Fi/trEccvlJgqmXyjNXeLhF5o9gMZzi4athKyAoNVQKNn6uqU
         l2WHA4eNfnl4iN0BA4bpcGZp1I/ht91nbAwKGqE8HSzBr24ShNd9gwj+J9MOyM77PEvT
         sanou1RXSs1qyTLnL2D92PDJH4o9JLifMkpjWmsrqQJO0pS21Rv9OHZbgJYUIqgVA3lk
         7LM7TjTL5B+Kg+zzmw1iTTLsiHK5XS1IS9fQnK2sxxDp99xosuKVU9wP09JU3D9XwCut
         smsdoKeV05kjqvglz20GgYVzBLy4fUPCcMyBbZ4fjoaG8B00idvvTbu/KCtKwPBF3c9z
         a8vw==
X-Gm-Message-State: AGi0PuZ6PQuaiPSpu6Ijr4smrpLuBRl2Pj8FGIZ5tAH5HN4DoOFfSDRx
        TsKU6XtSmW2AQXjjWFghsRfAu5Hyu1w=
X-Google-Smtp-Source: APiQypI3O4oBkDtpKaBNHwg5f+8AZEbJC5eKmdrym5Hi5g9Mw7N4wvHIlkhR/lrQNiEANYIJvRADLA==
X-Received: by 2002:a17:90a:da05:: with SMTP id e5mr32780994pjv.140.1589331329287;
        Tue, 12 May 2020 17:55:29 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p2sm11057428pgh.25.2020.05.12.17.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 17:55:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] hwspinlock: qcom: Allow dropping the intermediate TCSR mutex syscon
Date:   Tue, 12 May 2020 17:54:37 -0700
Message-Id: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In all modern Qualcomm platforms the mutex region of the TCSR is forked
off into its own block, all with a offset of 0 and stride of 4096.
Update the binding to allow the hardware block to be described directly
on the mmio bus, in addition to allowing the existing syscon based
definition.

Bjorn Andersson (4):
  dt-bindings: hwlock: qcom: Migrate binding to YAML
  dt-bindings: hwlock: qcom: Allow device on mmio bus
  hwspinlock: qcom: Allow mmio usage in addition to syscon
  arm64: dts: qcom: sm8250: Drop tcsr_mutex syscon

 .../bindings/hwlock/qcom-hwspinlock.yaml      | 65 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 11 +--
 drivers/hwspinlock/qcom_hwspinlock.c          | 72 ++++++++++++++-----
 3 files changed, 124 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml

-- 
2.26.2

