Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EA22C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 Jan 2022 02:55:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345600AbiA1Cy4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 27 Jan 2022 21:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345597AbiA1Cyw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 Jan 2022 21:54:52 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50EA6C061748
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Jan 2022 18:54:52 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id u25-20020a4ad0d9000000b002e8d4370689so1136835oor.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 Jan 2022 18:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=txGDW+vVDj2W2Xqet7NzzdhFqerLTb4wuJyYtxok9TY=;
        b=WDTfn9Zdplh3vUbCWq7QDaOYswhbPZgLrDU7Idca2brCkDbrecG6l4IeehgwIaFpt7
         0CWq4H876ocpEEu36uMfPuGrycu09gbKHZc2m/xMWaRHGBH1yRPl58Ncp7rb6GURuodJ
         UHj4emBzLOcSh12f2cYMyYGJG9aW1ftJP9OMM5/CEtTR5yV+SeWVmlX7wz8lzv5RFT+N
         4MqCCtAJZ1V1gTSwWVuEV7Kgs95lfwAPSC7vbcPRiiFk5kAp6r5NAPLXvZP4Al6I1xz6
         PkpIypAUsV3IF8wmxCLbQ/inezaedO5w/fvrvSzIFjGVGeTiV6V3QVbT0CFlMNTqKqL0
         Dhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=txGDW+vVDj2W2Xqet7NzzdhFqerLTb4wuJyYtxok9TY=;
        b=ltlp7qt4y1FsW7GDk0DBKGUpCMOyLoVIE3Z80FRRQunlp0u/ieomsSwtAcWjkvAivR
         gDT8nf8hFBSYwc254r1kYIxD097qKrr2W9alL8t2dZs2vW3/KfCVfh2vNreQmYHn7JYw
         kdMLZwjqnS8p/gNglmGoKZ8sVyE+P2LTHVqagvLj34dLGI4t612CBNNHVCs5DxMYFB5y
         uaIZ5T5eNkWq9MUQFTmYkLd3vVoqN0U3uUFxCpf8NlSgL/E+SsNtvwVDLe3wQaJoKZtZ
         3jwjjytjhGXcJZ2wk3NlanrHEK3fo9MfkU23cvGZ84j3KsH/rx6KkB+yXkPQnlfdje/x
         blWA==
X-Gm-Message-State: AOAM532T0k4remD5/U6M5iCbJZX4VNAWgUd3YI5OZFdkCB9X8jSidVr7
        ufAj8DtRUkeD6gv+MLHw6t6rrg==
X-Google-Smtp-Source: ABdhPJxSqTgv+YNq5SqLs4mVaSzwlS8QjMEf+bBoB/28CcmiVtXKTVpIEyxianfityAoGqI7U5hZdA==
X-Received: by 2002:a4a:3f46:: with SMTP id x6mr3387000ooe.78.1643338491586;
        Thu, 27 Jan 2022 18:54:51 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k6sm5677352oop.28.2022.01.27.18.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 18:54:51 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/13] soc: qcom: mdt_loader: Allow hash to reside in any segment
Date:   Thu, 27 Jan 2022 18:55:04 -0800
Message-Id: <20220128025513.97188-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128025513.97188-1-bjorn.andersson@linaro.org>
References: <20220128025513.97188-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

It's been observed that some firmware found on Qualcomm SM8450 devices
carries the hash segment as the last segment in the ELF. Extend the
support to allow picking the hash from any segment in the MDT/MBN.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/soc/qcom/mdt_loader.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 4372d8e38b29..c5bd13b05c1a 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -126,9 +126,11 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 {
 	const struct elf32_phdr *phdrs;
 	const struct elf32_hdr *ehdr;
+	unsigned int hash_segment = 0;
 	size_t hash_offset;
 	size_t hash_size;
 	size_t ehdr_size;
+	unsigned int i;
 	ssize_t ret;
 	void *data;
 
@@ -141,11 +143,20 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 	if (phdrs[0].p_type == PT_LOAD)
 		return ERR_PTR(-EINVAL);
 
-	if ((phdrs[1].p_flags & QCOM_MDT_TYPE_MASK) != QCOM_MDT_TYPE_HASH)
+	for (i = 1; i < ehdr->e_phnum; i++) {
+		if ((phdrs[i].p_flags & QCOM_MDT_TYPE_MASK) == QCOM_MDT_TYPE_HASH) {
+			hash_segment = i;
+			break;
+		}
+	}
+
+	if (!hash_segment) {
+		dev_err(dev, "no hash segment found in %s\n", fw_name);
 		return ERR_PTR(-EINVAL);
+	}
 
 	ehdr_size = phdrs[0].p_filesz;
-	hash_size = phdrs[1].p_filesz;
+	hash_size = phdrs[hash_segment].p_filesz;
 
 	data = kmalloc(ehdr_size + hash_size, GFP_KERNEL);
 	if (!data)
@@ -158,13 +169,13 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 		/* Firmware is split and hash is packed following the ELF header */
 		hash_offset = phdrs[0].p_filesz;
 		memcpy(data + ehdr_size, fw->data + hash_offset, hash_size);
-	} else if (phdrs[1].p_offset + hash_size <= fw->size) {
+	} else if (phdrs[hash_segment].p_offset + hash_size <= fw->size) {
 		/* Hash is in its own segment, but within the loaded file */
-		hash_offset = phdrs[1].p_offset;
+		hash_offset = phdrs[hash_segment].p_offset;
 		memcpy(data + ehdr_size, fw->data + hash_offset, hash_size);
 	} else {
 		/* Hash is in its own segment, beyond the loaded file */
-		ret = mdt_load_split_segment(data + ehdr_size, phdrs, 1, fw_name, dev);
+		ret = mdt_load_split_segment(data + ehdr_size, phdrs, hash_segment, fw_name, dev);
 		if (ret) {
 			kfree(data);
 			return ERR_PTR(ret);
-- 
2.33.1

