Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A9AC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 Jan 2022 02:55:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345676AbiA1Cy6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 27 Jan 2022 21:54:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345651AbiA1Cy5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 Jan 2022 21:54:57 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E20AC061769
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Jan 2022 18:54:55 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id p203so9762296oih.10
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Jan 2022 18:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E00ULksfCHrGjrIytZEDeV+x815pqBoESRwaY/ogtLg=;
        b=wdTBQQBrqiQKJNtAtbRq68Uh+cRvdVAW/wsJWvsUwS2e+kIkwskuq2k8Ik2LdxSp/Y
         xoT+QagdT6TU3oJwuaNo9reTKhE1vwHtGz1rLkVpamMFTNmLFtoeUOXFvseU2nEmtwaO
         8gv4EX3CysuJvHA/ElSw1Xhk18LqHwJdlz6Izn804Z5yPa4wpP05Q43z3yscn5Xka7PS
         RO/AdiL4QXP5WpagSi3H3unH8GRLf1EtmIQJy9YygCKTzsw94JI/W43rMN1gHHeEtRVa
         huzr/CES8ln1Y3a+BatWOrnrbyTzYpY9V15sgSwlWKL6lWh7mJIIVvuSW6MLYivoAQZX
         JSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E00ULksfCHrGjrIytZEDeV+x815pqBoESRwaY/ogtLg=;
        b=mPUG00mqX45FjItyYj0irgqdIdgpzh7sio7hobj8Frd2tfcTGP7vXBOSm/pQyt/xSD
         lu6zqQJzBteuYTEPPErhWK9nvylV/wkZjqU6kpKhRxeJTIV9nDuzTdfwdeOmjeAcek1A
         kKKr1B/y/R1lKupZiKZJDadrOsXcdIZGb7xuWPBjqm6yLZBWQyL8gtbgSB90/Cuxire9
         qsTYJAXJXDmy2pFJUS3si1p/h7unvc6/8Y0TlLuzsFobJmoSxN8aP5JNqlENhEQzT1PS
         zBv/KnBi+q12bzpVwbCp4dHP80Ke8L3fFkTscUjpsu/JX2ksdRJqrs41XwxyqgrGxUe2
         HIGw==
X-Gm-Message-State: AOAM533JjT/OX+8eeNbfCqGEI4j5ze4/7zozsTxn2zSyflHJmmHxIvZg
        cEc+eGQADreQ3RPRPpNjxw1zzB6u0NoDUw==
X-Google-Smtp-Source: ABdhPJxmRmu9TMZZNqXzAwWye2txzFpM75FYBZzDv6Y+J2J3L/GAcgal6SYihv6Za/Kxs1qpPLXjKg==
X-Received: by 2002:a05:6808:120a:: with SMTP id a10mr9546519oil.218.1643338494212;
        Thu, 27 Jan 2022 18:54:54 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k6sm5677352oop.28.2022.01.27.18.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 18:54:53 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 07/13] soc: qcom: mdt_loader: Always invoke PAS mem_setup
Date:   Thu, 27 Jan 2022 18:55:07 -0800
Message-Id: <20220128025513.97188-8-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128025513.97188-1-bjorn.andersson@linaro.org>
References: <20220128025513.97188-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

After spelunking various old kernel trees no finds has been found
indicating that the PAS mem_setup call should actually be made
conditional on the image being relocatable.

Group the two PAS operations together, to facilitate splitting them out
in a following patch.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index ee991784a738..c8d43dc50cff 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -247,20 +247,17 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 				ret, fw_name);
 			goto out;
 		}
-	}
 
-	if (relocate) {
-		if (pas_init) {
-			ret = qcom_scm_pas_mem_setup(pas_id, mem_phys,
-						     max_addr - min_addr);
-			if (ret) {
-				/* Unable to set up relocation */
-				dev_err(dev, "error %d setting up firmware %s\n",
-					ret, fw_name);
-				goto out;
-			}
+		ret = qcom_scm_pas_mem_setup(pas_id, mem_phys, max_addr - min_addr);
+		if (ret) {
+			/* Unable to set up relocation */
+			dev_err(dev, "error %d setting up firmware %s\n",
+				ret, fw_name);
+			goto out;
 		}
+	}
 
+	if (relocate) {
 		/*
 		 * The image is relocatable, so offset each segment based on
 		 * the lowest segment address.
-- 
2.33.1

