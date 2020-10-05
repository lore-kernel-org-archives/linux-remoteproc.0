Return-Path: <SRS0=OhS6=DM=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA64C4363A
	for <linux-remoteproc@archiver.kernel.org>; Mon,  5 Oct 2020 16:06:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1CDF20663
	for <linux-remoteproc@archiver.kernel.org>; Mon,  5 Oct 2020 16:06:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="lAedOkUO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbgJEQGV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 5 Oct 2020 12:06:21 -0400
Received: from mail-dm6nam10on2062.outbound.protection.outlook.com ([40.107.93.62]:24161
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727137AbgJEQGU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 5 Oct 2020 12:06:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcQnuhXeBSYm2oqR3aqQ5sroL+3nzXJUz57nE8imOkpylUL9n8BADJleUx4bXdJl4B1E3bYKYyao8g2lCkkTMiuI6fLsMhIHgdaWKyMcADme/knsaA9aSCrwpBhMk0f5v3A6R4V5tYo4bfWg6ay6t/DN/THdABTUbj/I2h+5zolNNaTLfVC8vPYMB7MATTyW9TqQxZidbVtfrvKz16zidgJuSaEqHlVMXTwVOIFcrerQuo11sSMdqkfomX0syJKk+LQD3eBH+pTCbQCMlX8EhX5/Y+avLRB3bBI385I1GHQDftee1tiqKpkF7kig7KspDcaAiwPBqIL+o6rBZePSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogHvixDvPvbJmCfm9PXktN6mt2iU69iG4kwJAU8l84s=;
 b=S2illvsFwSO4W1YBuqbDBrlRIodLOf5aHQYhSJAwwZaU7Q5Byj9b0eeotscfTRWDenPZM12Ab1/z6w1IfLMaUNxlWQX+EUXNPzCXnwvqfox8N8ZzsnRL8VrvKM38tYH1woUqKzU2sInlIRoiZqFh8xlWYFgY5sOvULHP9DLO3xumXLu+lBLmJau8qBPueKCz6J1h2ywtlkTvQytf3TJwxgTWrQ8QpZmGKCvai7SnBA3nMbuLhpemZpJXWZbhspNc6n2+nItWLTXM+61BXsQRzqDRgWMvkc2eQrc4e8N2lRxdMEilm/Ff4aY088VJtF8mz4mZDA6Mgtx0Kdt+MUK2Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogHvixDvPvbJmCfm9PXktN6mt2iU69iG4kwJAU8l84s=;
 b=lAedOkUOhDrttSTPtLHfjbMoOPl7JkzYu/890q1ejY4L+uL/TpM2jRUcBjBl2YYJmmd1pfow63a6TRLBgbB5PqamDVMukSz92y9iDduTMrySfQmGUw3ZHR94dbJhCTfafYj7LePnfi6v8RVrGgZ5Uar1wnu49eyNXoseZZOYSxc=
Received: from SA0PR11CA0015.namprd11.prod.outlook.com (2603:10b6:806:d3::20)
 by DM6PR02MB5194.namprd02.prod.outlook.com (2603:10b6:5:4a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Mon, 5 Oct
 2020 16:06:16 +0000
Received: from SN1NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d3:cafe::cf) by SA0PR11CA0015.outlook.office365.com
 (2603:10b6:806:d3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38 via Frontend
 Transport; Mon, 5 Oct 2020 16:06:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT021.mail.protection.outlook.com (10.152.72.144) with Microsoft SMTP
 Server id 15.20.3433.39 via Frontend Transport; Mon, 5 Oct 2020 16:06:16
 +0000
Received: from [149.199.38.66] (port=36679 helo=smtp.xilinx.com)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kPSze-0001ti-UI; Mon, 05 Oct 2020 09:05:42 -0700
Received: from [127.0.0.1] (helo=localhost)
        by smtp.xilinx.com with smtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kPT0C-00026i-7q; Mon, 05 Oct 2020 09:06:16 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 095G6EaJ027463;
        Mon, 5 Oct 2020 09:06:14 -0700
Received: from [172.19.2.206] (helo=xsjblevinsk50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kPT0A-000260-F9; Mon, 05 Oct 2020 09:06:14 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     ed.mooring@xilinx.com, sunnyliangjy@gmail.com,
        punit1.agrawal@toshiba.co.jp, stefanos@xilinx.com,
        michals@xilinx.com, michael.auchter@ni.com
Cc:     devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v18 3/5] firmware: xilinx: Add RPU configuration APIs
Date:   Mon,  5 Oct 2020 09:06:12 -0700
Message-Id: <20201005160614.3749-4-ben.levinsky@xilinx.com>
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
X-MS-Office365-Filtering-Correlation-Id: dfc6fcb5-9f6d-4796-3a34-08d869489700
X-MS-TrafficTypeDiagnostic: DM6PR02MB5194:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5194575A4F11A18B1A320A0CB50C0@DM6PR02MB5194.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:179;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sh5Q1MVPV7zZoszK35T1Uxz2smh5IQnVSUUycFSI5pSdKkYNjRh8JHbatLsgL6/12xoCGqIiB4Na9MGCZsiOaRDsChrChgq/Vp2H0NbDMkUt1fAqW3iHr2i8ktIKiJ3f+H2krtT9CyN7woopbHkhz3gkfkYrjpLzQewahEvUG/74YXQCa2DlMVLLBOYdb/AGSrlF0Ynu6sy7zrQoKhB0HaS/EAiwwQWo81zGWM/6H+iupkAkMHwgSxn88i2hFLz2MeaxztzpfLQXeAVABpgIOsCHJUnECPF44GauY25AH98Ow/7cczxDYNJUqiT65BpZxtC2Sr2/0UDqRjxIp70yctoYQRfqKB+FmdHRkjmxwws2bGAREyD5irQG5S4zQHBByVk3Nj91NWeqBQUHTF4npw==
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(346002)(39860400002)(136003)(376002)(396003)(46966005)(336012)(9786002)(8936002)(83380400001)(2906002)(2616005)(8676002)(1076003)(5660300002)(81166007)(44832011)(356005)(426003)(36756003)(47076004)(26005)(70206006)(70586007)(4326008)(82740400003)(478600001)(82310400003)(316002)(186003)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2020 16:06:16.4741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc6fcb5-9f6d-4796-3a34-08d869489700
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5194
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

