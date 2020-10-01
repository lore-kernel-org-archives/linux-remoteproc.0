Return-Path: <SRS0=A3Cg=DI=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED59C4741F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Oct 2020 21:06:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9214A20848
	for <linux-remoteproc@archiver.kernel.org>; Thu,  1 Oct 2020 21:06:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="SLAHpPs3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbgJAVGN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 1 Oct 2020 17:06:13 -0400
Received: from mail-bn8nam12on2077.outbound.protection.outlook.com ([40.107.237.77]:33184
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730045AbgJAVF7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 1 Oct 2020 17:05:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvAY8P0KPK45ZRJ0de60l4ewy3WSp+KVUhF4KIJNQNEskUqdXv328EkzkryWwwY1eCCHA+4TPZZlW1ZCJaOp9e+VyqK++nU+cgBd38Y1xkDIm8esN5NPL3t8DfW4gPubyeLmhqrIB7scuQdfpRRvE4O5xebF8BkakBkPxkYi4HBSPz4GXZar+rEynuBSvotE7G+46hcuM5dGHXq+jXe1Qoy+jLAWn3nJoIVyhOXDf+2LFTTeu0rDSWfHBgENTOvtgvDlevUArmbl3FKZsAZCSJwI7LOKyYUT/K3+leAkYKNwpVVRl6q9V8tGyjJfL02xCBL1ItqeLFx01sZZAeKgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogHvixDvPvbJmCfm9PXktN6mt2iU69iG4kwJAU8l84s=;
 b=Bn5W25+SbDuaBR5ggjhcPFykWy1IqZoEx5zXc1FaeZosG0Xx2ywHj8joeJ12xokigG4jews+I35qBqe9l5rzUPhu1Xo3w4knOuXX7kBt14cBj6eijLKFoNzD5iMST7XqZCtAKRkbnyRsMu6XXHygBhn8bh62+T2sSEREMmVvoNe1WISt8PDfDImDDWFMY8/ul9BsmKopj9NmumAaicvQttvVvT+7prhKe4zFdgqHMmTFvls/Xiz+7GZfr4b6dKUf/di/76gfrRcd59N4tvME63NAvx9fJa3RAXHdoY3eREXyRJ6hwOoyFlHfg3B2/f1+UvQGIXo62vbLSuVyusxJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogHvixDvPvbJmCfm9PXktN6mt2iU69iG4kwJAU8l84s=;
 b=SLAHpPs3R4cUF2gbMs4dO1PZB1H4fp/esMtoaz7lSgqn1se9ntyilIxpE8qKbRmjXDSveJSRydqfBQfhYalS1UzD80hOvmIDR8Jgkt1Y1IytTrc0Nc3mpJL5V1euLfUQ2TJDXTx1rtVG+ZN9fvhQwxrgilN4ETwtnBEWoyDh77Q=
Received: from MN2PR16CA0016.namprd16.prod.outlook.com (2603:10b6:208:134::29)
 by CY4PR02MB2872.namprd02.prod.outlook.com (2603:10b6:903:127::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Thu, 1 Oct
 2020 21:05:55 +0000
Received: from BL2NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:134:cafe::43) by MN2PR16CA0016.outlook.office365.com
 (2603:10b6:208:134::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.36 via Frontend
 Transport; Thu, 1 Oct 2020 21:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT022.mail.protection.outlook.com (10.152.77.153) with Microsoft SMTP
 Server id 15.20.3412.21 via Frontend Transport; Thu, 1 Oct 2020 21:05:55
 +0000
Received: from [149.199.38.66] (port=60945 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kO5lW-0005ZT-ST; Thu, 01 Oct 2020 14:05:26 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kO5ly-0000KR-LC; Thu, 01 Oct 2020 14:05:54 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 091L5f5T030076;
        Thu, 1 Oct 2020 14:05:41 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kO5ll-0000Id-Bo; Thu, 01 Oct 2020 14:05:41 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     sunnyliangjy@gmail.com, punit1.agrawal@toshiba.co.jp,
        stefanos@xilinx.com, michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v17 3/5] firmware: xilinx: Add RPU configuration APIs
Date:   Thu,  1 Oct 2020 14:05:39 -0700
Message-Id: <20201001210541.32042-4-ben.levinsky@xilinx.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6ec68435-46fe-4c5e-cdce-08d8664dc963
X-MS-TrafficTypeDiagnostic: CY4PR02MB2872:
X-Microsoft-Antispam-PRVS: <CY4PR02MB2872F70088DCB9C7CF5FA1B8B5300@CY4PR02MB2872.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:179;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v4/K1+393dZ1QywN1BBvCrkFoe8QTvvpX9F1S7wwUNpwf5rvpLQEQrY55jyD6xhy3PSysrQjxSWOx9LrkMGVgR1b8hlYz2lze+hx2klF8NGAgePfeZHS1Y9MEDKUMWzop/QgM+wtRXguf1Lqk1jvfnjwVVCtyL4cgatid14+e/o1uuYh+a6s9waUGC9j3o5SQnsUEj+odRnsBhYrN907iZYdZQX3vpDAL9t74ztecopgkGPJqIHZ2aEoam9uhSCskyug9/iKu++JXe0ZyCqcU29mdVWxpChgpQ5VUWb7Muwv5disEDICDznhH4tgMD66WOS8mBM1QezWU+hIHwbqKpgr5HMjeu2LXFp5gZOK7xpysSIBdwkK66sqIPhFLzrQQe2FEkw4aspIPApc20aXKQ==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(39860400002)(396003)(346002)(376002)(136003)(46966005)(4326008)(44832011)(36756003)(70586007)(70206006)(7696005)(8676002)(2906002)(8936002)(2616005)(9786002)(83380400001)(26005)(186003)(478600001)(336012)(1076003)(5660300002)(426003)(81166007)(356005)(82740400003)(47076004)(82310400003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 21:05:55.0071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec68435-46fe-4c5e-cdce-08d8664dc963
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2872
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This patch adds APIs to access to configure RPU and its
processor-specific memory.

That is query the run-time mode of RPU as either split or lockstep as well
as API to set this mode. In addition add APIs to access configuration of
the RPUs' tightly coupled memory (TCM).

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
---
v3:
- add xilinx-related platform mgmt fn's instead of wrapping around
  function pointer in xilinx eemi ops struct
v4:
- add default values for enums
v9:
- update commit message
- for zynqmp_pm_set_tcm_config and zynqmp_pm_get_rpu_mode update docs for
  expected output, arguments as well removing unused args
- remove unused fn zynqmp_pm_get_node_status
v11:
- update usage of zynqmp_pm_get_rpu_mode to return rpu mode in enum
- update zynqmp_pm_set_tcm_config and zynqmp_pm_set_rpu_mode arguments to remove unused args
v12:
- in drivers/firmware/zynqmp.c, update zynqmp_pm_set_rpu_mode so rpu_mode
  is only set if no error
- update args for zynqmp_pm_set_rpu_mode, zynqmp_pm_set_tcm_config fn arg's to
  reflect what is expected in the function and the usage in
  zynqmp_r5_remoteproc accordingly
- zynqmp_pm_get_rpu_mode argument zynqmp_pm_get_rpu_mode is
  only set if no error
---
 drivers/firmware/xilinx/zynqmp.c     | 61 ++++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h | 18 ++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index a966ee956573..b390a00338d0 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -846,6 +846,67 @@ int zynqmp_pm_release_node(const u32 node)
 }
 EXPORT_SYMBOL_GPL(zynqmp_pm_release_node);
 
+/**
+ * zynqmp_pm_get_rpu_mode() - Get RPU mode
+ * @node_id:	Node ID of the device
+ * @rpu_mode:	return by reference value
+ *		either split or lockstep
+ *
+ * Return:	return 0 on success or error+reason.
+ *		if success, then  rpu_mode will be set
+ *		to current rpu mode.
+ */
+int zynqmp_pm_get_rpu_mode(u32 node_id, enum rpu_oper_mode *rpu_mode)
+{
+	u32 ret_payload[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
+				  IOCTL_GET_RPU_OPER_MODE, 0, 0, ret_payload);
+
+	/* only set rpu_mode if no error */
+	if (ret == XST_PM_SUCCESS)
+		*rpu_mode = ret_payload[0];
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_get_rpu_mode);
+
+/**
+ * zynqmp_pm_set_rpu_mode() - Set RPU mode
+ * @node_id:	Node ID of the device
+ * @rpu_mode:	Argument 1 to requested IOCTL call. either split or lockstep
+ *
+ *		This function is used to set RPU mode to split or
+ *		lockstep
+ *
+ * Return:	Returns status, either success or error+reason
+ */
+int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode)
+{
+	return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
+				   IOCTL_SET_RPU_OPER_MODE, (u32)rpu_mode,
+				   0, NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_set_rpu_mode);
+
+/**
+ * zynqmp_pm_set_tcm_config - configure TCM
+ * @tcm_mode:	Argument 1 to requested IOCTL call
+ *              either PM_RPU_TCM_COMB or PM_RPU_TCM_SPLIT
+ *
+ * This function is used to set RPU mode to split or combined
+ *
+ * Return: status: 0 for success, else failure
+ */
+int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode)
+{
+	return zynqmp_pm_invoke_fn(PM_IOCTL, node_id,
+				   IOCTL_TCM_COMB_CONFIG, (u32)tcm_mode, 0,
+				   NULL);
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_set_tcm_config);
+
 /**
  * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem to
  *             be powered down forcefully
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 6241c5ac51b3..79aa2fcbcd54 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -385,6 +385,9 @@ int zynqmp_pm_request_wake(const u32 node,
 			   const bool set_addr,
 			   const u64 address,
 			   const enum zynqmp_pm_request_ack ack);
+int zynqmp_pm_get_rpu_mode(u32 node_id, enum rpu_oper_mode *rpu_mode);
+int zynqmp_pm_set_rpu_mode(u32 node_id, u32 arg1);
+int zynqmp_pm_set_tcm_config(u32 node_id, u32 arg1);
 #else
 static inline struct zynqmp_eemi_ops *zynqmp_pm_get_eemi_ops(void)
 {
@@ -549,6 +552,21 @@ static inline int zynqmp_pm_request_wake(const u32 node,
 {
 	return -ENODEV;
 }
+
+static inline int zynqmp_pm_get_rpu_mode(u32 node_id, enum rpu_oper_mode *rpu_mode)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_set_rpu_mode(u32 node_id, u32 arg1)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_set_tcm_config(u32 node_id, u32 arg1)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif /* __FIRMWARE_ZYNQMP_H__ */
-- 
2.17.1

