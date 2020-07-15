Return-Path: <SRS0=dXMc=A2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD66C433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Jul 2020 12:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6975C2071B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Jul 2020 12:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L0uMl8Hb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729633AbgGOMf4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 15 Jul 2020 08:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgGOMfz (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Jul 2020 08:35:55 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850E8C061755
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2020 05:35:55 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f18so2541101wrs.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Jul 2020 05:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DwZZAmt/+Jz9Ze538UBZf8fHuD08d99YrWh/wrfJAWU=;
        b=L0uMl8HbXnpQfc9D0kHtJqKTEoYngjcolOXuOvBSeh0DbOwCcJUBau5Ul1Mupv7s48
         TzyTfD0t9pvG2iozvCFa+dEAnPJRpDSraNA/UR2XjUIBv80yDwlAQSK4crN3lPK5Y/9F
         VkECEIn8BsJU4kSAViBwnIix7A3wb2nf1X6o+VJrh5rAzu5miVylRlV34bAmqYJviWBQ
         t4QPxGTuwAgku2AvuDsHFzaEpVvWqSFsWWxwnl8tFqr0LUzldQ7igT1gPVM2uQVVF2eo
         ytNOcOrn/GH1LB38xJHnvxoOvz15d6Ib5BDcZkhidr51uXFp4vKeKi3vKEDwIxbf3ihr
         UP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DwZZAmt/+Jz9Ze538UBZf8fHuD08d99YrWh/wrfJAWU=;
        b=MCQ420E+wPdj3JvEv5vmgGr2/OLJb7Gu4+hC6WpaeSOscJRRN8SFsQVBdPzTn+RtFC
         dFXLEgHto4XQx+54T1QvrQRtr5RPfR4WWggn2s+qUHId8bIJ9nhyrLc6S7BgUSvab42v
         V+1GtRrLTc2XTcfD2U7CP0weBJHZ9J2OG5vyFZ///ErnddoahJMyhkQf9hpCYxSfu6qx
         2Ocf4wJIAZ5B1hHFgv4DLKEDqLakG5+rnMBFRXZTX+REBl7eB9fmdCACGAGBpwjQRgHN
         2Dkf6i9K2IzQYBbpWfsIpT9jN8UEBAF7lejmEZK0X0m2IkPiNTBlKTGJiT5si+AouF/e
         bpcQ==
X-Gm-Message-State: AOAM5300uS41ZhZSLf1iYMPpi+ZpCKC/Q3FqREOFoUPVL2cmLaIRFBj4
        g5jfIOsqt5paeWfZ4Kcma47caw==
X-Google-Smtp-Source: ABdhPJwrCFjQohsoalzLJDLPFkqYz+bRjaXZ9uDdPDSoUWAvn3wmzZKAnWLUqs4aEejfr8Gt+f4OpA==
X-Received: by 2002:a5d:6651:: with SMTP id f17mr11991374wrw.29.1594816554292;
        Wed, 15 Jul 2020 05:35:54 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.61])
        by smtp.gmail.com with ESMTPSA id h14sm3298985wrt.36.2020.07.15.05.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 05:35:53 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Brian Swetland <swetland@google.com>,
        Mark Grosen <mgrosen@ti.com>,
        Guzman Lugo <fernando.lugo@ti.com>, Suman Anna <s-anna@ti.com>,
        Robert Tivy <rtivy@ti.com>, De Leon <x0095078@ti.com>
Subject: [PATCH 1/2] remoteproc: remoteproc_core: Use 'gnu_printf' format notation
Date:   Wed, 15 Jul 2020 13:35:50 +0100
Message-Id: <20200715123551.4011154-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/remoteproc/remoteproc_core.c: In function ‘rproc_find_carveout_by_name’:
 drivers/remoteproc/remoteproc_core.c:257:2: warning: function ‘rproc_find_carveout_by_name’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
 257 | vsnprintf(_name, sizeof(_name), name, args);
 | ^~~~~~~~~
 drivers/remoteproc/remoteproc_core.c: In function ‘rproc_mem_entry_init’:
 drivers/remoteproc/remoteproc_core.c:993:2: warning: function ‘rproc_mem_entry_init’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
 993 | vsnprintf(mem->name, sizeof(mem->name), name, args);
 | ^~~~~~~~~
 drivers/remoteproc/remoteproc_core.c: In function ‘rproc_of_resm_mem_entry_init’:
 drivers/remoteproc/remoteproc_core.c:1029:2: warning: function ‘rproc_of_resm_mem_entry_init’ might be a candidate for ‘gnu_printf’ format attribute [-Wsuggest-attribute=format]
 1029 | vsnprintf(mem->name, sizeof(mem->name), name, args);
 | ^~~~~~~~~

Cc: Brian Swetland <swetland@google.com>
Cc: Mark Grosen <mgrosen@ti.com>
Cc: Guzman Lugo <fernando.lugo@ti.com>
Cc: Suman Anna <s-anna@ti.com>
Cc: Robert Tivy <rtivy@ti.com>
Cc: De Leon <x0095078@ti.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0f95e025ba030..e00dff425c96e 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -243,6 +243,7 @@ EXPORT_SYMBOL(rproc_da_to_va);
  *
  * Return: a valid pointer on carveout entry on success or NULL on failure.
  */
+__printf(2, 3)
 struct rproc_mem_entry *
 rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...)
 {
@@ -966,6 +967,7 @@ EXPORT_SYMBOL(rproc_add_carveout);
  * This function allocates a rproc_mem_entry struct and fill it with parameters
  * provided by client.
  */
+__printf(8, 9)
 struct rproc_mem_entry *
 rproc_mem_entry_init(struct device *dev,
 		     void *va, dma_addr_t dma, size_t len, u32 da,
@@ -1009,6 +1011,7 @@ EXPORT_SYMBOL(rproc_mem_entry_init);
  * This function allocates a rproc_mem_entry struct and fill it with parameters
  * provided by client.
  */
+__printf(5, 6)
 struct rproc_mem_entry *
 rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
 			     u32 da, const char *name, ...)
-- 
2.25.1

