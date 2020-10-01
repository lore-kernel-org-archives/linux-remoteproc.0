Return-Path: <SRS0=A3Cg=DI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA27C47428
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Oct 2020 21:06:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6CBA207FB
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Oct 2020 21:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="iULkf2OP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgJAVGf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 1 Oct 2020 17:06:35 -0400
Received: from mail-eopbgr690076.outbound.protection.outlook.com ([40.107.69.76]:32838
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727244AbgJAVF6 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 1 Oct 2020 17:05:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y23EVpEgJ94DAErs7MsMJ2FgUW6fKWq3NxoBCjWkCrm0YweoSgwFVQ0J7xrvLTNP6S7zaUJvmIU6Q+B37bovesIILzXmc4ic25xohvrB6udaeU5Bgcu0yq7U7d/qkf2sXYvhuZhIVR4/BxMD9wU+w+eWZpQ0sjszQf61oWx83dK/+0hSNGwMx0pbFbPj5RbGGKytwswuajz+VWOoAZXVr1ZZP2s1F+h0DcHjHgCjlRHSpLIG1eGCBO7HVBsAXOOxpSbumT8MzaI8DVctdrDuDZ2FVaSGxUJR4QcMj8BiUZB9TARb4koMYnky03QhtFUj2L2Q7HR7G4SzSMR6ZjTilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8QxPMisC2+k/+yHudjuCuQoA5DHOOu3ciktYDpZmyQ=;
 b=KCFdKtIAlS+1lpfnDpUIw2JMCuZTlaRaT5hmcCScePfXe2tRNYAE1fFbdKtXHe49T7US7//fYRMMU3X1pvezBNLsLafgNT4gMfEaxbunNxg6x2DmKPkXcoy3KSgpHWBbnivxHNgvPYp+87O3g3cjFYXRzoDg0r3Ur0XpZYLoGeOXuXfKXOZrMs7q0uWcg2IpLyCYpvP0OnTBOjtPMqgWoyTVyYfZiJ7HuLHJPmefR5GqFzV8oEMPYpWvvxNyHLgfoZ37RMTN4UnGHzrrvKZgD+3dQny7auHQWOyeAhwg3foepFHFMYtaqvlN/FAS9J50Zmlpm9D4wiVyynFA+suxCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8QxPMisC2+k/+yHudjuCuQoA5DHOOu3ciktYDpZmyQ=;
 b=iULkf2OPKR3W2IEbj525jS2y5td061YIR8AjdGnwGRofYuyVr/PcTNj+JFLyYB8Jv44i+oiUvTur0AQo3Jd3+ZOka2TafeGI1weZzLNzGPdFNImxHSlgWk6f1JCLRQITMsZC2FWASTbe52B4IpbHNA3SbCWEIisW3TJyT2BUm2M=
Received: from CY4PR1201CA0018.namprd12.prod.outlook.com
 (2603:10b6:910:16::28) by DM5PR02MB2233.namprd02.prod.outlook.com
 (2603:10b6:3:5a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Thu, 1 Oct
 2020 21:05:54 +0000
Received: from CY1NAM02FT005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:16:cafe::c) by CY4PR1201CA0018.outlook.office365.com
 (2603:10b6:910:16::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Thu, 1 Oct 2020 21:05:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT005.mail.protection.outlook.com (10.152.74.117) with Microsoft SMTP
 Server id 15.20.3412.21 via Frontend Transport; Thu, 1 Oct 2020 21:05:54
 +0000
Received: from [149.199.38.66] (port=60931 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kO5lW-0005ZK-Kr; Thu, 01 Oct 2020 14:05:26 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kO5ly-0000KR-Da; Thu, 01 Oct 2020 14:05:54 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 091L5fab030070;
        Thu, 1 Oct 2020 14:05:41 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kO5ll-0000Id-8N; Thu, 01 Oct 2020 14:05:41 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     sunnyliangjy@gmail.com, punit1.agrawal@toshiba.co.jp,
        stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v17 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Thu,  1 Oct 2020 14:05:37 -0700
Message-Id: <20201001210541.32042-2-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201001210541.32042-1-ben.levinsky@xilinx.com>
References: <20201001210541.32042-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2c78bfdf-c8f0-4db7-04a4-08d8664dc93c
X-MS-TrafficTypeDiagnostic: DM5PR02MB2233:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2233FDB55AD80661947C3FACB5300@DM5PR02MB2233.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XOK4s7H9W1VS6t/WH12BH3zFTcNgB2UCDgqpYvkL+yGDcyvJSlrn+++8FAPaAIHrhTZatVQSfazcZJntWh5vQ0rjCo2aDk0GjXFzelSAPdEKI/QKy0oBl2YiWeEDzdlwICToDQZvpzLE6RetkykPToNJgKYaUSzwqrj2ckUi76NCHhFOjYQO2rcRvRCuyeU4RgtVA8EeuTo85Kl5dmv4CiopFfmZFVv7kZjoV5GYSPDCGABeqCt3740bs/hswfHg0AZK7G8AFXhY9dAvdkXGR9rGQ5IY6Y5bVJCf3ow6618siuYc8Lle4snhYxjymDO6nOUHQ3tdsA2TYhhsdgtRpz+Df+GvHBlubT3tj542i595GepkHX2mx/ZzwK0C3EMGUc+ztNpNgEAq3VYUG4eaHQ==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(396003)(346002)(136003)(376002)(39860400002)(46966005)(5660300002)(47076004)(82740400003)(356005)(83380400001)(26005)(7696005)(6666004)(82310400003)(70586007)(4326008)(478600001)(9786002)(2906002)(70206006)(44832011)(36756003)(1076003)(8936002)(186003)(81166007)(8676002)(316002)(2616005)(426003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 21:05:54.7463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c78bfdf-c8f0-4db7-04a4-08d8664dc93c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2233
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

