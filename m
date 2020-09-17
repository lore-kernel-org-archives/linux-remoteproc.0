Return-Path: <SRS0=Or6o=C2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9281BC43464
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 20:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 488842075B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 20:03:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="l+tMBNpC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgIQUDJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Sep 2020 16:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbgIQUDA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Sep 2020 16:03:00 -0400
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (mail-cys01nam02on0623.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe45::623])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE70C0611BE;
        Thu, 17 Sep 2020 12:54:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4T40dIgQ2W/ERuK2rA/n5X55fRAiF6MJZnY0g1SgtvaprfKagENXQsQf5RSY7cgBmy6+jwlnlZ5aWE6ssyur32oAU1VUfVpaBokT/5rYbFx1GBnBPqvxwuntihaTaF6ZWSmmOEtqmk931mkHHPoL9Mfqj7tiOLOn5NXTAZpPVcrRQC1M6rQeY+SYVoH53A39BYh7zZZUV0Bpj4SVLIf4rpJH46spfyyeZAkzhywaxxyfwm8htY1BUZ7Dt63DttooTAi74mZzf8lFgUdubDTBjIPGuYXF6jTqp9XEQwdC++YOzswxzBg9yXq8bQOYCvADP1VUeIpoWFD0TCtlq3bNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5xh2iMbOUuYykH3VtoEpRrVeANMsj9APMUlrpsyzW0=;
 b=Txy+U/hqVf1SiEh4gY5dikOglirZIdq+zmp1hsqmGwEIK+O2cS4bWrvTl7h0pCheomTYiVZ7CajLZaJP4zTn6+rlT04T4ketc0s8xyMv/PYcP4vNSypeMMTQ8YVbbax88ut2yuhB+HRYigsqb/gqMNEykoV4xQns6FT9C7TJCO5sSzJsMjbl+mN/HSPRRhjfudQ27uvT+5UVDPK9eU+7JW/5uDfX+f48fkIC/iHslA0OsGgG3FcQl/qlAOZwgDa3mZTmA61clNBMUQFKmewY2n/g11DzLSx5BnJyM+3UOZOzmj3qqXC3j0HA+RcqAFMYcG6KZKae/4XOou/0PqI1Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5xh2iMbOUuYykH3VtoEpRrVeANMsj9APMUlrpsyzW0=;
 b=l+tMBNpCmsW8+7v8PoRs+ANtvvunvYKZI4+UKEU8tJLu27EDjbO0zaMCywmkZCBzF+KbYQVipQ+ztTGweMNTpPLZIifRdGF6AT9atVJQSRDVkOZidH+Oo21rgMlOi8c4Z251MkSZz9nHqunOtntUmWEujm6etgyChdqZb64vYQo=
Received: from BL0PR0102CA0037.prod.exchangelabs.com (2603:10b6:208:25::14) by
 BY5PR02MB6337.namprd02.prod.outlook.com (2603:10b6:a03:1b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 19:43:45 +0000
Received: from BL2NAM02FT037.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:25:cafe::54) by BL0PR0102CA0037.outlook.office365.com
 (2603:10b6:208:25::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend
 Transport; Thu, 17 Sep 2020 19:43:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT037.mail.protection.outlook.com (10.152.77.11) with Microsoft SMTP
 Server id 15.20.3391.15 via Frontend Transport; Thu, 17 Sep 2020 19:43:45
 +0000
Received: from [149.199.38.66] (port=43973 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzoe-0005Z7-E8; Thu, 17 Sep 2020 12:43:36 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzom-0005P5-R5; Thu, 17 Sep 2020 12:43:44 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08HJhgiZ018284;
        Thu, 17 Sep 2020 12:43:42 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzok-0005OV-0Y; Thu, 17 Sep 2020 12:43:42 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     punit1.agrawal@toshiba.co.jp, stefanos@xilinx.com,
        michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jliang@xilinx.com,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v14 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Thu, 17 Sep 2020 12:43:37 -0700
Message-Id: <20200917194341.16272-2-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917194341.16272-1-ben.levinsky@xilinx.com>
References: <20200917194341.16272-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 80d90118-fafe-410b-465c-08d85b41fd3b
X-MS-TrafficTypeDiagnostic: BY5PR02MB6337:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6337C3FFBF51CE3C45D9AA34B53E0@BY5PR02MB6337.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KgAM0VKsJ9qwGcPRTUhToDJZdhLPfcI2VSlJM5AIc7cHfX7tsoGRU2urx+/iW5fc6d2Zwmce9OM/8PBhM6OYnjeq4KO49VRQi75xZh3LLiKHngkFrum4BM277CeXaGvIsSyA5TP/ylT+bsCxBv3/8l/unAOIQf65b5VVoSRaH3q5DnW2YCxrgtHS00wKhZQuaL/xIP0WBcHSwesTpISofP0C0wdlrwNCtQ2R/63nGGsbA50db6T7mmY3Am8jif+GKYJfBy+SjywPUvw0ERon+I00tSwUU7mg9ds4D8OdNXkzx8bZKu4FvKDscVPHFWslmvP118oEAZhJQWpprhZdZ3SovmuWqD14SPcejJkxtKTHjaYlxaJHW55IulHz2kIlu0jn5jY9u4cvAWaV7D+20A==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(396003)(136003)(39860400002)(376002)(346002)(46966005)(82310400003)(70206006)(9786002)(36756003)(7696005)(2906002)(70586007)(8676002)(81166007)(82740400003)(47076004)(1076003)(44832011)(5660300002)(356005)(83380400001)(478600001)(4326008)(26005)(336012)(316002)(6666004)(186003)(8936002)(426003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 19:43:45.2327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d90118-fafe-410b-465c-08d85b41fd3b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT037.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6337
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

