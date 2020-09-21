Return-Path: <SRS0=DqHI=C6=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F287C4347E
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Sep 2020 16:14:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C56CE2193E
	for <linux-remoteproc@archiver.kernel.org>; Mon, 21 Sep 2020 16:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="DB6/IJCG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbgIUQOf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Sep 2020 12:14:35 -0400
Received: from mail-bn8nam11on2066.outbound.protection.outlook.com ([40.107.236.66]:49920
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727958AbgIUQOU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Sep 2020 12:14:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vf2LpEA/+5wVJ6ADqKFZXibp5e5J9CQ7g30mZGK3dr67K22Nh4ATDP98/7IWhrBSxG0uR1ZHe0m1wck4Xsg0H7ObphHf/6YP3UGWIac7bGjRxf6/kTZ9ByTsCeCWLKqJMBrUTYQ7Uws2x1OG/n+vRgUS2Po/B2G8YsY/iHfbgmodAget9Vkx2mruw18NjH+1xgM5VofkXOvMcRUlKcl3GY5/G8+XI/cCx6h/Kn3KSyLindDAk1dJQ8J/cwfaZPpCWhe3ktzj8SOkaOCHenGIf1qCQBlQFjNv1b141zFxfkmX4qyRG9AH1XYA3NUG5RPNLUUlNgZkYrviyBoqsqp7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5xh2iMbOUuYykH3VtoEpRrVeANMsj9APMUlrpsyzW0=;
 b=OHxBGRKUo3AGdIOxEr/ajfXW5oSqa6zEaeCCSxFmU0fo/amjssHKe4P+/6M5D8bF4oxZReGatdmf6JnAAv4CxQ9iwGimrQMNpGI6qxVSZKtD+gXCR45STw7hasxVxgwYlGGYXpYYaoZY5oSIWFBtPaFiKqofmFSPT4/7hjESEO4YwJ/WWKNTVBRGmi/Dm4ecZaB9OLbpYXBhl7c2Je8VdYlY9/YNJbyGhTQ0GbxTiOXmiqm8L30TfkW62wstJuo0mzOJPtxcEaPE5BXhbNjs6pT6Wux4Zkov4L/JcaDoujTcyWCi+/GTup7uSsVGoy0i6L6QlOG2bzgy9ILWSc9CTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5xh2iMbOUuYykH3VtoEpRrVeANMsj9APMUlrpsyzW0=;
 b=DB6/IJCG280wIui/d9PckJh6QfZwRpwiDr3I4L+iBHv9Dh+nkeSXA0SWaBkR9OGO2nDvAbzuN0bOZA0Yc3yFKtDX6G5tFyWUB0MxDvYXMJTVibrYgwRnQ6+p78yi8OiMFUfIpktVFoMqDAHpTzEHTvaTa4Ec4oEJxGpBEfyACrA=
Received: from CY4PR21CA0006.namprd21.prod.outlook.com (2603:10b6:903:dd::16)
 by MW2PR02MB3898.namprd02.prod.outlook.com (2603:10b6:907:9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Mon, 21 Sep
 2020 16:14:16 +0000
Received: from CY1NAM02FT003.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:dd:cafe::4d) by CY4PR21CA0006.outlook.office365.com
 (2603:10b6:903:dd::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.7 via Frontend
 Transport; Mon, 21 Sep 2020 16:14:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT003.mail.protection.outlook.com (10.152.74.151) with Microsoft SMTP
 Server id 15.20.3391.15 via Frontend Transport; Mon, 21 Sep 2020 16:14:16
 +0000
Received: from [149.199.38.66] (port=36710 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKOS2-00058r-JK; Mon, 21 Sep 2020 09:14:02 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKOSF-0004ec-Rj; Mon, 21 Sep 2020 09:14:15 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08LGE6tt008428;
        Mon, 21 Sep 2020 09:14:06 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kKOS6-0004bU-Ef; Mon, 21 Sep 2020 09:14:06 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     sunnyliangjy@gmail.com, punit1.agrawal@toshiba.co.jp,
        stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v15 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Mon, 21 Sep 2020 09:14:02 -0700
Message-Id: <20200921161406.11929-2-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921161406.11929-1-ben.levinsky@xilinx.com>
References: <20200921161406.11929-1-ben.levinsky@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a845ef40-7a04-457e-0a00-08d85e49631a
X-MS-TrafficTypeDiagnostic: MW2PR02MB3898:
X-Microsoft-Antispam-PRVS: <MW2PR02MB3898F2E739EF022A121A8EA6B53A0@MW2PR02MB3898.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:565;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9PN0mcKXvdeVFzuL2vxz5lXP7eB5/bikwHpqU5jV96OeYwoYjZ3sU2rtNxVPwFYu3va/LbN7WKKrRiAdeRVs/Df2p1gCGlP5+uib6VmUDNFLuENaqUlN+F36CKeJkdyf1N5K/6SQnE/qGD8cXWNXuZFqVcvQU3HIyOjLslX+KiSljtX+bn/pRYZqdRzvWI8I7VqkUuSJeM8bMRnIPebkRRIpuN4VfsKuJzgqbVoDPUPkqYYJ5woJxEfG1zNjqzhjPPCVlruAtJwe1/lKs5pCCSkZBKVh9f18gg6RlHodkppJvyKOsNFnvpxntk6B20khyShnNv5fFSLMAvqnNH6M2JXxqzXBlx/oq4YJ//PpjpGMRjxT07FF808akmunDWIL9w8sjucTADks2LVVDdY2FpRe2RfezVv2gsby0gkVRkdOQ9zLpszQ8Q99Nf+ryBQ5
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(136003)(39860400002)(396003)(376002)(346002)(46966005)(26005)(336012)(8936002)(8676002)(82310400003)(426003)(1076003)(47076004)(5660300002)(186003)(4326008)(316002)(70586007)(44832011)(83380400001)(356005)(6666004)(70206006)(81166007)(9786002)(7696005)(36756003)(478600001)(2906002)(82740400003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 16:14:16.1079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a845ef40-7a04-457e-0a00-08d85e49631a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT003.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3898
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

