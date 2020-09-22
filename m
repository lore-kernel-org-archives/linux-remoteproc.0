Return-Path: <SRS0=ZH1X=C7=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA37BC2D0E2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 22:39:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AECAF20936
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Sep 2020 22:39:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="IIXxnxCY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgIVWjl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Sep 2020 18:39:41 -0400
Received: from mail-dm6nam10on2088.outbound.protection.outlook.com ([40.107.93.88]:27105
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726548AbgIVWjl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Sep 2020 18:39:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPjaYDcCZVLDrc954S/fZ4NmjGI4EM9mXoOt7HTmHExJc0sU201XBA5OI6y49gg/fpF1XX+iDcV/Ga0k+RgQ+x2wfw1jbFgWdnT+kAy20c/xSXzgzxpL9Qx49oVPT3ZJi7EjpHSngtXWT0sqASgvHnlmCfllsL6w/28+edzpMxLXdlMo8EXn0Ze8/JpwxpEHl5Y2j3dET8Q6LvklIcmByDzOUApI4MdTZKiU5JGnCpH7ojAL3h6NgRXAqVsLh9u65OlPYoikCsrCfDlNFFK5bT5+nET7KoY24lbVMTUkHT9DOXRHVzy8V4KsX6yTRbRx41atcwz3zYIJ076OUYfgbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5xh2iMbOUuYykH3VtoEpRrVeANMsj9APMUlrpsyzW0=;
 b=L++UOqkna9r+FkhGHfHojDg3IvTCjIa3+puCSXqOtcZ1DljP/MhyvqaFNzyul3baFC1H2DVA2FAvXT5/ksZrPHSRacvZG1UOjLkH7js0XWAQinYqKuIlXtjGB2MtRm8SFoeB6dNPV5Qq2TZs7S/wWyHlX1SU/lR/3lqnK4J/rgJMIPdmwlI49WQ8OinMrwAZD7NHFrJzSfi9LRxpXFTX+iQMRdr2KavSdpdxvyIQpiIwEDPaPwJ0K0jfQXhIR91OyGSWY0Tkap7C9nFBpLYsfL1sn5sm13mu3Svb5gogd0De+3bPSTOJYiaABXe3uHe6iV+rs28ntBM/M4Risd15pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5xh2iMbOUuYykH3VtoEpRrVeANMsj9APMUlrpsyzW0=;
 b=IIXxnxCYOvNDYJpM8UbtuySNY7tD084sIE5qd2Nixfaf83MUTOCej7YUUIW811mkYFy8x8zNslYqIrBdic+m0FUSAsyZTvg1ne0QJ/6tOoLvwSCw1+u7UBG6bQchVSxVkY7uC+lxQa61GiyTs7AVftYMJJsXr3NCE+PBARNqzOA=
Received: from MN2PR15CA0014.namprd15.prod.outlook.com (2603:10b6:208:1b4::27)
 by BYAPR02MB5831.namprd02.prod.outlook.com (2603:10b6:a03:118::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 22 Sep
 2020 22:39:38 +0000
Received: from BL2NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:1b4:cafe::bd) by MN2PR15CA0014.outlook.office365.com
 (2603:10b6:208:1b4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Tue, 22 Sep 2020 22:39:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT036.mail.protection.outlook.com (10.152.77.154) with Microsoft SMTP
 Server id 15.20.3391.15 via Frontend Transport; Tue, 22 Sep 2020 22:39:37
 +0000
Received: from [149.199.38.66] (port=42777 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKqwU-0000pm-Pp; Tue, 22 Sep 2020 15:39:22 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKqwj-0002tQ-L5; Tue, 22 Sep 2020 15:39:37 -0700
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08MMdUal014074;
        Tue, 22 Sep 2020 15:39:30 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKqwc-0002rc-8E; Tue, 22 Sep 2020 15:39:30 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v16 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Tue, 22 Sep 2020 15:39:26 -0700
Message-Id: <20200922223930.4710-2-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200922223930.4710-1-ben.levinsky@xilinx.com>
References: <20200922223930.4710-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5f618682-0694-4f41-9961-08d85f48633b
X-MS-TrafficTypeDiagnostic: BYAPR02MB5831:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5831FDF4DF5319E010ABD6F1B53B0@BYAPR02MB5831.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Bj3sjZw2/BhF1aYtVTgRTh/3g9OLSj6PrIyvRC9EZbHZvbP515OCYOuF+CzJItW2FA1bLeZ/NVWGjLbwQW6Rt5wpGz22a2cq/6/wm1cp87gNG/AcTT3qsi7pERZWh5wpW/o5x8xgjvZs7ioRB84wAYXxZ53s2d/K8SEeWrhzkdVUytRgp+nmSHPu0XZGjc7esUa7yq2NTUGN+NRWuNk3TnB9Usm5STORgrEL2sSJQ4WRV+ZdOblbx9k9imkU2w7C511Z3IBDe+TJuDMgLN7rQwSjMpQ/6M8g9+GR27EgWgWwNMn3ioRNr7n6nHpaeljY1bhOy4Z2BTgHvzBXfyA/y7rmCkrxJT/7JVtkNYWv0U9C/yW6sfZRsCl77BxnGUwQ82TM4Ot/ud34G+Pa/isqvdwdTkdCBqca3V8P7biFargJfrwnq8opNDVKBieWI6A
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(346002)(376002)(396003)(39850400004)(136003)(46966005)(478600001)(70206006)(2616005)(44832011)(336012)(36756003)(9786002)(426003)(8936002)(7696005)(186003)(8676002)(26005)(4326008)(2906002)(82740400003)(83380400001)(6666004)(316002)(5660300002)(1076003)(70586007)(356005)(47076004)(81166007)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2020 22:39:37.9969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f618682-0694-4f41-9961-08d85f48633b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5831
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add ZynqMP firmware ioctl enums for RPU configuration.

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
v3:
- add xilinx-related platform mgmt fn's instead of wrapping around
  function pointer in xilinx eemi ops struct
v4:
- add default values for enums
---
 include/linux/firmware/xlnx-zynqmp.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 5968df82b991..bb347dfe4ba4 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -104,6 +104,10 @@ enum pm_ret_status {
 };
 
 enum pm_ioctl_id {
+	IOCTL_GET_RPU_OPER_MODE = 0,
+	IOCTL_SET_RPU_OPER_MODE = 1,
+	IOCTL_RPU_BOOT_ADDR_CONFIG = 2,
+	IOCTL_TCM_COMB_CONFIG = 3,
 	IOCTL_SD_DLL_RESET = 6,
 	IOCTL_SET_SD_TAPDELAY,
 	IOCTL_SET_PLL_FRAC_MODE,
@@ -129,6 +133,21 @@ enum pm_query_id {
 	PM_QID_CLOCK_GET_MAX_DIVISOR,
 };
 
+enum rpu_oper_mode {
+	PM_RPU_MODE_LOCKSTEP = 0,
+	PM_RPU_MODE_SPLIT = 1,
+};
+
+enum rpu_boot_mem {
+	PM_RPU_BOOTMEM_LOVEC = 0,
+	PM_RPU_BOOTMEM_HIVEC = 1,
+};
+
+enum rpu_tcm_comb {
+	PM_RPU_TCM_SPLIT = 0,
+	PM_RPU_TCM_COMB = 1,
+};
+
 enum zynqmp_pm_reset_action {
 	PM_RESET_ACTION_RELEASE,
 	PM_RESET_ACTION_ASSERT,
-- 
2.17.1

