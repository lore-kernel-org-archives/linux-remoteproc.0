Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44586C00A89
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5B78206ED
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 19:57:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWh6cEJr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbgJ3T5S (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 15:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgJ3T5S (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 15:57:18 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C64C0613CF
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:18 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r10so6099665pgb.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 30 Oct 2020 12:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yXdL4ecpHH1mL8S5GyV3JtEcnfM47x+V/iQcr/L7MnY=;
        b=DWh6cEJrr2LpkfUzIei3n6oExlgHffGkqhzzQsgK633PBlinOM/b5F7rqGtjyF/t01
         nspgP/yd2viZMED7xD25NF+rKsg6pLEd7Y5DksPyjpWEjsS4rcbBqmdgFE/efZVphosx
         Sbb4NiFy2UkRYh4ZgZThK44RDYYhuSEMOb8wD9fhSgP/E+KlKEDtQitWi1GXrTF4wbWi
         xUn67AOMQnBeHGPAGClYTecOfWh2UNBrnQyFJoAmoHShEHbz+8IG1k+jijBwdGZ+qsTD
         Ucm0Kgh+kXId3hmQPT96vpga0WKKusXxnaLmdvI5kpOKRtm6SenVy77chrK4riOGRY5W
         cd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yXdL4ecpHH1mL8S5GyV3JtEcnfM47x+V/iQcr/L7MnY=;
        b=XyCjDyI9HaMdaUsTXmaBD1proH6xU138Qf1QaefIhP0rTZy56CXR0PV343a9Wz2oYq
         MpfpDcCMKA/DzxKSzmu9cbGsq0HzE9T+Xu0n0GpbleRhDM/nRr05Nf2l2Uqo75rxxxhs
         47WFO+8Q+GHpb0sfRKuTZhpNuOmAbjdfbpey2rk0sXLRmmpql05V0stbB1q9JeXyIadj
         xvqrpN/9Ku8rEeBH8esOsfaxZW/a2PlppNQvCtMCocbulJLv8puQLrtxakfMIxwN1e/t
         vm8+VfdLJLvmbGCynEo001L9YXjq7tLtoL5jtEezFSIml2BRRtxvmkysfwMhPDttzlXI
         F0pA==
X-Gm-Message-State: AOAM532Mn9+OXJfl9dcVVlCV8MJFF4WOXnXNwUdMRY1fbPjppt77CJee
        gnRuUgyULK2P/ftOXVWw4yuIBw==
X-Google-Smtp-Source: ABdhPJxm/cRs+Z8Poix1EikBTVOm9AlbhGEagsLiJ20ixr1afoev8OF/ZSeSXmSXoUExyhjFI8dtXA==
X-Received: by 2002:a63:313:: with SMTP id 19mr3441948pgd.18.1604087838080;
        Fri, 30 Oct 2020 12:57:18 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o15sm6892640pfd.16.2020.10.30.12.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 12:57:17 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 03/14] remoteproc: Add new RPROC_ATTACHED state
Date:   Fri, 30 Oct 2020 13:57:02 -0600
Message-Id: <20201030195713.1366341-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a new RPROC_ATTACHED state to take into account scenarios
where the remoteproc core needs to attach to a remote processor
that is booted by another entity.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_sysfs.c | 1 +
 include/linux/remoteproc.h            | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index d1cf7bf277c4..1167adcf8741 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -201,6 +201,7 @@ static const char * const rproc_state_string[] = {
 	[RPROC_RUNNING]		= "running",
 	[RPROC_CRASHED]		= "crashed",
 	[RPROC_DELETED]		= "deleted",
+	[RPROC_ATTACHED]	= "attached",
 	[RPROC_DETACHED]	= "detached",
 	[RPROC_LAST]		= "invalid",
 };
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 3fa3ba6498e8..4564c4665a2c 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -403,6 +403,8 @@ struct rproc_ops {
  * @RPROC_RUNNING:	device is up and running
  * @RPROC_CRASHED:	device has crashed; need to start recovery
  * @RPROC_DELETED:	device is deleted
+ * @RPROC_ATTACHED:	device has been booted by another entity and the core
+ *			has attached to it
  * @RPROC_DETACHED:	device has been booted by another entity and waiting
  *			for the core to attach to it
  * @RPROC_LAST:		just keep this one at the end
@@ -419,8 +421,9 @@ enum rproc_state {
 	RPROC_RUNNING	= 2,
 	RPROC_CRASHED	= 3,
 	RPROC_DELETED	= 4,
-	RPROC_DETACHED	= 5,
-	RPROC_LAST	= 6,
+	RPROC_ATTACHED	= 5,
+	RPROC_DETACHED	= 6,
+	RPROC_LAST	= 7,
 };
 
 /**
-- 
2.25.1

