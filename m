Return-Path: <SRS0=uUKq=D2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B33C388F8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 22:40:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D786222EA
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Oct 2020 22:40:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="mulioCin"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388492AbgJSWkS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Oct 2020 18:40:18 -0400
Received: from mail-eopbgr760089.outbound.protection.outlook.com ([40.107.76.89]:44233
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388483AbgJSWkS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Oct 2020 18:40:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Prtx5naxZ445+a1ZDVipvDAHFcmrljFjvldPtkj3fkX/eqVHOUO21yFXPjuVtSNjA7P9cTzkuLFK2Ewu/IRx6LqlfwvIUyQz20WZ/qDXUxdYb8FU67JyBzPE2Vxb6m4pD64et/a/871RUXEiYknFyKv4JcUx+4t5QAKTP/i2WZNEZvxxCTgcb4TIfaLE+yX1jWVA740bUIW0HcXNwJV6wSqN2f+39q/S+u1kPN/CDmLPn+n31e+6gFB/OagamADSEMY49qlGYdgun5p6E5l5JFEtuExmeZ65KnH06M/kpxPtBcZA7E5Qw6GfMRHG2ZkBOfNdEhK0ogUrhNr6iYAaOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5xh2iMbOUuYykH3VtoEpRrVeANMsj9APMUlrpsyzW0=;
 b=Wb6nl96TALDXF9KUx5wVfyB0fZaMJhJjl+4jGJpGmIJOiC/G+73bH2vBbmkvVunrSvz13/G4wbLsLXm1pDKk3hcBxiP+CwyJqiwO9TcjDXEkCA4ZMbArGp+jZxt2kLgQDFsvtZGWhZYJHR27wKuLxIHv9VQ59TocUwiLmdqPFDKxInsfhyY3aVLInSmmU8CFoCrDvwI86QRdttipymTr7WAErFAzNIkU10dHijYgwaL/XGJpU7+O7GswncYkeJ2LQ8hMnQ/bPraH8HRDHI+Ivg7JXJ9mN0X87hhlkj2Uzv8TXV2prbyvewLTD5xCuzDaj/CHVd1q/7WWyhxy2+ZZYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5xh2iMbOUuYykH3VtoEpRrVeANMsj9APMUlrpsyzW0=;
 b=mulioCinFEEVco/J4qJZjGUsjZ+iBkcDJZlU/VX8AChx4Dvn58GbCrBjY1OmfPRs9CUoozqT0fNjfHeIAqd/903aycPGy7aF7CJhJxu2kiAZn3W3h+HRISunX5HX0it2YfjiPOdNbEVFLLh/XmYb5xYY5j6OjtZpsdztaeSARuY=
Received: from CY4PR13CA0032.namprd13.prod.outlook.com (2603:10b6:903:99::18)
 by DM5PR02MB2570.namprd02.prod.outlook.com (2603:10b6:3:43::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Mon, 19 Oct
 2020 22:40:15 +0000
Received: from CY1NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:99:cafe::de) by CY4PR13CA0032.outlook.office365.com
 (2603:10b6:903:99::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.7 via Frontend
 Transport; Mon, 19 Oct 2020 22:40:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT041.mail.protection.outlook.com (10.152.74.156) with Microsoft SMTP
 Server id 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 22:40:14
 +0000
Received: from [149.199.38.66] (port=33948 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kUdoF-0004r4-RY; Mon, 19 Oct 2020 15:39:19 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kUdp8-0007Tv-6w; Mon, 19 Oct 2020 15:40:14 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 09JMe75c012016;
        Mon, 19 Oct 2020 15:40:08 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kUdp1-0007R9-Ow; Mon, 19 Oct 2020 15:40:07 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     sunnyliangjy@gmail.com, punit1.agrawal@toshiba.co.jp,
        stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v19 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Mon, 19 Oct 2020 15:40:03 -0700
Message-Id: <20201019224007.16846-2-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019224007.16846-1-ben.levinsky@xilinx.com>
References: <20201019224007.16846-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 54cbafa5-4432-4f95-71e0-08d8747ff21e
X-MS-TrafficTypeDiagnostic: DM5PR02MB2570:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2570729270BC213148D47DBEB51E0@DM5PR02MB2570.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nkNZTAE2e3FNfyI12rsuEgahFJIsKhiWehAjPCBtlAfuSx2WQhnP11Mxyz9ywWC79SmELr+COe4sIi4HGndVt2jOqQ3140BbETYeCZEYa7F6K35ZuBkqnmbOufe3V0x72ZbGen07UV3i/OQP4HJRdQznHSJHfklpoLrcCzZap0v2T10XOaeHonVDukvxU9NajrK14EKtNwNbtzHrFq62Id+M56jeeyRTijDbPbhDyFkeRZtJGEfKh1bu3y3vho/azkYgQd6m2tUemuG9Q2v31rBMHNLoQ+tSZviKKOlhgq3o4L5Ju8ZUMO5xQfrCpMGVVg6yvgk+VuGcMQUydHyxpLcPVbfiK0+xOQp9EMeJPEurhW7qWKNRtS8bvbj/8sRzOjRJh8zUEHtM4Bi/DXq3vg==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(376002)(39860400002)(396003)(136003)(346002)(46966005)(9786002)(83380400001)(2616005)(47076004)(426003)(8936002)(44832011)(81166007)(82310400003)(6666004)(356005)(82740400003)(4326008)(316002)(5660300002)(186003)(36756003)(8676002)(336012)(26005)(70206006)(1076003)(2906002)(508600001)(70586007)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 22:40:14.4565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54cbafa5-4432-4f95-71e0-08d8747ff21e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2570
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

