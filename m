Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C225CC433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:50:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BE9A64E44
	for <linux-remoteproc@archiver.kernel.org>; Thu, 11 Feb 2021 23:50:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhBKXt6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 11 Feb 2021 18:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbhBKXs4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 11 Feb 2021 18:48:56 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42608C061A32
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:39 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id l18so4361291pji.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Feb 2021 15:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XYqKe5JHKTsf6qqgvmLT8SEOr6JSbsFQUrC6la75+Tk=;
        b=JdchHoa7ZVlV5+MdQYZdmvDbjBv5SZjvgzlftSjTAhzph9zIe1p3ew7E3tWtnmAOCq
         lGFo9sYQDG5tnaXPXoZoXsJxuAle5HmFzbLqhh5pCtluiiaK/nbN+MUixIqVYE1eRGEi
         s//hd0GCI6nxFs6WVeTc6uH8o7x8Utj9y18AWzaus3ak/KiN0BCqKInCWbXLoN0saB/Q
         7pU7ki04U0wtCaOK8bWw4dxnxDblsoe+jjI6+AA9VDTHoH/s1R3Joa3bhSsR9Z0MWlG7
         5+gNu0rtYfxoa5iH/WSEg6d4ZrebBa+a7T4Zg2pg01qVMSMJgBVdiUvOlVKwmkMcUU7L
         zTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XYqKe5JHKTsf6qqgvmLT8SEOr6JSbsFQUrC6la75+Tk=;
        b=NojX+pi0GauZ8XXFwG09GRbhCE6gnycH4s6BwVW8FSOnQw3v+Hs/DGWnBxWu2+W3qX
         yaq1Kw/WcebDlxtbiU04aM+Z1EM7GtBsd/ibo0wtTPrPgXvlM4XKgWYmnRdJSz9R0ejO
         dvyOjHDloCbZpx8SKuSPw2b2fBjuxVDsMwflpxfJG05GKC5ZoxKy+X4ADpcwsfmZ49oM
         cdkxXM0vlgPytoToP3tfA0Ctr8VnSzhfc1/ddyMp9VCJmosNmEymFzIRbWWCAxzCAUw/
         6zhq2Iiwxz8torDkFI1xDN5uEFnAAqVOvtCoCJQiMiG0Fyoo14FiGtrKIhufx3KH5P1m
         hnlw==
X-Gm-Message-State: AOAM531CkCn7blBis3ptVdNlMfTU2OlpbjaKsgkg4Wr9NzKY44408CW4
        cdZa2d5HvSUALkJKvxcBojLdvA==
X-Google-Smtp-Source: ABdhPJzqeREhedgDISoJMwtA5O0xqryR2OhQ578kviSbwW9ctlvFUgjKaXOFr7EihYkWh1iqKJHyJw==
X-Received: by 2002:a17:902:8c8f:b029:e0:1663:fd34 with SMTP id t15-20020a1709028c8fb02900e01663fd34mr489602plo.84.1613087198802;
        Thu, 11 Feb 2021 15:46:38 -0800 (PST)
Received: from xps15.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id iq6sm5932740pjb.6.2021.02.11.15.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 15:46:38 -0800 (PST)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        arnaud.pouliquen@st.com
Cc:     robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 10/19] remoteproc: Add new detach() remoteproc operation
Date:   Thu, 11 Feb 2021 16:46:18 -0700
Message-Id: <20210211234627.2669674-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
References: <20210211234627.2669674-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add an new detach() operation in order to support scenarios where
the remoteproc core is going away but the remote processor is
kept operating.  This could be the case when the system is
rebooted or when the platform driver is removed.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 include/linux/remoteproc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 51538a7d120d..eff55ec72e80 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -361,6 +361,7 @@ enum rsc_handling_status {
  * @start:	power on the device and boot it
  * @stop:	power off the device
  * @attach:	attach to a device that his already powered up
+ * @detach:	detach from a device, leaving it powered up
  * @kick:	kick a virtqueue (virtqueue id given as a parameter)
  * @da_to_va:	optional platform hook to perform address translations
  * @parse_fw:	parse firmware to extract information (e.g. resource table)
@@ -385,6 +386,7 @@ struct rproc_ops {
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	int (*attach)(struct rproc *rproc);
+	int (*detach)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
 	void * (*da_to_va)(struct rproc *rproc, u64 da, size_t len);
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
-- 
2.25.1

