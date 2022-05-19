Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CF0C433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 May 2022 07:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234774AbiESHdn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 May 2022 03:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234693AbiESHdl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 May 2022 03:33:41 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E25939C4
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 00:33:37 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id m6so5226123ljb.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 19 May 2022 00:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Kn3MeT+ZvRFweey5kITF1vzOQi74c2SDJdwROiI/Lk=;
        b=ilTTPIipkWBxO1IaY11XtVn1o41c1NNeH3HQ1jtxUFa8RzT3VARzZR7Fmg2Jk7WWLx
         O8QTG382nelo+wJ4wWDAQJbBlktTOAmaQg0lLAtJ/+n6TuXLbeXuZst+Mb4AO017MCCa
         AZxX6GAK3KNi15u/C+cIIXsjWgf1UTNScr8LsVGrH52H1CVvGmlLA+1Mqw8TTs9sG7nb
         ztV41qf61EPd46O1Ijk8JcyfkOxvlK8HciUKk7QKy8CkWWQ2ecVdN2JhufHnc/WHcLc7
         v99aAi39UMdl4iKuZ+m49Etb6u29LL6XaSRMFvvePO68zkThhap/qngbMnDS28R0NfeP
         WKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Kn3MeT+ZvRFweey5kITF1vzOQi74c2SDJdwROiI/Lk=;
        b=AEq4C1+k9UBNXbb8j3Uzz4hIFRs/Pj8/3vDeipFs4OMioNLPAwHIpiEJr/tjtRZxXB
         GfkOfPDG1t1XLXn1tL7LJNJxgUBntVuAjk/yWJSzIF8o+Xk62WB3TSELfYZoHwxzMKxd
         aU3ZdxLZZuF97ioVuROMmkI2ukXgJD/1MLrge3NhBQ/wD1HkbyFuMXBDeNC6WQFNDrJG
         vI9udTij0NhDuZiDjn5J/nh3c/yms7Rv8V+kevmquqcDxxeiBpFd2ovUV95fbtTgBisI
         bkzTA6DAXuiEnpRMQauLeQpKtkuY7/6uKFSIlbLwJBS1EUioD7D3/Y8ELSseC+goHDpV
         Tecg==
X-Gm-Message-State: AOAM531+3X4OQHwG7EbFw3w1Cn9jVBbinLWPYCGhcshm03p+SHn3h5zJ
        iErYkNGItvKDzaq3GRlUb7wx8w==
X-Google-Smtp-Source: ABdhPJwKp9IKQBiIdQE8Whd7ZeY2r0L7LvOat4yNmMAjUGkWeprbz5x/NPSkoQ/NgXwlb51ACgNw4g==
X-Received: by 2002:a2e:879a:0:b0:250:bdb3:7ab4 with SMTP id n26-20020a2e879a000000b00250bdb37ab4mr1861808lji.55.1652945615850;
        Thu, 19 May 2022 00:33:35 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a16-20020a056512201000b0047255d21159sm187484lfb.136.2022.05.19.00.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 00:33:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] rpmsg: qcom: correct kerneldoc
Date:   Thu, 19 May 2022 09:33:30 +0200
Message-Id: <20220519073330.7187-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220519073330.7187-1-krzysztof.kozlowski@linaro.org>
References: <20220519073330.7187-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Correct kerneldoc warnings like:

  drivers/rpmsg/qcom_glink_ssr.c:45:
    warning: expecting prototype for G(). Prototype was for GLINK_SSR_DO_CLEANUP() instead

Also fix meaning of 'flag' argument.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>

---

Changes since v1:
1. Split series per subsystem.
2. Add tag.
---
 drivers/rpmsg/qcom_glink_ssr.c | 2 +-
 drivers/rpmsg/qcom_smd.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_ssr.c b/drivers/rpmsg/qcom_glink_ssr.c
index dea929c6045d..776d64446879 100644
--- a/drivers/rpmsg/qcom_glink_ssr.c
+++ b/drivers/rpmsg/qcom_glink_ssr.c
@@ -39,7 +39,7 @@ struct cleanup_done_msg {
 	__le32 seq_num;
 };
 
-/**
+/*
  * G-Link SSR protocol commands
  */
 #define GLINK_SSR_DO_CLEANUP	0
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 7c8c29f6c91d..7c9ede6c7d18 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -729,11 +729,11 @@ static int qcom_smd_write_fifo(struct qcom_smd_channel *channel,
 }
 
 /**
- * qcom_smd_send - write data to smd channel
+ * __qcom_smd_send - write data to smd channel
  * @channel:	channel handle
  * @data:	buffer of data to write
  * @len:	number of bytes to write
- * @wait:	flag to indicate if write has ca wait
+ * @wait:	flag to indicate if write can wait
  *
  * This is a blocking write of len bytes into the channel's tx ring buffer and
  * signal the remote end. It will sleep until there is enough space available
-- 
2.32.0

