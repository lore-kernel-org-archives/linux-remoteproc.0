Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EC1C43334
	for <linux-remoteproc@archiver.kernel.org>; Tue,  5 Jul 2022 12:09:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234346AbiGEMJX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 5 Jul 2022 08:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235283AbiGEMIu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 5 Jul 2022 08:08:50 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85B0D80;
        Tue,  5 Jul 2022 05:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1657022927; x=1688558927;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=1TnrlON6jGNxZUFCvOW+lAd5eWA6M54MhqVKSC7Hbgk=;
  b=g6IAYkKjqL8X4S1rdr0Ldz+RuET+5IUkYznX+51k4y5D9aht1syxDID5
   pSXiIe+RI5OmzFRvKWrRzXaF3wNtka+17cpEf7Eyl7Q3OCu4n7W39c23Q
   G+wxCcBJln4Rgp38NesxfNXicNX04ep1aqKaCeqLc8judH6yVtlBi924k
   I=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 05 Jul 2022 05:08:46 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 05:08:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 5 Jul 2022 05:08:45 -0700
Received: from blr-ubuntu-87.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 5 Jul 2022 05:08:42 -0700
From:   Sibi Sankar <quic_sibis@quicinc.com>
To:     <bjorn.andersson@linaro.org>
CC:     <agross@kernel.org>, <mathieu.poirier@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <konrad.dybcio@somainline.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Subject: [V3 2/7] remoteproc: qcom: pas: Mark va as io memory
Date:   Tue, 5 Jul 2022 17:38:15 +0530
Message-ID: <1657022900-2049-3-git-send-email-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1657022900-2049-1-git-send-email-quic_sibis@quicinc.com>
References: <1657022900-2049-1-git-send-email-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Siddharth Gupta <sidgup@codeaurora.org>

The pas driver remaps the entire carveout region using the dev_ioremap_wc()
call, which is then used in the adsp_da_to_va() calls made by the rproc
framework. This change marks the va returned by this call as an iomem va.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 297700f87fe8..df13cfc3aeb8 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -289,6 +289,9 @@ static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iom
 	if (offset < 0 || offset + len > adsp->mem_size)
 		return NULL;
 
+	if (is_iomem)
+		*is_iomem = true;
+
 	return adsp->mem_region + offset;
 }
 
-- 
2.7.4

