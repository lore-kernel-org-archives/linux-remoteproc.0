Return-Path: <SRS0=Or6o=C2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5C2C43463
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 20:03:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA5E520725
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 20:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="Q96ykpK/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgIQUDO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Sep 2020 16:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgIQUDA (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Sep 2020 16:03:00 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::61e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367AFC0611BD;
        Thu, 17 Sep 2020 12:54:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiqTyrm0jWmOPvdkfwuBIMl+a/XPxHiN6MCtndyGPabRMPbAx3Jfn+CW7hjDWmnHRap0o+12AVJj7vHVGZvvNf0qY7Foaq4NaySItl5/dVaK2tzMq6s0t6zFxWbRkaTdIAS5gkc7Cg6ThDUowUOh+dec3jLTLOgfzD3nh0fhAkgSdRnuvw+HQW1i6iHh6FFj3PS84mpRm8cLHPxexrLlqlECsu7P8cEMQmbI13mW4Rl4tXPK/MLnDBFIhL8HQWeKLIAL4YblgX+4Lo/Iss4qKOFpG03i/VRG2osRm9CB1v94dyPAgNoB0EQ6N0Q9X0pt4qNNG+5pdZmQrxn6XFBrOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogHvixDvPvbJmCfm9PXktN6mt2iU69iG4kwJAU8l84s=;
 b=gNRXbLsfrwmo0JxQujylGt65m02WglsgVzsmHFr8bZL8qlyvXInGtV+xEV1GpApsEYeaXT5Q/9SpISsAMRZafs1S6Y9Hw0yPmWCpkBMHHzjfQubCz9tFhZX2/WgSb8tBYechCxt4Hk7h8RNLu5/EfBvs27dllUlddN7G1DmJoXvgwnGOPLl0BLQAIHxrOs6DVgxl4wUtQSn8wuScRlXl36qAT5Yb7Ed4TFVsBOnDB12soK7EJDjCrapWsjiBixzg9jqm6aeswNP2+VElrxLlDifs4Nb6nIYyewRcxJIspFvF1552JfcJAb530uTRhw5aIy/AD20LH7IzcROT+CAIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogHvixDvPvbJmCfm9PXktN6mt2iU69iG4kwJAU8l84s=;
 b=Q96ykpK//aoBPFMB7156hvQl+jSFnwgkgDlY0/odqZlPNi7DcPeNMXV0jDpDwlyFx7dpCKeyMWndz+XSKGDE8BiUklfxjgZ0CXiaQ/jha53ayGZCgs38wEWc4+W1VzfPg0op46QrKm9EYNeN/1jxTSg52nm+lVC7rzPYYmKHJJ0=
Received: from SN4PR0201CA0017.namprd02.prod.outlook.com
 (2603:10b6:803:2b::27) by DM6PR02MB5418.namprd02.prod.outlook.com
 (2603:10b6:5:33::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 19:43:45 +0000
Received: from SN1NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2b:cafe::ba) by SN4PR0201CA0017.outlook.office365.com
 (2603:10b6:803:2b::27) with Microsoft SMTP Server (version=TLS1_2,
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
 SN1NAM02FT036.mail.protection.outlook.com (10.152.72.149) with Microsoft SMTP
 Server id 15.20.3391.15 via Frontend Transport; Thu, 17 Sep 2020 19:43:45
 +0000
Received: from [149.199.38.66] (port=43983 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzoe-0005ZA-H2; Thu, 17 Sep 2020 12:43:36 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzom-0005P5-UI; Thu, 17 Sep 2020 12:43:44 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08HJhg4h028243;
        Thu, 17 Sep 2020 12:43:42 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kIzok-0005OV-3s; Thu, 17 Sep 2020 12:43:42 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     punit1.agrawal@toshiba.co.jp, stefanos@xilinx.com,
        michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        emooring@xilinx.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jliang@xilinx.com,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v14 3/5] firmware: xilinx: Add RPU configuration APIs
Date:   Thu, 17 Sep 2020 12:43:39 -0700
Message-Id: <20200917194341.16272-4-ben.levinsky@xilinx.com>
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
X-MS-Office365-Filtering-Correlation-Id: db5fa2e7-dc5c-4611-a36b-08d85b41fd56
X-MS-TrafficTypeDiagnostic: DM6PR02MB5418:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5418CECE171A75FA88E59F9EB53E0@DM6PR02MB5418.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:179;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0ONivSSjNmS2EaNKE1xQQ03iaZSQrVUL9wUe7CWHb6+qtS7y3TveeGoMwmoccJ8Xr4cfdg+N65cPoOSrkRYgTYjRXquFD+x12nzA4ytlImzbYmSWy5haQaoQfbPPwUDzAQscvosPTKsiIAdPbNeLFwUfcANNBny4EcYfmez6fiFk6NmzV5Q89d6YCnWtyetESC5uoePlwmbFvwyPDMLBl3LmTBeqZ6JNWJPwWDIOHf7Q/frvv3trcapusQgWb1CA4K4ziMTqBG/Ccxlo5ULGRXUbC2bJJPmHR2HEb117SmL+NgyOYAI49iakYYAiXH0Fz04uqtGbS1L7xLV4NNC1mE0NVAOdsU4DeqGL8wZK2CXURJ2aM9gMPvJXrNy/bz15ROoKmokj71h8mwNKZyfA0Maa+CLw7Vc3hfuV0zep2klSpyTCsmgq9tNRqOKQrDgo
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(39860400002)(376002)(346002)(396003)(136003)(46966005)(336012)(426003)(26005)(2906002)(186003)(81166007)(9786002)(8936002)(2616005)(44832011)(47076004)(82740400003)(356005)(4326008)(5660300002)(36756003)(7696005)(70586007)(82310400003)(70206006)(1076003)(316002)(8676002)(83380400001)(478600001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2020 19:43:45.4130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db5fa2e7-dc5c-4611-a36b-08d85b41fd56
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5418
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

