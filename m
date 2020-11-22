Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80691C56201
	for <linux-remoteproc@archiver.kernel.org>; Sun, 22 Nov 2020 05:41:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D04620789
	for <linux-remoteproc@archiver.kernel.org>; Sun, 22 Nov 2020 05:41:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yt8RZtRJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgKVFle (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 22 Nov 2020 00:41:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727250AbgKVFld (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 22 Nov 2020 00:41:33 -0500
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2CDC0613CF
        for <linux-remoteproc@vger.kernel.org>; Sat, 21 Nov 2020 21:41:33 -0800 (PST)
Received: by mail-oo1-xc41.google.com with SMTP id l20so3209063oot.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 21 Nov 2020 21:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rhieI/Etrh/oLPSGfJ0G28Ub6VKedDTj5ibAz+QRjJQ=;
        b=yt8RZtRJhxjtMa3XNP71tJYZVjVo40qof8Yw+gB9yKFvN0uZuj6ccy3760pdFSKX3f
         lTR1ycIF1XdnB6rfKgckevdqE0HCFCsVL4mn52X4qXWwf1U8b6Rhg1CQfyYK9/o4LJcY
         bQ4Lk+aiP1NbQ22//pCZuwVwyGh87msQlBxmub5380Izxi9uNJeQYH0QVbrOlPJ5RpBi
         sfn3O3jH2L/9CwaBkvpRWwvUlP2J9z8CI+99qmA1MJC5Q9H8O7xa8+NwRRFYlCdfBj7T
         d34YCiJcYXxdJZhN8p1iPUpYReQsG8PiTOa7m8Zf8A+BKtwy+iAeon4VhoPQEp6HPdIs
         VQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rhieI/Etrh/oLPSGfJ0G28Ub6VKedDTj5ibAz+QRjJQ=;
        b=I1wYJhza52bfM0NjORNcbX1JStQPpnNb1LICjfo5sQ/+u2KAhQ8YRFbtPFtGC2djYA
         JYxMrSjCUitRvCvdvv3LVMpXbXLp//t1EGXwWSZIV8tUA8MlGZdDiIwwJv+APX/ZJT/J
         X5Uq9Kk2PAwYPLeC/ugfhWpOUA8kqUDISZ6+PA4lZdY7p0Ngm003que9lqQzX+qRYHi3
         Yl/TcczhRZ8ysBo+lKzwspBJUfpkri2uFuBqAPn2E2jdOPsEBN1enaMwihrN3qD8uyEy
         wGw52pHsAMYT7WRrWFlZIBLg7LmTCVKtNeYYHd+Cfwz/dfnF4PO17w2TwK0a/Wygxo6b
         YhpA==
X-Gm-Message-State: AOAM532bMSRFJrnRVAm4RZAjQHxpwWGLcx9GRnjitCKsTUalBzsAGYcO
        Kq9ulbR00ZcrsUECeTwW9Iosxg==
X-Google-Smtp-Source: ABdhPJyFNu2dmTei1U58jC06Dd+Siul99APlr0Ea81Zpgxba2pcqJhTAmCB+lTzbiTVaxoG91fAwpQ==
X-Received: by 2002:a4a:7b4b:: with SMTP id l72mr2355888ooc.45.1606023693019;
        Sat, 21 Nov 2020 21:41:33 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s28sm4303132otr.4.2020.11.21.21.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 21:41:32 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] remoteproc: Improvement for the Qualcomm sysmon
Date:   Sat, 21 Nov 2020 21:41:31 -0800
Message-Id: <20201122054135.802935-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The core part of this series is the update to the sysmon driver to ensure that
notifications sent to the remote processor are consistent and always present
valid state transitions.

In testing this I finally took the time to fix up the issue of the SMP2P based
graceful shutdown in the remoteproc drivers always timing out if sysmon has
already successfully shut down the remote processor.

Bjorn Andersson (4):
  remoteproc: sysmon: Ensure remote notification ordering
  remoteproc: sysmon: Expose the shutdown result
  remoteproc: qcom: q6v5: Query sysmon before graceful shutdown
  remoteproc: sysmon: Improve error messages

 drivers/remoteproc/qcom_common.h    |   6 ++
 drivers/remoteproc/qcom_q6v5.c      |   8 +-
 drivers/remoteproc/qcom_q6v5.h      |   3 +-
 drivers/remoteproc/qcom_q6v5_adsp.c |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c  |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c  |   2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c |   2 +-
 drivers/remoteproc/qcom_sysmon.c    | 119 +++++++++++++++++++++-------
 8 files changed, 109 insertions(+), 35 deletions(-)

-- 
2.28.0

