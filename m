Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6E6C43381
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:03:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A876207B6
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:03:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgL2DDa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Dec 2020 22:03:30 -0500
Received: from mail-eopbgr50055.outbound.protection.outlook.com ([40.107.5.55]:14917
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726429AbgL2DDa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Dec 2020 22:03:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+17Oj5lBe95q3W90/dvresZVRZtIf2jAgqUOqEjLP+PRs73r2ufuqWW4+PYacyM9dfA3wjGRXMD2kWBhgcdaYG9baOeHFb1o9DufFtrQhMRqEHlIPbAUvjYEGXRFDwPGXd0NBv2nKgXec8EZzKHDUQmAxolxracBszjykeBRXtrZfvj1Rgga0sm3lC2edc/ezhuPyG03oHxgngVjDoJFroZegRzP1qpOBcscr5ZywQLja0MVk8AA9K82g4WCoCEIZqmF/jApBvr3VRSFcDcsb150/agy1o2dlf1sZzMHCEqlCR5m9I/VfbJFHb/yrIJM0tap2eeDnReU5h+1WH6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Y7nvuV6YmxTo/n53V3OedPl/HPso53UW1BxgRUtTA8=;
 b=OCWQVYyXgQ6MEmrY7XhUyqblqOOiAEdulqQA/Jx8yaCveqXtH8aH0NgGUTMX2yBZ5oOHim57b/JmeHd9Y5YHYnSfmLmoj1NUBw/I1iRw2PA2D6Fo7giH+dZ3rnwzDJI9ettxjIqJW/NzUJOieGYWwTJqcLjw48byukKffTH9YQ9qvq9SfNDRPAZenHUei9uneSk9tlDwC33FLrBN0lW7LUNhOoRLfWNesl6MvqlRbrxwS3PLQTzD1M9E1BtZUtjfDkYVVXsTvWMX20uBGDP6yn3X+Bhng0u8Svk/1ww4PP2C1ZCdjd0BJi0Pdcf3qeMZvz0DF/OomdSOhog+XAlCow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Y7nvuV6YmxTo/n53V3OedPl/HPso53UW1BxgRUtTA8=;
 b=gPQo7vdsO5AuxE3//qQE6UI8p6VK4WfVVbt/IWTpWsm4mVD5l56jsEIOyM5MORJguoZYta3ELPLuFmquwbNDNrZy7rKl6KuZifXyAw0X6BQlZXKIeP+ng2klvbc646V2AKv60Jv0XMpJnLFTwUyyZy4o5sy3ho63Rd6lAFHyJqw=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7178.eurprd04.prod.outlook.com (2603:10a6:10:12e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 03:02:02 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 03:02:02 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V5 3/8] remoteproc: imx_rproc: correct err message
Date:   Tue, 29 Dec 2020 11:30:14 +0800
Message-Id: <20201229033019.25899-4-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201229033019.25899-1-peng.fan@nxp.com>
References: <20201229033019.25899-1-peng.fan@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR06CA0178.apcprd06.prod.outlook.com
 (2603:1096:1:1e::32) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR06CA0178.apcprd06.prod.outlook.com (2603:1096:1:1e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 03:01:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cff33e03-6a0a-4d3c-e2dc-08d8aba61db3
X-MS-TrafficTypeDiagnostic: DB8PR04MB7178:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB7178EFD17FA54C47BB40D77E88D80@DB8PR04MB7178.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ak5S8N6jG9ignrr83CQihDxyonOV48JY+ynpMmiqXiGVsJ3F5AYEd3SiyDDcBW+kP+HYeO0f7kXHoN1vfLP7axDQuUyKgfQsqwW5CNpIBE3Gpi0H0adyr+9hPUymwftwBjBEbVoNoDnJ8AHkZAQMaNBTJx47eECdzLdq6cwteO8w7uyIzBgXRolwe1VdvK1YAFNBwk5qnmSOz02OuNF0zTVr1xPNWQrpcE14x4y3LZP3qp60Fo54nVykUb6I1Pk60joOZ+hWSFV7l+tpc4BMaZKxvvfhzMDtSjJ5fIuW4nvSl5ZAXDDiKzf0CF7m40LKOOXve7/p0nWgBrN7mloB2t7mZj6Z0QipF19LSAe1Yneez1g+OcUIocaBpMkTTc4fznMtSknBFgrkoUge2IvjOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(36756003)(66946007)(16526019)(9686003)(2906002)(7416002)(2616005)(15650500001)(86362001)(956004)(478600001)(83380400001)(8936002)(6666004)(52116002)(66476007)(5660300002)(66556008)(316002)(26005)(6486002)(1076003)(8676002)(186003)(4326008)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CK5og8gM6MtL0ZUd0Z1/2/g/RcXkgivrdRMlbKSjX8ikyxbH15Q1MtLW2/sv?=
 =?us-ascii?Q?9ZHK+75YwGikGbX4CssWyUUsYtlsoTPoxjtOjRrqmkm0kc+HPhZ6bS8oTYJJ?=
 =?us-ascii?Q?hHqJYjBJYIHYQshb3HpzoedygROG4z8FxWFtACpEiwjCdrMO+G8KkuiylS8j?=
 =?us-ascii?Q?PezuoVxp3NC2Cef/8l7jR9Wa+5CCVPfl+wf2yXkB6k4rbBwTuXE7LlA5ffM5?=
 =?us-ascii?Q?u8P3Qwr3iv4uPrkKDS8c1sHk9yJt25pgIzFeV/hSeLpm4A8xw19HZPuB67o4?=
 =?us-ascii?Q?kv9Qyh8ojzXImwhKMdw0sY1ZLqfP6psQ2SOBxw+Kfi8lWkw7yIuKioKwEAp8?=
 =?us-ascii?Q?MkHTn9zNr/QQSivogoyv0AguQDEgN9t6y6F0Fc81mLzbDJkv91naTDAcqBpN?=
 =?us-ascii?Q?q6zdNiS6/SKv8qE/DBc70g2yyYAZsa6Q6lpTDqMrqw8VfuBIQZcASZN0OkmW?=
 =?us-ascii?Q?0atUQYpU2W2hrKfAaMuR2APQiLNTxCU2G7p7Mln+SQH4c8sVBsIBXXTsfOFQ?=
 =?us-ascii?Q?WcbjR3aPes9kXRTGCzGfj1MoZO7Ni25BOup7GQvO/GwQpz8GQuIp9364sMHw?=
 =?us-ascii?Q?E5kBsFe//vut4rbnILEnKjiObP33hdrNwFQ6sPaVC+UGt4A930OitAn2jlNL?=
 =?us-ascii?Q?WDSIomEp71R0k91SoR6g9IeG5HlVWwNP5Gt+S2m3CJWPgHHABtOtIKY/oiGE?=
 =?us-ascii?Q?K9BlEMBRP1pLDL+Mh37jx2ulNqhg9WdLK3ymZ2qHpNuNeLYOmxO6lBUSJHA2?=
 =?us-ascii?Q?n/vDyaSEO2CwV2y5pEgw3uJ9/a9Bo93XvdnysWu+ljJgIYxom0uCDtxqC82F?=
 =?us-ascii?Q?Qycbsfyb5S6UIXYRXg4/k6JTmvw1pWb6PUcg2yKOdc0MPbGz3D8Myt1J1VIR?=
 =?us-ascii?Q?J+WDVQQT1E+JfBvug98zEoZvF4wf8IHG56Rzgohwab9brzVy6l4lx98ooDFc?=
 =?us-ascii?Q?ZL97m/gXm32pg+UgL+d5csMIycolVYy3cXzh2qVrVSVwe8f6uYPfPS9QsEX8?=
 =?us-ascii?Q?Ons0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 03:02:02.3044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: cff33e03-6a0a-4d3c-e2dc-08d8aba61db3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcN11GKvU95JvagQYVZf5Du5paA9yqq0aU2WOvwyYIqk5nFM3Tblz/RxMlT5QxhQ4MFTPdtHwDvbDWrrdzPjtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7178
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

It is using devm_ioremap, so not devm_ioremap_resource. Correct
the error message and print out sa/size.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6603e00bb6f4..2a093cea4997 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -268,7 +268,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev,
 						     att->sa, att->size);
 		if (!priv->mem[b].cpu_addr) {
-			dev_err(dev, "devm_ioremap_resource failed\n");
+			dev_err(dev, "failed to remap %#x bytes from %#x\n", att->size, att->sa);
 			return -ENOMEM;
 		}
 		priv->mem[b].sys_addr = att->sa;
@@ -298,7 +298,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 
 		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
 		if (IS_ERR(priv->mem[b].cpu_addr)) {
-			dev_err(dev, "devm_ioremap_resource failed\n");
+			dev_err(dev, "failed to remap %pr\n", &res);
 			err = PTR_ERR(priv->mem[b].cpu_addr);
 			return err;
 		}
-- 
2.28.0

