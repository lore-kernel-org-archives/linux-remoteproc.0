Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C673DC433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 May 2022 07:34:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234793AbiESHeA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 May 2022 03:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234802AbiESHd4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 May 2022 03:33:56 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DCDA939B9
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 00:33:54 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id m6so5226123ljb.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JU/w/Q+8HFEU9nsRj7Rx9N0J4brWWkqsyE1Gu2AJj3w=;
        b=F61xlt5TjihAyu5QezHnjzzBVLi27Sg6yo3OYzXJR6NmCriDt+/K33lENxq5dZ5zX6
         XlboER9fL3KUJO4FhoztD4Cq85q95zYqqnlhMiMmyHHZ3rN6zgnjV/ZwRp1jPcCtIOyW
         5UTIUARebr2OHj5b7tRl5tNpRGlxHpU5zR0nZEOp/WfyFLuVwmzo7uZbCjRcaDLQajph
         OwTv+XOUliqSc8Plu0uwQwTrlIdf+81a4fXU5u+K/UvQ3ezlAaogeqqcEIHhVgEY4CZL
         3ykbvDKZtn5SoyutQGTjfSf/ncIe7eRcQ55AyEF/glEZsHqXSEWNKtetn7DYoK7cZdxm
         RFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JU/w/Q+8HFEU9nsRj7Rx9N0J4brWWkqsyE1Gu2AJj3w=;
        b=R+oisVr6I8LyDhbhuDgoicBT5T3ZsPIDOA78btM7y5cCLbvAROtwFSyRZaAJ+ePx7I
         FMCLndFw1R5L+KpQQigWcPoSrN3G0Fxvp0dN0knooxNwV0J0ED3kb+xSbFo6hrdag08I
         EmHMaavbssQal7g77S4iRBDlnvR+u5Fqn/k8Ai/PHppS4Uhakzz0uqZX4tdnwsnPnFgD
         +Ke9MfVEm3TGtomSht0z7Mrfn7zcYtxdRQfkGHMZULxzmJz0qhhgfOHBr7P2JW7CawJp
         acgplOr4UGGC2dMWv5KPXCiRHK0j6aWJzifc60uxHjcUNqEYjvplfm/07Z+UgIi+ots1
         7Umw==
X-Gm-Message-State: AOAM5331kfr/GMkVAK4OlU6r1oRdwFcZogqne6+FjN4BIh2wAkSfxRo4
        AcBRHOJBnNKorDrXw1f+vgFC9g==
X-Google-Smtp-Source: ABdhPJw1znumvhdnkSXXyMHaCPMqeGr3LWBnCSF+oYZTeGkm0OEe7bQmAlbxjkmRjgaVfz1vVyBGQg==
X-Received: by 2002:a05:651c:4d2:b0:250:69a8:5850 with SMTP id e18-20020a05651c04d200b0025069a85850mr1886689lji.5.1652945633607;
        Thu, 19 May 2022 00:33:53 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c12-20020ac2530c000000b004778d417c49sm183401lfh.290.2022.05.19.00.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 00:33:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] remoteproc: qcom: correct kerneldoc
Date:   Thu, 19 May 2022 09:33:49 +0200
Message-Id: <20220519073349.7270-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Correct kerneldoc warnings like:

  drivers/remoteproc/qcom_common.c:68:
    warning: expecting prototype for struct minidump_subsystem_toc. Prototype was for struct minidump_subsystem instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>

---

Changes since v1:
1. Split series per subsystem.
2. Add tag.
---
 drivers/remoteproc/qcom_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 4b91e3c9eafa..020349f8979d 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -50,7 +50,7 @@ struct minidump_region {
 };
 
 /**
- * struct minidump_subsystem_toc: Subsystem's SMEM Table of content
+ * struct minidump_subsystem - Subsystem's SMEM Table of content
  * @status : Subsystem toc init status
  * @enabled : if set to 1, this region would be copied during coredump
  * @encryption_status: Encryption status for this subsystem
@@ -68,7 +68,7 @@ struct minidump_subsystem {
 };
 
 /**
- * struct minidump_global_toc: Global Table of Content
+ * struct minidump_global_toc - Global Table of Content
  * @status : Global Minidump init status
  * @md_revision : Minidump revision
  * @enabled : Minidump enable status
-- 
2.32.0

