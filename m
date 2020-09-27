Return-Path: <SRS0=lozc=DE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16368C4727F
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:15:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C05FA221E5
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="QTgIQOsF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730356AbgI0GPm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 27 Sep 2020 02:15:42 -0400
Received: from mail-eopbgr30056.outbound.protection.outlook.com ([40.107.3.56]:25733
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726382AbgI0GPm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 27 Sep 2020 02:15:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DDrPqo/jL4+p7B08HpS0b7TVEXa3wOo0Y95uw4gYbZLcGrPfXZh7NVdFuXRBsLEK5dlS5bVs5dJIwWUF5gBJ6w9GDk7BFdD9pbVqtRUYNMeMt03PENHnPDYfdIB8IX4FjMe2LLqJU1PvJMx+av34JcMyNP7BQW162f+DrF5joAAHQRkQMqReOgq11hz07YNA8TspyPQ5Xc721pDxO1xsVll921CxOFtAuZR0dQhRty1jvBolsjjN3KYyAyRy3eCCoeC4Yv3fbtzSn9qYzRRif2kBol1zXaHjFD+cBXK/eMAALpUrlw75A8gEBlu6dsY5kVTgx38phgI9v2Sbzd7NlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1iNRtvNk0gmd2Qh2e0U8a5WKa89gIXMcfiVUBBaOVI=;
 b=OJldqWGB5jM5T6n3AO2/WE9YiD1r1AIOJeSRziwIhqAjsrpRSkAmMZ//NeVmYu6aopNQpw0LhTxPqNECjGJSyO2VXv3LRMGs4KgsTYR12UBgWoMXntC7/wm526R1qi5JofeArLoTQ3CyJPy5TuWxyyqi2sQ5SePxGjyOGq/RCaCESl94MEsQWF3SHMfiwV4+c9A4DEiDU9W93HYxnP2OpzrYxawlOgkOkeeyOaUTz3nXmNwgjAtPGKm5R9ywrWCcl/rk7sN1Jv3e+KeZbXIApkuMh4IQ+JoZ68jqGtK+LZVx6wUINluvC2rxBHm7AYCS/QqpbzF+0guy+w5aXrpJgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1iNRtvNk0gmd2Qh2e0U8a5WKa89gIXMcfiVUBBaOVI=;
 b=QTgIQOsFp7eh9HaioVGrvlvu+34WKHFf5HISqEQICAWuUiDBssV/qmC/N5qLamOcMXxJ5DU7v+NdsKDz8OpGrlU6jQfgw9qsVltyoIR5O/SAclgc6w1eWBD3c3Kg4+vj81ymqfivrO48mxhvOBPy+95BiImQ9P43ipSSYAsdHBA=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Sun, 27 Sep
 2020 06:15:37 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 06:15:37 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH V2 3/7] remoteproc: imx_rproc: correct err message
Date:   Sun, 27 Sep 2020 14:41:27 +0800
Message-Id: <20200927064131.24101-4-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200927064131.24101-1-peng.fan@nxp.com>
References: <20200927064131.24101-1-peng.fan@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0178.apcprd04.prod.outlook.com
 (2603:1096:4:14::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR04CA0178.apcprd04.prod.outlook.com (2603:1096:4:14::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Sun, 27 Sep 2020 06:15:32 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ffdea49-05f2-47c3-01b4-08d862acbffc
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB463302537E1691E590A380E888340@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BMNDdaZOGfdRVXv71IhLCJDx6l+SXKmwHdMW9pta/h6lQhKvkNwhLB7h6uA6C/1c5yBmeKDavlISfklxaZcy5pk5qAEtNuYKGbHh8xVzuhTog0JwraGnhuMofjEdwAHcvPx+zE4HY6K8Uik5I0+eV+QFUIOoC0z+zIe7QXcOMJx8Sruzydp5CAX/hc6JTeVaV3Dl1JqWhFDu0HSTDmy/zwv653Gdbp2QoxLLwU79kAoyc2QTyQqC4aVqDx1SCCZkZOwCy3lQFRq648bQp0H/utzVnZSXoDMatdbGZnQ3EyACxElwwZGAIXS9r2g5w89G0wpQWO8QuNVZ4pGqNWoqW+SBf+2fT6bWPqtyLqEKVf4sew7bJCmp3wZZ0l+j3Rbm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(16526019)(186003)(52116002)(7416002)(6666004)(6486002)(54906003)(316002)(36756003)(1076003)(4744005)(44832011)(5660300002)(4326008)(8676002)(2906002)(86362001)(26005)(956004)(15650500001)(478600001)(8936002)(66946007)(6506007)(6512007)(2616005)(66556008)(83380400001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: iGE1C5Xk8NIHWbOsnRJ5Qu49E08y9EH7LhhbWcW6JRYn+wzRenqiT6Qe2JNjXu055eVFYYnVVw/YtZKYj/KBOj7TqHUT5rzEGKbK8iU0d/8QHoRWkHOc73SZLsL3CNNp6/w+pwTki0mfdzmSCfVWPjVQ5iUu/CxR4fKSH7Ryi9pzxeky9nREMPoTnM+I5KMlQ8LbiDgdrbl+v3jkZd810FOQ/gWHV5gFeJYmQ9Km5rtQKAGi7+Io4DIBUuCc/3I/Jz7BiSMphUVLUqaoXH8hCGHtykh2LEn5S7ycnxl6rwRB6qqj2vK0+aNB+luPHDrI6sEcDNe24SfEQRvPRKD7pNomuVr85SW721LG8CKjzxfcviP2v7CTJRx0tkLarnbMoQ5Ld5iggvzS7FiJ4L+oqxl3M3TJzvQOvFTchanzpJhfZYNMTj2uw+OM+c/i12RwUu0qXwNlnWLttQZ1vrLhR+ycXOBdfdgxvT26OzIz/Y4L50NCqjCWKfObx8CTh57TwezI+NdN9QNd+cz4GXJmOonYaNumkLtLiOmrZxYgCZQy1snuGSouYhXBv9Kegarr/GVcxLy0VJpjajFPI7/QJrvNBP2YCWHIT1IZSfjilmBMaZC8OZ8paKaw2xGakeU2t1kvlDO7zj/+FtwxCjCXAg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffdea49-05f2-47c3-01b4-08d862acbffc
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2020 06:15:37.1164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JR7OVrU815hZ9ppjuIAotJ3QHqGQwuuvcIynwFFIHaW4EQ3j13OAmQ9rDI1P2eSCokx/PFz/PAXwL6mxL+8pPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

It is using devm_ioremap, so not devm_ioremap_resource. Correct
the error message and print out sa/size.

Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index d1abb253b499..aa5fbd0c7768 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -270,7 +270,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
 						     att->sa, att->size);
 		if (!priv->mem[b].cpu_addr) {
-			dev_err(dev, "devm_ioremap_resource failed\n");
+			dev_err(dev, "devm_ioremap failed\n");
 			return -ENOMEM;
 		}
 		priv->mem[b].sys_addr = att->sa;
-- 
2.28.0

