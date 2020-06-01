Return-Path: <SRS0=OrS8=7O=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B90EC433E1
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:56:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F04F20825
	for <linux-remoteproc@archiver.kernel.org>; Mon,  1 Jun 2020 17:56:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jDpwCbFH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgFAR4K (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 1 Jun 2020 13:56:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbgFAR4J (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 1 Jun 2020 13:56:09 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB89AC05BD43
        for <linux-remoteproc@vger.kernel.org>; Mon,  1 Jun 2020 10:56:08 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id q16so261137plr.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 01 Jun 2020 10:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u4RFNd9FFVlTeJLx02SSeMMgnm0C5Ocm0tA+r0cHo1Y=;
        b=jDpwCbFHHHOdFSOjq6a7d0+Jeda1zij/0s2YyarOhbL1q9jo+DgjNl/BLDo6Qai070
         2WLbe7LDYhcsR6Al9tIXcUq1hjSNSkJ5b37HvFu9BL8DAe3zZ4z6jWGtsBOh2laDL+VM
         IgVYA3Iv8FKeM1mbOVzl5grl6P2IqcPgjEioI8VvPUiDEJQ+s5y90Ie9Llm9B/aJnsaU
         1hJvyLWdtmO4dmDCoEE3OeIZsDrXfT+6CtGYWf0Ggvlf2vTy+KrKvrZ8VY1hoTFyQSkm
         rHd7p4AW41iHcMeRgg5GQN+kpaRrhnsrW+1K29gPT5lgGZ3DvVXMWW5RjsknN+xU8GPN
         uZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u4RFNd9FFVlTeJLx02SSeMMgnm0C5Ocm0tA+r0cHo1Y=;
        b=luBVkt4sufwplLAUxb32y6/qIqDm2SbfS/sUHUKfGPAiRrd1EJR32Snytg23t3IHE/
         Umfsg4W2Nz3zaYADTPjikmrqgImxGpJixVhY0HadF2jyQL4DYD/6w/K3ijT6MixN7uam
         WOvYVaKWV9c0bOSqKbHztUxdUYec/MxEn0PW3qVKA+vtmG8imOBovL4P+a98X6LKfiV6
         5TLQWylrwIoOapJbiPFXJ918ruwnjAymTuuHUxWFv6/fHLd6iSTJhrwPr15mr/DwPOxV
         GkXlyy7HNCTsI7OkHaFJf9L/L+++Liar+B+LsqX5qB4XdD+kXuwz+NY0ipS6DaII90TT
         keDw==
X-Gm-Message-State: AOAM532BMZ33C423WzhL2wpYlLF3y6jXVjiBYQ44RSXv+AzqczyXw8fp
        zMROkoh8WBIr8gxqlBSqZY40AQ==
X-Google-Smtp-Source: ABdhPJyPL4cWZZg61WZPJde8LyrsdhiEW14iaC+dVSSpI6qDWDL94WZSK2PfRnxce1jBtWI4z5ay6w==
X-Received: by 2002:a17:902:8d83:: with SMTP id v3mr4455323plo.27.1591034168449;
        Mon, 01 Jun 2020 10:56:08 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id p7sm64771pfq.184.2020.06.01.10.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 10:56:08 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 11/11] remoteproc: stm32: Update M4 state in stm32_rproc_stop()
Date:   Mon,  1 Jun 2020 11:55:52 -0600
Message-Id: <20200601175552.22286-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200601175552.22286-1-mathieu.poirier@linaro.org>
References: <20200601175552.22286-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Update the co-processor state in function stm32_rproc_stop() so that
it can be used in scenarios where the remoteproc core is attaching
to the M4.

Mainly based on the work published by Arnaud Pouliquen [1].

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/stm32_rproc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 77a20a638e0c..ad0307aaf3d5 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -503,6 +503,18 @@ static int stm32_rproc_stop(struct rproc *rproc)
 		}
 	}
 
+	/* update coprocessor state to OFF if available */
+	if (ddata->m4_state.map) {
+		err = regmap_update_bits(ddata->m4_state.map,
+					 ddata->m4_state.reg,
+					 ddata->m4_state.mask,
+					 M4_STATE_OFF);
+		if (err) {
+			dev_err(&rproc->dev, "failed to set copro state\n");
+			return err;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.20.1

