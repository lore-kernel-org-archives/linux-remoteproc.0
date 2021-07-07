Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3026C07E95
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 09:41:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DE1861C82
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 09:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhGGJoT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Jul 2021 05:44:19 -0400
Received: from mail-eopbgr00081.outbound.protection.outlook.com ([40.107.0.81]:3396
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231137AbhGGJoS (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Jul 2021 05:44:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcYn+CbZnoOWB4CkeGe5nrn/v7Ak13aAAfQJ3bOoP4nPi8PQyLVbWapyzLNPYvKS9egWv3/HOzKNRsICRUp6s+/wCzXlW9+ndhqjgH6EWfrvHtZ4+fskfSiJkIs4B3wbU9qXxUmfLrJ6o7anF92pGDfqYMa9X71i0Hk1tfSvH4VifcUD/71PIRqXIah+Icd/xFy2Fwj2EAihbSbZZN48tWwjAAcNB1vUJTp1OUZNzW69XRekN7WJmhB5u8qGvMQ0Jy5HUbuH9qO3RMlU5RedPQ7MQvB0mcE8oRSQYOBtPojDrmf6dvYC8PKjjDxexOVC4HnGowIdv4mw3w+nVP/mtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ4CCtzDIvRohMokDR2J0zvOA1H6R1v9iDVQXY60U6g=;
 b=PCxbHz8lGKmdJt3XnMeqH1aDvD2Fw2iqFI0RlOB90f7V6iaDKx2kPxI446GIZt8tFkat5ji9YUhAEK9Zoi9fAHIe8qhSZCQizHsWVmsRmRfAugRS4zkiji1T82S09orTnEt2zAT30B12g2OGmgLw3lcl/1WcFLWAo/4mr95PMWTr6LjEWrgRmRU/yg2kqin3pdGkkDcZxFFWIKInqr5atvc0lkUlSZlnBa+hI6DWcFif+afy4mDfgfffWErABqfLA9dLCjcYV/S6HbPsbZL0W01HMxMhbYbvSlSVDfUiX7POtozAnQRmyuTKjoGGgeZtatgdcaEAgHQTooRYEiCQxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ4CCtzDIvRohMokDR2J0zvOA1H6R1v9iDVQXY60U6g=;
 b=maJtbTPGmbE6wO3F44h/gW3axCQpIYCrMr4AhO2SHa692X0LTYkXx+0Km9z0iqM4v5Xo7TFs/1uvDEEvlwjxg+/U56bOo4RWwfnh2fY0F45QLh5j6DhzJJAeFOMEaFMWHx999S0V9bOj37bAb0QW98s2hL7E62G/Q+A1usV6N9M=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8710.eurprd04.prod.outlook.com (2603:10a6:10:2dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 09:41:37 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4308.021; Wed, 7 Jul 2021
 09:41:37 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 4/5] remoteproc: imx_rproc: fix rsc-table name
Date:   Wed,  7 Jul 2021 17:40:32 +0800
Message-Id: <20210707094033.1959752-4-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707094033.1959752-1-aisheng.dong@nxp.com>
References: <20210707094033.1959752-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0112.apcprd03.prod.outlook.com
 (2603:1096:4:91::16) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0112.apcprd03.prod.outlook.com (2603:1096:4:91::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Wed, 7 Jul 2021 09:41:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54c4b72d-dc86-4ea8-cfc5-08d9412b6a43
X-MS-TrafficTypeDiagnostic: DU2PR04MB8710:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8710B21DC1DB3FF2A33166AE801A9@DU2PR04MB8710.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01nJDq3eCjiGTQXvMbq7jzEiFMeIEowgm2hBxM5teds07hyDrPGgXAMFh3uXSGluMLHH9G1JJBnLaC5ooRlUrflqixXJkVBXw1LnmReLuJW9DYqJEhUGKXcsA6M6hWgKdYaoDimfRHBkI0bAct8aCVbYc59R4yXLo2M/wqht0wnu35k4WOVmgyA4HWAkK2YJDKJPwXFuaZJuN0AZvgZRTgtszg4o60dWufxzCadaw8Zzuz6kx2sTyTtXEwRtb+9O9OExJ+GKhL7drKj1lKXCsq4kH5921l7UXG5lRvOHXi/KIRYz4VdO30fZCa8snh3syLITAq3VFKUydKbfzla10+6EetkedqygrktakrYer/EDOdnYhSVPRSKhHevipPwZwUqH/giyiWBskwq4UubXcmkk8eRyqwcN6JYWtRNsj2KacagIQ3sz6O1QZlCHW3v+sqOPhGjSe3rQQkjDUWnKHF1GE+25rkKEjWBa0ARx+01CTAX+oSi274cH4vJWEjKY8bgeD9h2Y4sGaKs/ihahacgQmdkM8pIJLJfeBts8a+ktC7FatAVXw/bfCiVaGTfC1nlBJsSeaSp1h61FgUfVaDIGrb8zPaYMS4U+ea/Ni3Nc8LxOzZvMCmwvKIFiPaMB6iirZ5178ezsksLk/m3sixjkRO+NRCDTi2f/AlVti+VeXbprsLABhY8cKmBw9uKATw715bZGItFd/zqG5HhgcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(4326008)(54906003)(36756003)(2616005)(2906002)(86362001)(83380400001)(1076003)(6916009)(6506007)(66946007)(26005)(66556008)(6486002)(5660300002)(8936002)(478600001)(4744005)(38100700002)(6512007)(956004)(8676002)(186003)(52116002)(66476007)(316002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xczBY/WFFM8R2vgU7EsK0uICbDthgTGbzXS0n+fHHSxvPZivZCzGjjuuMSF/?=
 =?us-ascii?Q?zbTRzfFm1q0Ib3uSkP0fpM1rexxvfiY7yr15W4K8eG9+Li7AwvYQBJPO5a5V?=
 =?us-ascii?Q?37AH8zxoE6fhaEg87teVoIGxJx+AuQQst3XIJAGQrXeF0ZbS+cDjgr+GzsvA?=
 =?us-ascii?Q?K7f7e6dZ7DGy2y3cLEccZmNq7qpwnP1BFVG36WQm/3YCGlTRC69V5eiAUgVh?=
 =?us-ascii?Q?gCzH9GBkchzMMxuoieZbaG6y1SU2ELEckPGwxfzOypgXOk1PZnXhEi9euJ7V?=
 =?us-ascii?Q?/TH7YvOJUKZzdwJn/OolKOZaBk7GiUy/loyUD43k7/9sAlF6S67f1HBNumAN?=
 =?us-ascii?Q?xjgTR2ref3vALdFTqzzox2smrsQ5d+hoKNg/3OLnW1DFbggx9ZbTmwhZqh21?=
 =?us-ascii?Q?DmbecYfis5/UVYwdfUlVomsrs4jJniuPr+/pvUcwk+MX68yYpjRiTmLpLMq/?=
 =?us-ascii?Q?TtRB8/t7aM+ZJuHn3JlJsICsr7JfdxYPbIebAx89rV6F8XpXYmhl81FXxJbV?=
 =?us-ascii?Q?25XW/wFerPZeJbFG2rBNHBZ+4BhkE5FyzT0lVMozmRpD7D3qR7BgHXLPxryE?=
 =?us-ascii?Q?zCfPEz2olnjarUJJc76A0tL1sdK0soJNmciIcNwojddllwA04Z9tuAko8PXA?=
 =?us-ascii?Q?wscCMi2daAOyny1InnRzUXBnG67GrAWiGMZASzj4uwWZl8nxUHNmtqkOGRUY?=
 =?us-ascii?Q?Zl6I32faTITuBQG0BG/x81NiCoVLYsi977jTXQiLmxROAAr6XtprG+Fu/eED?=
 =?us-ascii?Q?N3BfYydrMmqHS98rR+Wn/og8PJ0k9/EnqIPWXfIg9YOrltrXTadQVhKBDRXK?=
 =?us-ascii?Q?NJiSJBAjZFfS2i5G5SEajIjG5SWVfYYxe55UjtGM0xnwVFv5BOWznQctZeT4?=
 =?us-ascii?Q?Z2eGZxmP7RKqvegvxI8nvnnrEk6KqVaQNPKUKdFXxbRS+RvpQyPdmjcJjhms?=
 =?us-ascii?Q?FnI+d56x3xI8N73LzD+DpSpip4lWMcKDZP7P8braDzQJVPwqfGoXEAfntgZ5?=
 =?us-ascii?Q?ZnK6TFMcAOEkI2RNfZz7jAx7dJj1kBn3uUWkwHwD/Lc+56ztc3EnFOZs2utm?=
 =?us-ascii?Q?/QNiO98hMz0vxQ1vGc/vEWvEX/vVGRiOFLYt4wj+zHV0B+WsT9cEfjjjMtO7?=
 =?us-ascii?Q?uRiruOke+Li+M+dd5nZfjWFlf4F7pX9SCdy5FPr9g1U+2gr6jblFlQmjsRLX?=
 =?us-ascii?Q?1QngmbCCzgJe/SQSRk4dhvQbeDg8A2zWapJtjGRS57eHjpopHaVlg9yfameu?=
 =?us-ascii?Q?CjhNS0pKS1HNvOaQnqu4jRTOEri/R0kpqenn17+NOur3jvDZdg2/hEnee0xC?=
 =?us-ascii?Q?UD3f/thZj53V8HTWyvyvoBVb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c4b72d-dc86-4ea8-cfc5-08d9412b6a43
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 09:41:37.4910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wqn8CT9erjXjiVaa25EKpHE4+EcRgGHifPJnTMP6ZWCeH2xe+WkURQNswYxq1V0cHs+Wl7SfRzeeZsu6xr9/pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8710
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Usually the dash '-'  is preferred in node name.
So far, not dts in upstream kernel, so we just update node name
in driver.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores booted before Linux Kernel")
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index abfeac0b1738..ff620688fad9 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -604,7 +604,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		}
 		priv->mem[b].sys_addr = res.start;
 		priv->mem[b].size = resource_size(&res);
-		if (!strcmp(node->name, "rsc_table"))
+		if (!strcmp(node->name, "rsc-table"))
 			priv->rsc_table = priv->mem[b].cpu_addr;
 		b++;
 	}
-- 
2.25.1

