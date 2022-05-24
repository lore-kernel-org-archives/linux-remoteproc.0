Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A320C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 24 May 2022 12:45:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237434AbiEXMpx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 24 May 2022 08:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234414AbiEXMpw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 May 2022 08:45:52 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0FA8BD1A;
        Tue, 24 May 2022 05:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653396351; x=1684932351;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=j970COsscK+URMhxIVKNSRPwlSP5frxHFhho/b8UIz0=;
  b=yWS4nop0+rmc3QVpz417ZmZnRpTUV0kFczTWDRhMhAUpY0e4cOSKy254
   Lk91QYkVqAbAzyajpy22FnHg84PaZTqszhEUztae9VFuZmN9tmhXSfMRy
   grxjhHkCydCw02RiMs1ySbUSqChQboIXx2lj1EOBVf349j6ppyGXLeOGD
   Q=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 24 May 2022 05:45:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 05:45:50 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 24 May 2022 05:45:50 -0700
Received: from blr-ubuntu-87.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 24 May 2022 05:45:47 -0700
From:   Sibi Sankar <quic_sibis@quicinc.com>
To:     <bjorn.andersson@linaro.org>
CC:     <agross@kernel.org>, <mathieu.poirier@linaro.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Subject: [V4 0/2] Add modem debug features
Date:   Tue, 24 May 2022 18:15:33 +0530
Message-ID: <1653396335-6295-1-git-send-email-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The series adds support for the following modem debug features:
 * Pass on MBA log info to imem
 * Add panic handler for mss 

V4:
 * Restart the update mba info to imem patch that was dropped from V2
 * Add panic handler for mss driver
 * Drop patches that have already landed

V3:
 * Drop mba text log extraction support since its already
   picked up by Bjorn
 * Fix dp_fw leak and create a separate func for dp load [Bjorn]
 * Reset dp_size on mba_reclaim
 * 2 new patches are included they validate mba/modem blob size
   before load

V2:
 * Use request_firmware_direct [Bjorn]
 * Use Bjorn's template to show if debug policy is present
 * Add size check to prevent memcpy out of bounds [Bjorn]
 * Don't dump logs in mba_reclaim path [Bjorn]
 * Move has_mba_logs check to q6v5_dump_mba_logs [Bjorn]
 * SDM845 mss was incorrectly marked to support mba logs
 * Drop patch 3 where mba text logs are added to imem

Sibi Sankar (2):
  remoteproc: qcom_q6v5_mss: Update MBA log info
  remoteproc: qcom_q6v5: Introduce panic handler for MSS

 drivers/remoteproc/qcom_q6v5_mss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

-- 
2.7.4

