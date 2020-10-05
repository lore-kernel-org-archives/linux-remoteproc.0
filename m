Return-Path: <SRS0=OhS6=DM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCB5C4363A
	for <linux-remoteproc@archiver.kernel.org>; Mon,  5 Oct 2020 16:06:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A91EC207F7
	for <linux-remoteproc@archiver.kernel.org>; Mon,  5 Oct 2020 16:06:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="hjbZvQ79"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgJEQGU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 5 Oct 2020 12:06:20 -0400
Received: from mail-dm6nam12on2056.outbound.protection.outlook.com ([40.107.243.56]:36961
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727127AbgJEQGU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 5 Oct 2020 12:06:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tdn1KSklG7IJx3fVuZrqDv4g74xMfdK30b9aoSRRqj5OMUkiegvp1uXcfRnLchAJQ2H1miHyn8FuDLBDshdq036DmYMqj9LoAT0W8Qv4h4zZhkPVeX1MAWL6cTHaw0BAXWTmp/w5gMyj9QZOOWpU927W73RiRGRS5PssYGLaUc/nj6hNci4wDg6k7HdrRxOltnSgPE7f7kdsnPp9R4aW5Io3X5qWi5BgIm6YzpuNj/DD9g0aAHOaWX/me9Dhk85/ytlSrN0Sgu7v4Fu8BSzJXvqmfbESgjsVSEfkWs3UllvkemGzf8zBsV2+VS6NcSxi5RWip07KwCxbA3BqpbGusg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5xh2iMbOUuYykH3VtoEpRrVeANMsj9APMUlrpsyzW0=;
 b=IqnWPhDq9RlTow57pNCbGW63Sn3PnMm4QR7oTeJ34Ecx9TqWWUFtn/PJfIvb8WF1b/KfAXhV8OVTMS+3NwP7MfzjGO0kuJ+yb3djhmMl5ESpEQfcX02UKMbf48Sz7p6qzI/mHfD5kaywDDevuFW/X7DW4elZB0bMpLop6Lu+B1Z/OP6WpinhCWrGzt0MwnqZZyQMSG6M/qpXLb493AfYE/SWqKLmf/JOTTwROplfeNq0vckc78kw1WHahwGSL7ZZz8WZyqvi4Bv/EjvEDwF5GJrG4y67y6I+bS7ZbISayLDHiq/ioGv43vMtBYveTfuS4/e5XW+IZTz09V4GOGdkVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5xh2iMbOUuYykH3VtoEpRrVeANMsj9APMUlrpsyzW0=;
 b=hjbZvQ79GjffKfXzQRJUmcUGq7pUf0MNinxAYMDxig55Qte7iFKhhWQk3G1K+gFmOp/KR6v7rCilov9dRMckPaeiIpzNIn+kvlTbvSJKA9NVkryehlHDfM+vCrAov4dHWv3zPGbRBkakxXvESnIOEhwSxYTgGrQcis/aMzI0x70=
Received: from DM5PR07CA0033.namprd07.prod.outlook.com (2603:10b6:3:16::19) by
 BY5PR02MB6419.namprd02.prod.outlook.com (2603:10b6:a03:1f8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Mon, 5 Oct
 2020 16:06:16 +0000
Received: from CY1NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:16:cafe::fc) by DM5PR07CA0033.outlook.office365.com
 (2603:10b6:3:16::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend
 Transport; Mon, 5 Oct 2020 16:06:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT027.mail.protection.outlook.com (10.152.75.159) with Microsoft SMTP
 Server id 15.20.3433.39 via Frontend Transport; Mon, 5 Oct 2020 16:06:16
 +0000
Received: from [149.199.38.66] (port=36685 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kPSzf-0001tl-1N; Mon, 05 Oct 2020 09:05:43 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kPT0C-00026i-B5; Mon, 05 Oct 2020 09:06:16 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 095G6EA9027459;
        Mon, 5 Oct 2020 09:06:14 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kPT0A-000260-BX; Mon, 05 Oct 2020 09:06:14 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     ed.mooring@xilinx.com, sunnyliangjy@gmail.com,
        punit1.agrawal@toshiba.co.jp, stefanos@xilinx.com,
        michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v18 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Mon,  5 Oct 2020 09:06:10 -0700
Message-Id: <20201005160614.3749-2-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201005160614.3749-1-ben.levinsky@xilinx.com>
References: <20201005160614.3749-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fbe53d41-58af-4220-3d1f-08d86948970f
X-MS-TrafficTypeDiagnostic: BY5PR02MB6419:
X-Microsoft-Antispam-PRVS: <BY5PR02MB641976B9E57D8F27A3B8FB1CB50C0@BY5PR02MB6419.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /heGMoLeU2DZ6iUwNU3YDBudT0JViB0ltS2+Nrdwsi5qrUVSgzSxRxm0+gPoYLtS5BDzfDtu6ebs2iiP2MEoe7QBN7gWZgih1bwWqyYC17EcqYyjdpDmSrfPfRoE9yRN3z8LuHgDtoeXCVvIYSRZxHAg/FcJ9VmMdWk8r1fCLceZC+tXV96A54Zbuas31BDXDeF+V7ZqV6m6ym7KDfrVsC8gf7BcP1/tpVe+8X7BKu0FVbLk+kah+tJ8KBrefjS6lluVnEu6YNXJwYSwtFCrBfaaSjSpyyCjnozNFfX2XApUMh9AGd/cOf4C1XiQQWGlYuJs9hQa5tbChMox4tZ1FRR7ATbVtKUf3r07bE1QE3BKDp6MA3mxTkwQGuabv5+2lYvSeZbB6Qimt5f4UvV+8w==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(376002)(346002)(396003)(39860400002)(136003)(46966005)(6666004)(82740400003)(478600001)(47076004)(186003)(9786002)(44832011)(70586007)(7696005)(70206006)(5660300002)(26005)(81166007)(8936002)(1076003)(8676002)(4326008)(83380400001)(36756003)(316002)(82310400003)(2906002)(2616005)(336012)(356005)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2020 16:06:16.5715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe53d41-58af-4220-3d1f-08d86948970f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6419
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

