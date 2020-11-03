Return-Path: <SRS0=eTbm=EJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93095C5517A
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Nov 2020 18:23:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E6452071A
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Nov 2020 18:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="qaLztx5T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729285AbgKCSXq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 3 Nov 2020 13:23:46 -0500
Received: from mail-mw2nam12on2058.outbound.protection.outlook.com ([40.107.244.58]:15822
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728855AbgKCSXo (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 3 Nov 2020 13:23:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUIKpOZFXXmuc9LF9Eo7dQEuinjbEaJTMloCEmmHKh0/rMJth4g7cDPAG/arMS3CJpk/yfjlmgc3FdN5F1ZlIQmqiMVS70C6TystN4Wv96RhKyvSuWvYzYv14Z/IDOLbD5uo0WGdV3kvXePxNLZ6Emd6YVKHBCmnyp74HuDyWYEc6DjGB+bWn0oc4Ec+F+9JEhwwk2SA6A1sV+xm3CmLV73aIShd7fY9qxbdBfCf+2xHOJ08qdVcfRdwNKEks/IizhtZSF3aKBI2iOQ7SgkVCywZJAoS/naWgHbAbUNZK4WiOd4eeiYaAqqbeL8XgQvWHlfyONjvL9NUctApDKlbvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Vpc2qALYKsniXcacH+wUXo0p8OO7wRYBSl9foF8LDU=;
 b=eLlGxa961Ra96Ze+ZhP32eewaQqZIg5upF/uWw9j3OY3sJuTV+TJS4nG2hPFBpuzV8X9OeL4fUNNbJw+2LIapiYtRP9Ka9JTL6oM+X4UDqHInhM8mOi7Bqnjcn41E9A8znMFQOvuV6lxnuYcl9tR9cbGsR1941E+kBQpbic3yVt+KDoJKCAu12TtZdO6Ju7xviLidMXT1ylq7EeLF2PE5t1xT45gtgMAwhyEO7f+qofZ2XpKhA1N5IUt0Ti0c7kplQhxaRRmVx6ulbLTZ3bBCXnTa4bphnYovaullcU3CMAiMIrpJ0Gjx1yl1dNezyjmeHXwGQ57A5D3NI7jUjf6jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=ni.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Vpc2qALYKsniXcacH+wUXo0p8OO7wRYBSl9foF8LDU=;
 b=qaLztx5TXYNxDC4XbCg1GZUiJRT8OMHfYygy9oNA/jme8+2yCkXSzzufN/LBRGaj7oKkTggz2+2Ur7zTwLogwwD5xWMGndFZ+EnmHu+tPOyO3yF0DS3HH/2xR8c3Yp03cyhIT6XrfqNid2mf2DRwghSUjPs3w/lyVl+LhbEfDqQ=
Received: from BL0PR05CA0002.namprd05.prod.outlook.com (2603:10b6:208:91::12)
 by DM5PR02MB3258.namprd02.prod.outlook.com (2603:10b6:4:61::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 3 Nov
 2020 18:23:41 +0000
Received: from BL2NAM02FT039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:91:cafe::f2) by BL0PR05CA0002.outlook.office365.com
 (2603:10b6:208:91::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend
 Transport; Tue, 3 Nov 2020 18:23:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT039.mail.protection.outlook.com (10.152.77.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Tue, 3 Nov 2020 18:23:40 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 3 Nov 2020 10:23:40 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 3 Nov 2020 10:23:40 -0800
Envelope-to: stefanos@xilinx.com,
 michael.auchter@ni.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=58698 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1ka0y4-0002gB-0P; Tue, 03 Nov 2020 10:23:40 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <michael.auchter@ni.com>, <stefanos@xilinx.com>,
        <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v22 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Tue, 3 Nov 2020 10:23:35 -0800
Message-ID: <20201103182339.14286-2-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201103182339.14286-1-ben.levinsky@xilinx.com>
References: <20201103182339.14286-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d754c01-6b31-4390-7c28-08d880259706
X-MS-TrafficTypeDiagnostic: DM5PR02MB3258:
X-Microsoft-Antispam-PRVS: <DM5PR02MB32580A6B7B7200F7FBDDF93BB5110@DM5PR02MB3258.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8wYH/Wzdgfyy1ILVdae4jxuKa0mkx7rjFMhwoq/lcmDZ2+HwSQ0VwN5uvtc+kv0VvByXCdyLTEc+iHPdpbbgWkwdopVPgf+ZSdzfHIq5mN/DSL697gBoy44EBezjUOtuB0LPheHfQt2PQRvRabpaRwdJPLCnjIEZkqZ2JNWNNYDJ6AglMel9Yfh3AJ+7V/sO5927LKD8QFJUdYC1IuQm/Ve8mcu0J6S2g1OX9N42NKojETu+m3qbxrZ0bMT8MCAZaKXFrJ6nhNyMv7HkniON9j42kj24SlmMFY4xp8D32ISXg/1K3OdIob/I5RhlplfI6g/Is7RrfY1Yp/hQO6Qjec58bIiXQ77RGwKqRMwHjd7L2af/XUNs0iXY4FfqZEENVryaI3Lmqbp3v9sD5Ee9UmS3GKnXODttJ/+swiFYgg=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966005)(186003)(2906002)(82310400003)(2616005)(316002)(83380400001)(26005)(70586007)(36906005)(82740400003)(4326008)(478600001)(70206006)(336012)(36756003)(356005)(5660300002)(9786002)(8676002)(8936002)(7696005)(44832011)(6666004)(426003)(110136005)(54906003)(47076004)(1076003)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2020 18:23:40.7445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d754c01-6b31-4390-7c28-08d880259706
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT039.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3258
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add ZynqMP firmware ioctl enums for RPU configuration.

Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
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

