Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62DEC433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 01:59:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D8BD611AF
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 01:59:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhDHB77 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 21:59:59 -0400
Received: from mail-eopbgr140053.outbound.protection.outlook.com ([40.107.14.53]:16101
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230470AbhDHB7v (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 21:59:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8KxW2vRPluv/BseEZrpkWZuCAt1s38kTRwMtgnO4GwFsyTdwJ6Bhwhh4rVrD0RJ/Fgy2EJ4inpA2NDy8KJ2CxfgPS52rF8fPhIIykYheytK0RqC929w7/zcRMdbAebVbnibyVyEL+9ddNzSY/xPzy36Zm1suuWF+h506tGTlcC7Mf7Wn4OwqLvli9ahkMZEHzsjuEYNeUshxAxZ3oD5vmmKxGYhSQBomNnQS7ld1rbsxDVUDxVyqpqFLacZ+lQMnE1FuoTUNDTBZTjdWnhqrQ8dV9NS0bwN6se50mA4CcsiqqfmwCmnFQ+agL+g4Ih5D1N1C7STBk5AD0fijMlVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1kNPoe71Z6DxKMLquhWilNNh8lcd9+9GOrw/NZSOkg=;
 b=e6avbe+npE1YOOsy499Kv5L6vgL4fPY+ditV20Wo343fSNelXsbNNZir9ZmsOONXAEwcqrKRRBkk+OzYWOH5DEmnEqzvg20iOXNFsO5Rc4pd4wMWYBia2LkfffdfXoYJdAbsD4cUsARz+KBu7grAPyWebH9a2pV0J2pS6bRXLBGJQIkSj2Nc9tm5DCNQpdCVr/Fjomqjycv1+TJuEMAwuHtJuPHCc1Yu/RW1kFw53+qZqrV5jY49JyZR97wVVZwasNok+ZjAmHYkJdYNkXDIbD82XfX04k3aRfiJOu437Nf3lTufmvseciATlY7jwf/LmP5AWxHIirjV5+JSayB/fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1kNPoe71Z6DxKMLquhWilNNh8lcd9+9GOrw/NZSOkg=;
 b=A0IjYgon+VditPufQf1VoynRmM5GwlPJsPeQM8g/8PjfeQitP2AadzWJarkRdYmNFrmPCEaR2gIz8+tVeUWK0zxNrx7CYGQ2dJ+gN/7Feb6aZBWEkBXmxlWLNHL4TksgcvlBqAmsRTfVW60kFgClXaDM1R83MBVKpPbmBdDbSzg=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8140.eurprd04.prod.outlook.com (2603:10a6:10:249::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 01:59:38 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 01:59:38 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 3/4] remoteproc: imx_rproc: move memory parsing to rproc_ops
Date:   Thu,  8 Apr 2021 09:44:48 +0800
Message-Id: <1617846289-13496-4-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617846289-13496-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617846289-13496-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0219.apcprd02.prod.outlook.com
 (2603:1096:201:20::31) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0219.apcprd02.prod.outlook.com (2603:1096:201:20::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 01:59:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39066d99-c706-4f53-efcd-08d8fa31f70e
X-MS-TrafficTypeDiagnostic: DB9PR04MB8140:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB814052293D07C156350A43B6C9749@DB9PR04MB8140.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ti2ezZTUWThkhw+QfOLBm7nJe2QyLD0SfHT1pq6iVEoLOROhp1BT0d/rUNjxyf8vZd1MXXB3SzmvDSpA3nYHi0Uhz1LWu7mm0aQuUBLhPn2swW7hg3Tl7sM5FkoJiJXbDbbjiNe7Kg1puFVW6TgsSb4pIsYgA4XiBy7Z78y9DDpawz+71exa3XPOiGnVePpV7ai3DJ/OCDM6M3s44/OOCd/6upbLQ+/cQvoSiTKM89PFXd4/Yl0FGtdT/1rxgkaQPxcdhnOw/CWDORWfDY96Abdgcq3CFQrPJY7G+f/hOmvw3WQpJuomE0WA14KWywsdYbWZ7vcoYXhJjbmVoIV+q17MCZMcIaQQNu4cuA0ZF/xhrlKTX0FPJOgBGFL/38JrKg2vgmWmCnphyQak1fqD4WGalNjbsOjcipM9yw+iBsncYfCgin6SyztFyMbZUgfCpXcVUlGwlFvQSZdM1VMbvnEODXIFnxVkg2ShYvRLDqwP8TpdCTsOzKQ4Lff5GQicPVFlGTNGLiiGKI/VxBo6M2pqW/aRlmwcFC6h9DNyLAuRMXrZWriHIugVUg8Zt2+aHKaSkQ6r4AK/+yLL4Njn4w+LwvKDdnMjioeBUY2QC0jlHle38EcXCAxTCrsTMws14/QfIV7vOETBXnHhTUUlBCFw6sAPTEAficlvv0KMj4A0tFQmVeS44qwcI4diAv8KuuRq+/hmmeOMtI2boIuMjvxqJY2URs3MbR678RJMho=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(956004)(2616005)(4326008)(83380400001)(8936002)(86362001)(6486002)(316002)(38350700001)(5660300002)(66946007)(52116002)(6666004)(8676002)(6506007)(9686003)(478600001)(26005)(7416002)(186003)(38100700001)(16526019)(6512007)(66476007)(66556008)(2906002)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9O+6W2bIdxaKVjnns1LXIK2vs/yQ0CJrHZn6GlpPF5YKlQFSy33YHnEnA/oh?=
 =?us-ascii?Q?bgpqKWWskOhztAOizO6505faOAsgKPK/xd08NuqQ7WEXnd92byFWVh/bIGyv?=
 =?us-ascii?Q?l5CiPcKlAbWmNB5BEShfh+3GsJFYUWsrWUKO4lWDcoAm2CVLL2Sw8J9D8yA6?=
 =?us-ascii?Q?xFoq9rwJyvVwEA5rbedpTSTDbKi8TuMQ2u37RYpJsHrSOKxYDJmWNDTpqCys?=
 =?us-ascii?Q?b5447Byfz4yUaUhIjIwWiW4aU/LQSIbh0uNGZyVNBNbTox8JXF4g0FkmlDTA?=
 =?us-ascii?Q?dnE4jP7C0q3eYOUtGf91/KbDhm9COmoZKY14y8bizOJuNyfwI2F/qjwN9tKV?=
 =?us-ascii?Q?4nnbhD2tGakQyIhohPDxxGkIp/8SpfXtIJQ/f08g1YcqKcRYs2uMWqPjoOCG?=
 =?us-ascii?Q?H1S+YOrHJhyKt0iCUUAyejSV1SLwIeTpBax2P3VPvSsNoA8e/PPH6RkcLKuc?=
 =?us-ascii?Q?vJy2alqng31lTQ20O4cIoBm4oo6yVCReObwzofZJiXadiKlsVlIcO9crenHP?=
 =?us-ascii?Q?pn/1/FjwAYpuxI6Ecvxqp8yFyX0a2Nm6/SnDMUziXWqO2HHjMftTCI2NKADS?=
 =?us-ascii?Q?REgW8Lp4BDlfO8oL3/Hi2ZbWFlCcaPg9t4xYvwGk7+ITHATNzj7l/me339iz?=
 =?us-ascii?Q?mWQPiuZsxMyEtvO/EHakgG90mNDlOMKG3qhwH0JYeHx/qdAbraGaWbJSNzD7?=
 =?us-ascii?Q?/kqXhLWN1tVDvPEz7HFav+W3gSOaTaaRMJUkwj7J+0IzixoOJSUBXcbULk0o?=
 =?us-ascii?Q?UFTz8+IkeomY6rAcQv8Qsz2Vbx6VXgV85REAPOXmzKmb2y/iw96QG9+Xtsd9?=
 =?us-ascii?Q?ZWPh09k4l0+iwPaIZCxZnHsBXiYnj3H9l8lUhk9vR1+sbQ/p8FiEaKFH4+qY?=
 =?us-ascii?Q?DcUuUge1LKmBEky86dgVU9K8zAGa+hTX5iL+3ftT8guKTA0St1PQcAjRd9Yi?=
 =?us-ascii?Q?5x3zBDJLXyj7pp9o15oxY+IpdO8iQBsB6L3H64g+yN7REFnwHR1iDP4vkAkX?=
 =?us-ascii?Q?SP/hsViipA7Qaf3uBhl3MasyyU0hFnIkxGWWlSEPxJQcYda87azN1H/9tyX6?=
 =?us-ascii?Q?b94EmoigpYGPHOH7XLv+bkHlS/zIkEkCEhvI4Y3OfRdZH6KK5ZEJpGtr+77S?=
 =?us-ascii?Q?L5+O6ZzKi4EqojAWxfDgvAmqDCzMZimwYznp62yo1jVq/Q3OGwTtnjvxupds?=
 =?us-ascii?Q?3+aTT09xOhXnuIFEd6W1OCiIUQdItPVjTAhg1vv2DR2FRTLYwqV4CZGcMa2Q?=
 =?us-ascii?Q?/CtXJsJTVWH8ujkbLS1xwN8w7AxyjRcI9HbAHOR8vSzDEORjtB1k+HqdOd0C?=
 =?us-ascii?Q?7LTgr0EXOzOKy0nvE9O//h9YpvE0VaJNVrhUiyejarUwjQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39066d99-c706-4f53-efcd-08d8fa31f70e
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 01:59:37.9717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIXnn9xQaSt7vrut0ZeZd7Z/S3xn2HzbAAEAbQ266nRKE6OkvZGhQJpQaEh076cxVm0h90+qJfP6GAKiDytL4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8140
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Use the rproc_ops::prepare() hook for doing memory resources
reallocation when reattaching a remote procesor.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index b05aae0ad7a2..7cd09971d1a4 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -317,7 +317,7 @@ static int imx_rproc_mem_release(struct rproc *rproc,
 	return 0;
 }
 
-static int imx_rproc_parse_memory_regions(struct rproc *rproc)
+static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
 	struct device_node *np = priv->dev->of_node;
@@ -363,10 +363,7 @@ static int imx_rproc_parse_memory_regions(struct rproc *rproc)
 
 static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
-	int ret = imx_rproc_parse_memory_regions(rproc);
-
-	if (ret)
-		return ret;
+	int ret;
 
 	ret = rproc_elf_load_rsc_table(rproc, fw);
 	if (ret)
@@ -399,6 +396,7 @@ static void imx_rproc_kick(struct rproc *rproc, int vqid)
 }
 
 static const struct rproc_ops imx_rproc_ops = {
+	.prepare	= imx_rproc_prepare,
 	.start		= imx_rproc_start,
 	.stop		= imx_rproc_stop,
 	.kick		= imx_rproc_kick,
-- 
2.30.0

