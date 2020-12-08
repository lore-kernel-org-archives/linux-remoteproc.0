Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB4CC2BB48
	for <linux-remoteproc@archiver.kernel.org>; Tue,  8 Dec 2020 14:12:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5A8923AC1
	for <linux-remoteproc@archiver.kernel.org>; Tue,  8 Dec 2020 14:12:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729392AbgLHOMU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 8 Dec 2020 09:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729753AbgLHOMQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 8 Dec 2020 09:12:16 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DFAC0619DA
        for <linux-remoteproc@vger.kernel.org>; Tue,  8 Dec 2020 06:10:49 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id m13so3440610ljo.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Dec 2020 06:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ColZvFMxeBX2F8jNmrJL1c8E3SYpy08jyj4gqYNN2Q=;
        b=F/qSEHHimCf8rH5UvNdUHXdgEwBU/rlqYccUOT2bxodbri/gk8Sqdibs2NMzsEAzcO
         4fhuiTBh6X4oPFv+D/gcuFPlTIPxOnCo4aG7Ug774m46ZqCtdh/SpQLhZupl49F9snVP
         NmCHLqUJtiVHRKBdHRKM+2zhZjQq/e0bc+w9x2tYgEAQzp6jMn+B34IavMEOChJn8xIS
         fcJsg60GI2pDYzfwYtgm15jMZ5Bx1KqMBii7Wc6NPAY/c3x6+WED5RWHnluhJ277kGvd
         fI17OZy2hTIKsgJk915wEy8Cm5yboxfD7X3jvKgO+whSRnemVeNclz5Cyb13d6StDetT
         XF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ColZvFMxeBX2F8jNmrJL1c8E3SYpy08jyj4gqYNN2Q=;
        b=cN/Hj4FqkSB2X2VKMzJJBmsJquP49m7MMgn4zPLmqhYNzuRaBWj6XbmF13J9wJ7HKN
         hMrLjoXIeiTQgyWztd0CLAYybnEyeYDlPETgOohPz598idKm9pa2ZLDtrKtt/yzgpT4Q
         QwMnaeqgFb8oucxSr4NJMP15qzQGVJaUOybgnJkpWbTUWMOVB/rxXnR2UR6luhu0HdQI
         JHu/3vfmEzpZTdLbDFgcFC6JHgVXzvoECez6ZjYxLh/QBmRaaj5awY9jCwhnMfwSmxDb
         VJve0SW0Gj5svNhZZAF1cETU3CRQ37UM3k0KnmAyFi2Xt7IoM+vW22P9Pp2I9sAIHbVb
         S6Qg==
X-Gm-Message-State: AOAM532K4YYSI4kjtFDmwx/FJr44eMGeeEAtoMeuYTMaZvWf+H4TVOxy
        VLuwmmDtVZSJo6JPLKQ256sNBw==
X-Google-Smtp-Source: ABdhPJwqXbavh17S7UTzCBV4act1/virkJITv41YRbvHOFx1U7eHC/c5oyg1pfML1LrsGvfd8ErFug==
X-Received: by 2002:a05:651c:113c:: with SMTP id e28mr2820609ljo.252.1607436647436;
        Tue, 08 Dec 2020 06:10:47 -0800 (PST)
Received: from gilgamesh.semihalf.com (193-106-246-138.noc.fibertech.net.pl. [193.106.246.138])
        by smtp.gmail.com with ESMTPSA id h23sm417017ljh.115.2020.12.08.06.10.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Dec 2020 06:10:46 -0800 (PST)
From:   Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, robh+dt@kernel.org, s-anna@ti.com
Cc:     grzegorz.jaszczyk@linaro.org, linux-remoteproc@vger.kernel.org,
        lee.jones@linaro.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
        rogerq@ti.com
Subject: [PATCH v4 6/6] remoteproc: pru: Add support for various PRU cores on K3 J721E SoCs
Date:   Tue,  8 Dec 2020 15:10:02 +0100
Message-Id: <20201208141002.17777-7-grzegorz.jaszczyk@linaro.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201208141002.17777-1-grzegorz.jaszczyk@linaro.org>
References: <20201208141002.17777-1-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The K3 J721E family of SoCs have a revised version of the AM65x ICSSG IP
and contains two instances of this newer ICSSG IP. Each ICSSG processor
subsystem contains 2 primary PRU cores, 2 auxiliary PRU cores called RTUs,
and 2 new auxiliary cores called Transmit PRUs (Tx_PRUs).

Enhance the existing PRU remoteproc driver to support these new PRU
and RTU cores by using specific compatibles. The cores have the same
memory copying limitations as on AM65x, so reuses the custom memcpy
function within the driver's ELF loader implementation. The initial
names for the firmware images for each PRU core are retrieved from
DT nodes, and can be adjusted through sysfs if required.

Signed-off-by: Suman Anna <s-anna@ti.com>
Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
v3->v4:
- No changes.

v2->v3:
- Add Reviewed-by: tag
---
 drivers/remoteproc/pru_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 421ebbc1c02d..2667919d76b3 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -850,6 +850,9 @@ static const struct of_device_id pru_rproc_match[] = {
 	{ .compatible = "ti,am654-pru",		.data = &k3_pru_data },
 	{ .compatible = "ti,am654-rtu",		.data = &k3_rtu_data },
 	{ .compatible = "ti,am654-tx-pru",	.data = &k3_tx_pru_data },
+	{ .compatible = "ti,j721e-pru",		.data = &k3_pru_data },
+	{ .compatible = "ti,j721e-rtu",		.data = &k3_rtu_data },
+	{ .compatible = "ti,j721e-tx-pru",	.data = &k3_tx_pru_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pru_rproc_match);
-- 
2.29.0

