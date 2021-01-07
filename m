Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F5EC43381
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 23:51:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3615E2368A
	for <linux-remoteproc@archiver.kernel.org>; Thu,  7 Jan 2021 23:51:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729377AbhAGXvM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 7 Jan 2021 18:51:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729047AbhAGXvM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 7 Jan 2021 18:51:12 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D067AC0612F4
        for <linux-remoteproc@vger.kernel.org>; Thu,  7 Jan 2021 15:50:31 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id r9so8005880otk.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Jan 2021 15:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NqN+liZ8bQOGKYLOo+A64hpDDNU7IHxrgUmkHKS7+20=;
        b=vnc0LMRTF59D+KMFH856gCjA9A/mEA6GmOSoE3AUIRX+Uu0jbIGUfFKSwfGAjT6NWE
         wFR/lBAfTeQ4Ul+DC7gjtKNriSjPGwaDe8St6FKwMMtaREuIWOWTXNYlP2yNccu6yROP
         6K73NL+U4CdmCrUKalYG9xHVfE9CY0ynRCaEtcAOYMdKG4X3iGvNqvL8Zby6fYaU/LTL
         mDlkcuhcj883kNn9NVyNJYk6s9oYQ/O8wLc0MKnMQ8IRUPpscSxcfYy2njpuJyJOdxun
         4o5rL97dfUlyfrJl8UH+IMBDXpgz7l2kNdu3zfPrYsLQlVf1BGt0Nvb7dI9ngbqBF9JW
         2+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NqN+liZ8bQOGKYLOo+A64hpDDNU7IHxrgUmkHKS7+20=;
        b=MLlpyTy1Eqradx0jSSdG5lDtwtXOBCx6e1Nl4BWeYwf5i1LbqMyMFOkkUXZF4mjWPM
         um9t+bG+Luk5Ip/xxn2LC/j40CT8F0L1rp3X/+36d0o6oaq3CgJRq2rLfHeCtiiwp6o/
         iriG9y4nJwKf6ihx0JuAP0If4GyPGVruDfjHRZ7hPOBd0MQ+53p4A9AfFUee6mul0aX/
         JVWhIrA2TImV5pGwcdeJQF9GR0h3UuJnp8yI0eIGg4JGK+D68XoEmG8nvDakNsZn8fSv
         PKsPABkNPUkUdyC5uC5kdFvIpEkp8+jxGBLgvvyElagtC+S1y91nnOW8Ttla+myhvMir
         1ClQ==
X-Gm-Message-State: AOAM532jf29iDq1+6R9wjkhqQoP4C30uBsnEJnczUeOtf20m4pV0HpuW
        M0maHuYiU2QePUUveYl+/aM0/A==
X-Google-Smtp-Source: ABdhPJz+5OZ9RlFYIXbkmJPStvwQ1ELiEsdLDm6xDRL2BPYhWWAJD2dgMsXw/Cv2KoI1Yu07I1kFiw==
X-Received: by 2002:a9d:7e8c:: with SMTP id m12mr734389otp.38.1610063431220;
        Thu, 07 Jan 2021 15:50:31 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v207sm1620439oif.58.2021.01.07.15.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 15:50:30 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Validate p_filesz in ELF loader
Date:   Thu,  7 Jan 2021 15:50:53 -0800
Message-Id: <20210107235053.745888-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Analog to the issue in the common mdt_loader code the MSS ELF loader
does not validate that p_filesz bytes will fit in the memory region and
that the loaded segments are not truncated. Fix this in the same way
as proposed for the mdt_loader.

Fixes: 135b9e8d1cd8 ("remoteproc: qcom_q6v5_mss: Validate modem blob firmware size before load")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 66106ba25ba3..2b59e0cbdce1 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1210,6 +1210,14 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			goto release_firmware;
 		}
 
+		if (phdr->p_filesz > phdr->p_memsz) {
+			dev_err(qproc->dev,
+				"refusing to load segment %d with p_filesz > p_memsz\n",
+				i);
+			ret = -EINVAL;
+			break;
+		}
+
 		ptr = memremap(qproc->mpss_phys + offset, phdr->p_memsz, MEMREMAP_WC);
 		if (!ptr) {
 			dev_err(qproc->dev,
@@ -1241,6 +1249,15 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 				goto release_firmware;
 			}
 
+			if (seg_fw->size != phdr->p_filesz) {
+				dev_err(qproc->dev,
+					"failed to load segment %d from truncated file %s\n",
+					i, fw_name);
+				ret = -EINVAL;
+				memunmap(ptr);
+				break;
+			}
+
 			release_firmware(seg_fw);
 		}
 
-- 
2.29.2

