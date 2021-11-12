Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D792C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Nov 2021 06:35:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E20FF60240
	for <linux-remoteproc@archiver.kernel.org>; Fri, 12 Nov 2021 06:35:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbhKLGiA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 12 Nov 2021 01:38:00 -0500
Received: from mail-eopbgr150078.outbound.protection.outlook.com ([40.107.15.78]:15008
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231179AbhKLGh7 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 12 Nov 2021 01:37:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDqRl1wwW+DqcRorrTElkwm4AjwCJngT2hDmLkiDcu7BDDR9BhbLkI/6yDS96O5kNuKxkNYLRHqPr9m5iUwdLWjmX22kTCfO2Za15jwumFAp1htMHkueaxCHT+Zgj0O5HtalLrshZLv27GeIqgPDNbMKgszVwd5xthPG4bgnGrEuUhm4+0CUtsl9m6XxEF0vIjmBAdOioA0hfgThWaaWhuOnO5NpLx9IlD0qcl1aWrw1gNJVdkMfBEpl5t/U9YXChgRmeYkGh525S8vrckKb839VCK12JbJQHxSQb9gILLI2BAAWeP0qHLQVP2DJz9vsJuq/bE1aXdNxdAdUBj5x5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUjBQ9r8xvttfnglSVj9I5aUZX3QrHEHUf/5O7J7Qu4=;
 b=h87lMYNRoUNMWsye4EpD7R+1FjmrZEuWI1pQDfCxyKB8OXljRisdv8x5I2IAiXsdOTlRYBF782ivfL/GZW2gcJ36s70iCR2WiIiw2lzuFqABPKmuQOwFEOflW3FRPU54ujBTwEAF+0Sk4SrL/Xt1shvrL7RQ6Rie8Je9GYbn8T2I+hqRdghk4IcXJZrRogEXhJj80tBCBmLE34GN+G2E3CvQ447GdjCnMrk3K4vhY6iiXnFmrdqWbDClKHeOXnq96CptyfKUz+lIQDnN9cJmTqbDazsn17NCdYj/r1u0xpn2HsauhJX30p/KSRVD4QIehwyJdTQSHNOCB0snrOL+yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUjBQ9r8xvttfnglSVj9I5aUZX3QrHEHUf/5O7J7Qu4=;
 b=HDLSZnKUWxy82ysqyapmFFOB8JLYeoLtjeTBZaEzilJFXwnuVz+fsxszDlsnVM+EuHnU3gISi8xbv2bGUl0zpFpPgJyungvYPjOngTxZCEMbdybLafA8zsZfdSaywxTkl53C3oM89q+EiPBDm8irwI1bCRVJDgLqRNSlaMj9kjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8886.eurprd04.prod.outlook.com (2603:10a6:10:2e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Fri, 12 Nov
 2021 06:35:07 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Fri, 12 Nov 2021
 06:35:07 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] remoteproc: imx_rproc: use imx specific hook for find_loaded_rsc_table
Date:   Fri, 12 Nov 2021 14:34:16 +0800
Message-Id: <20211112063416.3485866-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0112.apcprd06.prod.outlook.com
 (2603:1096:1:1d::14) To DU0PR04MB9417.eurprd04.prod.outlook.com
 (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0112.apcprd06.prod.outlook.com (2603:1096:1:1d::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 06:35:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68a26c79-2848-4a21-e639-08d9a5a69118
X-MS-TrafficTypeDiagnostic: DU2PR04MB8886:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8886DB0275148AA34D18D94FC9959@DU2PR04MB8886.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hk+cJPu+ztTYgOCrdK4XeMfm505tgKAjPmseA5q6K4UgIeLr7VNwiyTj3jEhU6Z0UWD+GViUMABDrfokcFvng39vsyLtxNSnaewpzuqvkROc/r49CeYJRFwcz6s3mRD5DlraQ8n/YG+Fo+e2xU2kB20LGwuWNg2Gji6uN0/iEWb/6RkQ3bj+3UlPaRBY+aThzBJxMoinXtbz8oY0kMIN+ZtXZWZiRnNxZslMUldpgYnJUTGLMhNw65HVRMuteIyb8B8Z5RSLFHbbC0QBVEKs47wtr+9z/5ddKPkYnV27W8/Ck7PlaD/rt5G+FwoMd+RabF6b/gsdrtSp8TsACPszB7iVh4nV/z1kX56sTHEhG4hPOJlwyexYalowtwKSoDIgdF1IOs7s78cFKIu5cLbTMqm5BgU22HBdowAA4Bp5Kv31RoOrcJN+V0xno27aYazoRi4sSEqr+H9cCnj3qvwkbOj+RfE8HRGzJMesZ/uouWwWasTCpJd/XV7Uc3lM2DPtHL328gIM2SDFZ8kVuigdKTLULjbhTzEk7HEVLf3XFyxnre/is5rZMD8qAJ4ncJFqa7cfCVibLShyxKRjJo9SKITLfgEZKIDel2kOjKHrwRO2HAF0FusPb1b2SWKF+Ym2rxhuIYiSq6DIsY0OubH8PkWj1MkpwsF1k2fr2R2y8htly76p/ZsTJkWNId8UHrx+kQnpRRvOCzD3nGdQBSxtGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(186003)(38350700002)(26005)(508600001)(38100700002)(66476007)(6486002)(66946007)(86362001)(8936002)(4326008)(2906002)(66556008)(7416002)(6666004)(83380400001)(1076003)(5660300002)(316002)(8676002)(2616005)(6506007)(956004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aqdZ+G4JvkA3X9tu+xC9ThZnFCL97cJgCxVUWmf3aVUqBIFhwI8Ybb1AQ/BG?=
 =?us-ascii?Q?WADSKycjkf4DlmoPS85YrJfmorBGSl7ZsepOicymsD+Ui8RymQduD1aM1+Fb?=
 =?us-ascii?Q?UMra7pEB0DfzbQ+lzHmkO0B3RNX/NeUF8rc7ckegaiXqiZoLaUjU/JhO2Hxq?=
 =?us-ascii?Q?6ot34LXiJdinFuqvkH9LOo90zLaP+fVyrdeJtpzU4GaiMGxv++xXFJHcxtdR?=
 =?us-ascii?Q?9Q+WCFwcxSEC2/S8v+Dje/drL/ZmFR2hrXaQvjxSK0wEY/3kKpWqe83dwhsG?=
 =?us-ascii?Q?U2rupxljRU9kvGazxCUYFU9gTgni+RDOdDs2IL1FkTLdJmdMqHFDGhWz5ff1?=
 =?us-ascii?Q?79WR/W5wkTLD2SAmrzI1OLXviz7pFj4siPl535xV15h9cRGxbzNLnP5Xuspk?=
 =?us-ascii?Q?2ykxbL+QuaObgb27ZONlCtdA9XRWnMxWA0PxG3u3V56aj3kUbAApxAhT0HJB?=
 =?us-ascii?Q?kQoskM/2it15TMxlNKVAD5synfIxh4dCwf8PNeNIZyTme/zqr9JNatSxwHFW?=
 =?us-ascii?Q?lZANpMnBzLYB+1NAhAueoHODbu4XfPfNP/c7LZWCjkN2wo1fC2vG0fhhRCy2?=
 =?us-ascii?Q?H9FC8KRdfLUzHK3Mwo3J2hT5V0Qs08OWe9rhDf9klYXaeo87bJLIirYkZonS?=
 =?us-ascii?Q?Fr4duPdhAmTFLmhy6qR+nUkAvhl+cxmiXPtz4Ga2f2A0vzXAKxwJJOT2mEkz?=
 =?us-ascii?Q?pFkCttISEBflg/sNAHjhhEEXoxNBC7n95VdGPRHyyFIcTvODYZZoiJUyibck?=
 =?us-ascii?Q?X/uEYx+yNTB6VgJDVCs3ThhfoTpBDDaQ3kLSRTUIkr3csgrkwDhYy6i3a3XI?=
 =?us-ascii?Q?auRX0c3huB6vnVy0r3qgvL/cKCbJ9x1vzYzFTtYX/k0n04U9WFkoZgjoJnwz?=
 =?us-ascii?Q?OvsNwPtutU4ZhchxV02QbXhxdg/6fUVl4wTemU/dbeYiWTUwOus5Etz/oOsW?=
 =?us-ascii?Q?yvyOW+43ZdCMigVDN8nksarELFPDrf0hCYkbsyO1Xer+I4GJfYbPCP9VgqJ/?=
 =?us-ascii?Q?jKBw3Y4ekmA4+yuLBDuBfy8RP7YCUE7f+Q5trfClLj+TjT3LeQCfzVjYg+dk?=
 =?us-ascii?Q?kQCmfbl3z6Hqvz/NtkUTsfn4HjsEFkPXZ8CdQp8TJ0tERinrHDB5ADKc9dLF?=
 =?us-ascii?Q?eXA/+ycNU4lDfXycOWOYZNF6ESGnYE/kmBqewxsUgy/2MGGfI0casYjB4FkO?=
 =?us-ascii?Q?GIzXUv8e94KBJ97zyPLt+obyh36AwTb3gzyKTMG+XzvLxbuPsPbybof2CaE8?=
 =?us-ascii?Q?i+YoglQgg8+8LXrCPuM7KueBJI+XdYmAjPOnCfCd8p8yPTVvbFAdeHMmM6mJ?=
 =?us-ascii?Q?QHSOQXyfoUQINk5sZPzFMVEbt0aTLbaJOHPn/HhJjp2/lLKzrrOFB6V0Jsqp?=
 =?us-ascii?Q?UsxrI4u+FhJ6pIrUMow3cCX9/y2LljCZHf7UeUVJv42/EMZXU0RmTVcqnNae?=
 =?us-ascii?Q?QO+Y1ECHbBWFPvORymgqbHWbOHmusCWjOlyCZv5uZ6v7jZ2F68yUfxa6tH9+?=
 =?us-ascii?Q?nC7NJwJx52H/S8aaAQ87yPtojwJ9vOuu470Yi4VgGMwKFlbSFsqcp0IqijhN?=
 =?us-ascii?Q?9yXN/mFxNzPQYGMfjM9LjSy7zMZ9z+z8ifX2Su15j7RXow2DebM0QCtUTbf/?=
 =?us-ascii?Q?PB75z8PRiInSytVbMxzPsQY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a26c79-2848-4a21-e639-08d9a5a69118
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 06:35:06.8770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwjn02ppzdaZLPh94p2jmr3waoFqP/sbhIhPmrxP1JB0NtJX9S0kyMCkZm1QqFB4HbwC7YPJGkGJSdfhKc2VbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8886
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

When loading elf and kicking M core from Linux, previously we directly
use the address of the resource table in elf file. After i.MX8MN/P
RDC enabled to proect TCM, linux not able to access the TCM space
when updating resource table status and cause kernel dump.

So let's check whether rsc_table is available, if available, we use this
address.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index ff8170dbbc3c..96a56ab39ccb 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -497,6 +497,17 @@ static struct resource_table *imx_rproc_get_loaded_rsc_table(struct rproc *rproc
 	return (struct resource_table *)priv->rsc_table;
 }
 
+static struct resource_table *
+imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *fw)
+{
+	struct imx_rproc *priv = rproc->priv;
+
+	if (priv->rsc_table)
+		return (struct resource_table *)priv->rsc_table;
+
+	return rproc_elf_find_loaded_rsc_table(rproc, fw);
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.prepare	= imx_rproc_prepare,
 	.attach		= imx_rproc_attach,
@@ -506,7 +517,7 @@ static const struct rproc_ops imx_rproc_ops = {
 	.da_to_va       = imx_rproc_da_to_va,
 	.load		= rproc_elf_load_segments,
 	.parse_fw	= imx_rproc_parse_fw,
-	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
+	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
 	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
-- 
2.25.1

