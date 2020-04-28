Return-Path: <SRS0=Jgy+=6M=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB989C83003
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Apr 2020 00:01:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86C7E2078C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 28 Apr 2020 00:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GEmbiSmZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgD1ABp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Apr 2020 20:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726279AbgD1ABp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Apr 2020 20:01:45 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83EBEC03C1A9
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2020 17:01:45 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id g2so7624746plo.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Apr 2020 17:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8nzlTHfR7hFdD1oizXMfz09Kcd8VyPhh+IZvp5hf/Cw=;
        b=GEmbiSmZ+SKuKCwgVlQekXj/+yFNzE1P+atI4JedZgi2WiZmpqEGCN3xp3WGKlHhPu
         BFIRnFlFlehyGzA83Wczy6rwlBjJ5t6ZrjCxQ4f+Iz7PziWvQq6EB0BMpEkAfWy1MdtE
         ekvEaAoK1rQT7XQ2SWd3ZhjQnCNINewMLF199NrbBwsFuiprwGNqlJhSuO2wQQPia4ib
         Pv7SL0pelZ/hMVe1JsWf4o59FIH8iqnQx+T+CgGJ7SDny5ix5sYSzihMDuGt6EoQNPn5
         sy3nK1hG5xkLqTtRaIh8hm99PthwafIIgn2iSk4ty0Dpfrit+RfhAw4T1Zn4MURQFVhb
         WdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8nzlTHfR7hFdD1oizXMfz09Kcd8VyPhh+IZvp5hf/Cw=;
        b=n3IoUwwIh26FzkIc+TkNiV9gqOZbYt61DHSg+kQ2egsSdTjdei8FzcC7BSHApWgN82
         eaoWLAjz7hx79RGEZqZW5laTxgqZOonrsoMLEzWnbsvmqG4ZsHkHmjRA5z6AtItYH/nE
         NG+24Ink0Cb3FniSinBz4Nu/yLEDVg4kpzm1Fzf11puFyrvGYrh6EW9vp+oXJkRre7iz
         QjCVavJFfVffSM+Uk5O1Rxx3G2Rtp25dnQgqLmP+m3O38iMaIeSqWEIVTCCGbbtNlqTG
         QyYX3uSWmF0yrDou6XwQ63vFJOqpY10p4bIL7/BNhSd1Qj7mBnGW8fAYHWvH104F3olU
         9rUA==
X-Gm-Message-State: AGi0PuZI9UAx8k92eybRui9FyWF87/uGaWlnXZTt4y2tl0VQzPQzEnpp
        jMBMkO4ZceggJrvwkwc7GUc+IA==
X-Google-Smtp-Source: APiQypIonDTh3jzFIn6vMcUkguT9HYXi2h6aOEXE5aT9m0hdaIn7sOZOXacCYA37T7NFEN0tHe3hjg==
X-Received: by 2002:a17:902:b187:: with SMTP id s7mr27031025plr.0.1588032104765;
        Mon, 27 Apr 2020 17:01:44 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id cp22sm363850pjb.28.2020.04.27.17.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 17:01:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom: pas: Add SM8250 remoteprocs
Date:   Mon, 27 Apr 2020 17:01:09 -0700
Message-Id: <20200428000110.2958704-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add the SM8250 audio, compute and sensor remoteprocs to the PAS DT
binding.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.txt         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
index 9938918b2fea..49ec30454198 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
@@ -21,6 +21,9 @@ on the Qualcomm ADSP Hexagon core.
 		    "qcom,sm8150-cdsp-pas"
 		    "qcom,sm8150-mpss-pas"
 		    "qcom,sm8150-slpi-pas"
+		    "qcom,sm8250-adsp-pas"
+		    "qcom,sm8250-cdsp-pas"
+		    "qcom,sm8250-slpi-pas"
 
 - interrupts-extended:
 	Usage: required
@@ -44,6 +47,9 @@ on the Qualcomm ADSP Hexagon core.
 	qcom,sm8150-adsp-pas:
 	qcom,sm8150-cdsp-pas:
 	qcom,sm8150-slpi-pas:
+	qcom,sm8250-adsp-pas:
+	qcom,sm8250-cdsp-pas:
+	qcom,sm8250-slpi-pas:
 		    must be "wdog", "fatal", "ready", "handover", "stop-ack"
 	qcom,qcs404-wcss-pas:
 	qcom,sm8150-mpss-pas:
@@ -105,10 +111,13 @@ on the Qualcomm ADSP Hexagon core.
 	qcom,sdm845-cdsp-pas:
 	qcom,sm8150-adsp-pas:
 	qcom,sm8150-cdsp-pas:
+	qcom,sm8250-adsp-pas:
+	qcom,sm8250-cdsp-pas:
 		    must be "cx", "load_state"
 	qcom,sm8150-mpss-pas:
 		    must be "cx", "load_state", "mss"
 	qcom,sm8150-slpi-pas:
+	qcom,sm8250-slpi-pas:
 		    must be "lcx", "lmx", "load_state"
 
 - memory-region:
-- 
2.24.0

