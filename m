Return-Path: <SRS0=47aK=EF=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD325C55178
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 21:29:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 884F9221FA
	for <linux-remoteproc@archiver.kernel.org>; Fri, 30 Oct 2020 21:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="U4sqVR9j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgJ3V2o (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 30 Oct 2020 17:28:44 -0400
Received: from mail-dm6nam12on2053.outbound.protection.outlook.com ([40.107.243.53]:32864
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727853AbgJ3V2o (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 30 Oct 2020 17:28:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+YkWtIBAEBRcs+QWeulSKiBR5KHQFEMwco7J+wp0CHMJdxnFcVs57tTtyMoQM0DMyMIq66penglg6R5Ybf9ESjg7bV6S/snWH44zO/k3LinlJW3cT7AjDhjqUlH7Qg2I8s3nG7Jzom7ouT12j0IIoHH/g/U1IjXSLcxeq2c0HUJaopqvHqd0JgbnOLnqbSFNpFIwIVTzdC9w9v21rSGyVQh9eK24oJ5hx6yT+4TlNQIBg1FlTcASa2iWW5Al6aIv1c7tZjaoO/xKL+KzBxOQLlbeoC8B66NS0V4dieZelAA0bvOifTGak66VNjfbET84aoJ1yZIYT/ql42dGEquoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Vpc2qALYKsniXcacH+wUXo0p8OO7wRYBSl9foF8LDU=;
 b=hhf/2w8T7EkwykUm8pscKr4nqla5A0yZkt6y/9IcPvLcReu69HZb1VZuCFFZoWwxblA61/dmTJIC1SaneKpSK3/djsRWppSttUY7hFnQ4ZpEmhkUkpkBbq9/vmFJGFS0CfiTkRSbW46AGpO6/efdeDqk7kq0B8tZBndEY/OScYF3w+BqUPX9lKsmEkCANOr2CsfUqzX0az0UGeN6a5TEYQBHINNVLbc+7od2csr7gmAyJ6Pn38FXZaKZ9q0jkJxnE15rqyuC1kdwZYiW6Qm2C6eKV+t2dRvL/FcHT56jkbLIXvsbA7ARRBid21+eHJ7/tdltVXK+bp1bzajPA49p7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Vpc2qALYKsniXcacH+wUXo0p8OO7wRYBSl9foF8LDU=;
 b=U4sqVR9jg/5911g17qtFDxLAz//DCZlAVEpVzIHTy8wb96KbiILoM64IzhcVYfidf5jqYN2lZpe/EumDEtGAucQ1PP5qe92pSi5dDZtbHyWagTAVbZ93fSoiA6+SxYO200005t/iSCC98JSCWizgHqRl5IkRBC2AGEIFeOATph4=
Received: from DM5PR16CA0014.namprd16.prod.outlook.com (2603:10b6:3:c0::24) by
 SN6PR02MB5311.namprd02.prod.outlook.com (2603:10b6:805:6a::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19; Fri, 30 Oct 2020 21:28:39 +0000
Received: from CY1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:c0:cafe::9f) by DM5PR16CA0014.outlook.office365.com
 (2603:10b6:3:c0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend
 Transport; Fri, 30 Oct 2020 21:28:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT015.mail.protection.outlook.com (10.152.75.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3520.15 via Frontend Transport; Fri, 30 Oct 2020 21:28:39 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Fri, 30 Oct 2020 14:28:34 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Fri, 30 Oct 2020 14:28:34 -0700
Envelope-to: stefanos@xilinx.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=56470 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kYbwo-0003JM-Dc; Fri, 30 Oct 2020 14:28:34 -0700
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <stefanos@xilinx.com>, <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <robh+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v20 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.
Date:   Fri, 30 Oct 2020 14:28:30 -0700
Message-ID: <20201030212834.18270-2-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201030212834.18270-1-ben.levinsky@xilinx.com>
References: <20201030212834.18270-1-ben.levinsky@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2bc0a27-f01c-4d08-a069-08d87d1ac495
X-MS-TrafficTypeDiagnostic: SN6PR02MB5311:
X-Microsoft-Antispam-PRVS: <SN6PR02MB53116D4B1183754CA98AD958B5150@SN6PR02MB5311.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AQMg5CcBoPe75soAqQpvHdJxdNo9M3G88VtalbWGWE5TpCM+0HI7bjvXLMtVfIq+UB3UFatZL/eJaXTWv6DGeKK9YVoBWYEcNebTsnvqMhDwvQNkuPdSYUzbslpa7idFXA60swLtRTlFvAUy3kokcximeVvwsdXAc6uI7gfo9yzrdo0oFAheafbOdFo0cw6pmlLx2v1hVUjNiPt9/v1VlU81o8w48k4srH6MpYopnH3z8Rn1te4gVLNp92OanyzVm3EtfOUpng10n8mfOBv1TI1cYJ3o0bQwMNyz910qkE/1utqQawbsToQgiB/cwjJKwP+rCuN0lIu2CatAJBKokE1IbxI4FPYTu6kJ7PjGvwx6XPVZA+SK+oRgEt6q2BYYth4HUNNPPsoDYqeRLvRHAlB8c0qBtjVmjxWJ/Gcs7dY=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966005)(186003)(83380400001)(7696005)(8936002)(26005)(54906003)(336012)(7636003)(47076004)(36906005)(356005)(478600001)(8676002)(110136005)(316002)(36756003)(4326008)(2906002)(9786002)(2616005)(426003)(1076003)(82740400003)(70586007)(70206006)(5660300002)(6666004)(44832011)(82310400003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 21:28:39.2927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2bc0a27-f01c-4d08-a069-08d87d1ac495
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5311
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

