Return-Path: <SRS0=yUw9=7J=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF092C433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 May 2020 05:49:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98AC0208E4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 May 2020 05:49:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BynqfQ+a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725267AbgE0Ftv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 May 2020 01:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgE0Ftu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 May 2020 01:49:50 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A5BC03E96F
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2020 22:49:50 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t7so9734825plr.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 26 May 2020 22:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVRQ/dG/ulblJ6XfEmveJlaTO6rV8wSk5XBgKB7R2z8=;
        b=BynqfQ+a5CBlSg++kvXtdKorWt70nAbQ+AB4vsASLLrHpIBhbOhM6OAKRk2lZNj+kA
         WljhD0oBMlc/5i9E1DkVKQJ8SlYlQI8ucYCGfJftn1M7eDYZVNv+eXnXqtfCdZVWoqrH
         dwemZk680kcFLHibchlHCwPFcGGcic+56SbpnjYYqq48OyOGyXH1OsPAMTwr2Vv0EWRw
         YqPozv5/lTy7+D/29KN9QuzT0GCdxf0Bq0dRR4uu+JpanFNmFH19PORWmbC+n9QnRSe2
         S1wplBoDTWOL1CDlIbBl+Wa4YrUZcx6hx6repqVSqIFvYNCjR4n2EdmiO145otuDW/Ug
         8FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVRQ/dG/ulblJ6XfEmveJlaTO6rV8wSk5XBgKB7R2z8=;
        b=YZkh0oPA/3Xrmxf9MkSQ3/SiOq5MZ2S5pJudJkMjurbnHyEgVKuVJZSL352UvZpM+0
         VRkXx3E8cjsUvNv+XVI2zni/UlO8GOcbiWsSiVCiU77tGo1IienWSDv+Orl/qoQuuISa
         4SVXFIY9J6gGgWikh42Ybhit0P32XVRprh9HXRZ7N8rRsiqCILXwmrJb0BqPDfYxscvp
         IZWUUA+Zhj5KM+52uqGIIbg//OZ9Ptfu2fhdPHxYRbI+c8DkXloM+9UAkCR4uKutE1zt
         5OVkUtcbGGjhcjRDwTbd5Ae8++KTI6vBFridnwtmqlogTrl0b/TzKG0XLZgxar6efEcA
         Uxpw==
X-Gm-Message-State: AOAM530pBchQj+aQYqEwIx6Vx09JneUJN4xOYRliXyalRWk72GHrYAnI
        LGh4WR1YT3tcZH2x+SA7S4e0KA==
X-Google-Smtp-Source: ABdhPJxxYTWCxpVs3/p7Y4l6Rw8F2L+7yqSTCrCkinr/sKBgmzP+kAYhcMGEhULY0IXMqrNttZJoMQ==
X-Received: by 2002:a17:902:c004:: with SMTP id v4mr4526725plx.46.1590558590090;
        Tue, 26 May 2020 22:49:50 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 206sm1015873pfy.97.2020.05.26.22.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 22:49:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/5]  remoteproc: qcom: PIL info support
Date:   Tue, 26 May 2020 22:48:44 -0700
Message-Id: <20200527054850.2067032-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Introduce support for filling out the relocation information in IMEM, to aid
post mortem debug tools to locate the various remoteprocs.

Bjorn Andersson (5):
  dt-bindings: remoteproc: Add Qualcomm PIL info binding
  remoteproc: qcom: Introduce helper to store pil info in IMEM
  remoteproc: qcom: Update PIL relocation info on load
  arm64: dts: qcom: qcs404: Add IMEM and PIL info region
  arm64: dts: qcom: sdm845: Add IMEM and PIL info region

 .../bindings/remoteproc/qcom,pil-info.yaml    |  44 +++++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  15 +++
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  15 +++
 drivers/remoteproc/Kconfig                    |   8 ++
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/qcom_pil_info.c            | 124 ++++++++++++++++++
 drivers/remoteproc/qcom_pil_info.h            |   7 +
 drivers/remoteproc/qcom_q6v5_adsp.c           |  16 ++-
 drivers/remoteproc/qcom_q6v5_mss.c            |   3 +
 drivers/remoteproc/qcom_q6v5_pas.c            |  15 ++-
 drivers/remoteproc/qcom_q6v5_wcss.c           |  14 +-
 drivers/remoteproc/qcom_wcnss.c               |  14 +-
 12 files changed, 264 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
 create mode 100644 drivers/remoteproc/qcom_pil_info.c
 create mode 100644 drivers/remoteproc/qcom_pil_info.h

-- 
2.26.2

