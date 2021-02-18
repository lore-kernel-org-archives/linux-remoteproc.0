Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A335C43381
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:39:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFB8B64E42
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:39:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhBRBjc (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 20:39:32 -0500
Received: from mail-eopbgr80057.outbound.protection.outlook.com ([40.107.8.57]:29216
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230241AbhBRBjQ (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 20:39:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQEotOXMrUKibs6kRoleXteYhnU7sT/APaFS/KirzgTAjEaBknEqqHgrcmspB+LsdUg5JeXWw9Mgk14uGWlBWrnmReZQEoYcqPv1mUbL2mKfHPQwsL1BUWBFuIxHbOqxC2+fPX2zkyCxKRu9l5MUNK8AotIQoq10u5rUZBtSvWQ4E7qIcN1rOqMQnScUr2LVUx+dLSH2oQi1hXPOd+xaxyAHGSFFgGS1ZA5Ew3a6Zi5QESVb6jPP8etv0caXvXciG8RbAhkO8OApWGWBGtfYiRJeWEdDRdVN8i1mpjHF6tSS/T/gIMSa0QZHUmnKVHzGa6iUJ/HvucGhpyPDVHNw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJE0Ov249gPUdtT6ZeB+lf9+Z+9T/yJFkeTd4I25VJs=;
 b=ClUi9OuDwq8GWGTYYF3uc1wmMvZKxtmduZaP1MzzmvmYLS/fMpEvlh6Gru1lip04qGJV6QNzmjuTAvMjbgo/PrGWy12nX4XE5B0vP7G97MU8jtfd8J+ViY6guT1JvwabNCkgy1TUTU8Naqci/ZsQs8YOJ8anE67P+ZhtFMqYBcVndoi5LH5simYiGi0oufFLW8TW3oOwJhG+Qkn5HaxVQebAvnSqFcLwv6Ylc3XD2GMN8Eza6d5QNcHJr82I9Hwi2alczm0sjPohXFj/lHgdGwZ+R1NfpH6fhFdwJjX7i3g+QxjIGqIwd/SKG1TTrPTsOrCAUwTZ500DrC9xELG58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJE0Ov249gPUdtT6ZeB+lf9+Z+9T/yJFkeTd4I25VJs=;
 b=i7dwSeJI6Qzs6CjSOe3pVqyfp+RfgU5uoo9eGHL1CAVv3cBWHJZ0mmdG10vYYsxEA0AW/75YUrV5ChjNpX8AK+OPo/DDnxiR6B0LNim/ODaPaiMPuO9WmHdFgX9nuzI0fjex4mN5di03Ofu+V9QkKj5XZ2TqKjeJPAU8e1CUv7U=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7285.eurprd04.prod.outlook.com (2603:10a6:10:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Thu, 18 Feb
 2021 01:37:28 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.043; Thu, 18 Feb 2021
 01:37:28 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V12 06/10] remoteproc: imx_rproc: use devm_ioremap
Date:   Thu, 18 Feb 2021 09:24:56 +0800
Message-Id: <1613611500-12414-7-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:3:1::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:3:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 01:37:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 63b2a4ee-1f12-4057-186e-08d8d3adc049
X-MS-TrafficTypeDiagnostic: DBAPR04MB7285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB728559ECB1CCF72C81B57188C9859@DBAPR04MB7285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n4kSpHPKmYI4adj5fXzefG/q0LuCmTM7Aw0cA+cJWHTBh2lRcF4w0rdy89X8VAGVC7bVc+GlYqDIIBrSIxmEuSUXJxsvHV+BKTDVLQt7mpErz5Nve6gfGe6jKd1gLFITao0fBLjHScV6Zg++fKsZwgiFv+akOXIw+3SwlQPDWf++tVZK25Oho3zDQgqk54+ucZReuWTtGeE6K03lkenvO7efNoAsq7+27otsgCOrQHh9TqY5nGfYfKHy+hlW9ZmeQ/8VBSfHzqHaAPJNdyPsaK2tFjh0JZxlzzRchYTOZOwT4rAJ89GRxKFuBlBDvpDRLe9TySwmt8+7Q8ExcGSgx8XKVMALRJbgmhgqGycR6y+1orJMi7EROXPxF1kyfe/3Chl0BtaOyfB6bXMzwSiyzLlAGU7qoc4maPcJ2oImQonDMBUJdhGpYJOYml8qCJJDi757a33s0YK9aixwAOciABQQU9ZDGpb2MYmMtalzEBA+XqN+8ad0MeXpjZB/UHKh06v+0PpZ+JNsgB6Dh0zLVMNvJJ5+20aTpmpl3iuzCC5TblbUK8esIfHEmijMi2IlP8JF99C3EjVhI8x2Khum7g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(6512007)(9686003)(16526019)(186003)(26005)(5660300002)(83380400001)(6506007)(69590400012)(66946007)(66556008)(2906002)(52116002)(7416002)(316002)(66476007)(8676002)(2616005)(956004)(6486002)(6666004)(86362001)(478600001)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UVT/Mb7g6ZtKYMCpfXgfj9kICKHa/4w/RPbOP2p3zcKQhXMgvdOS1DzW6KAC?=
 =?us-ascii?Q?g+dQa9VQTuJUuNQuTBn/8DGyJEM/kmVg+WTyTcE5GimM3jMxvpsHtwT50El9?=
 =?us-ascii?Q?CukidozAtgsLKEjWBrs+D/aby6APYaHec7ZbX+aaxWweJLnEuVKvsGYtln1B?=
 =?us-ascii?Q?6wXrhHXR7Hu+48bOPqqyfcQLXsqGtr2veEeMPHTOIHVwberJvPtf26uT4dM2?=
 =?us-ascii?Q?CqoS+WaVKHk563VYhRwoCBlzLUzHO37s+Tb86TizFa2AWuHFYCxMoSR6F8M1?=
 =?us-ascii?Q?+/7xGFF5jzYJzyGHTJdpnlbAZ+sdoUOcmmN93b4b/fzxvxg39mqEu+eCvBQj?=
 =?us-ascii?Q?6fJCNzd6L/LjJjEjO2j+FaYtAuEO0LkLDGAZu9R2hMcvXhtiS9JGBN4LAKT8?=
 =?us-ascii?Q?5Ah0ZBXV6WcCIiTTpFlVJrp4DDI7BoPmjv+iv38veDWtCPYRU06qg0C2xWLq?=
 =?us-ascii?Q?9s2XDh09d93YMHwoRE7LIZvEFGUMWbP6li7Di1rf7+Sm644sl5ovMg2+w/fI?=
 =?us-ascii?Q?UKbs64Q6kvCQKrrafm3+ITylx/akORKzrMPHllEzcDYrrE9wSt1Vb0BLGWZ4?=
 =?us-ascii?Q?5+/XbTBkoH2lslbkoiKYv9zVLpRbX071AZHJ5eStADRdeddPlTHbqDYuwKnG?=
 =?us-ascii?Q?OIn78owuG5bEhXqkbg+LzUh2sfII/Qe/9Fj9pWfyPg9m1JPU4Wr2hMtoWmMc?=
 =?us-ascii?Q?hBMLwwoR0YT4EM4DLblIhr11xf5/sQAcxzK9UsvTIh2Vkhy/TZXfjFnsizPK?=
 =?us-ascii?Q?YV5U7/QipzqXhJ43azBMESE4U3Q+qK+W6lmHKzRP4LlMpevBs/E8FHzu7sw2?=
 =?us-ascii?Q?8k2CMvGW7DanThQHwPb0bbbHSsFmQ5R2iZZzayYZTDAA9AgJLtJ4B4Ki/RYK?=
 =?us-ascii?Q?MOEHN7vx9/Xsr/MNYpPg7F1k1ZbFmSNFGK2+Hs2aeJEupQSS+zaLiCu8Pr+P?=
 =?us-ascii?Q?L8bbqYKZUQ2WKY/ww8eJ3Up4UjvmN0OEk7oS3UL06hNfYzllQh83yFRrKwo2?=
 =?us-ascii?Q?hPlFR9kXfhqKqCp8EsECu+lhwM9aLZWkSqy3aCTIiIcx0EYfVc1sMMqwctXp?=
 =?us-ascii?Q?FF8d8YwxnEYPMkppVnfO+NYrs4PB03ooYFkluVYg0+n5A4sg4K2v2JuzHspt?=
 =?us-ascii?Q?FUt39679275CoShHfTIgpvfhdtbeweOP9WCI4xrVvbOsUejf+KKqzBhgTk91?=
 =?us-ascii?Q?E6X5sRFUd97SSzcrMGmyGfBSs/cMgZTtpz+UcKmjkrldJHFigBNQrQ/Jhaz+?=
 =?us-ascii?Q?8EVH86NRm65nvSK+11BdiIrhvF8QBJckOzE+tdQPz/z8FIApNvf1lPRUS1j1?=
 =?us-ascii?Q?k47yfrw830c/RkRwTw2/O6fm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b2a4ee-1f12-4057-186e-08d8d3adc049
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 01:37:28.5022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHke0r1XmQNEF6cHEQY2XaQ4sFA0raj8/8YVm1W40zUUDPggYngIPIiQzSSw3I9yjjXR1qppR9udg57IEQaFbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7285
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

We might need to map an region multiple times, becaue the region might
be shared between remote processors, such i.MX8QM with dual M4 cores.
So use devm_ioremap, not devm_ioremap_resource.

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 2a093cea4997..47fc1d06be6a 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -296,7 +296,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		if (b >= IMX7D_RPROC_MEM_MAX)
 			break;
 
-		priv->mem[b].cpu_addr = devm_ioremap_resource(&pdev->dev, &res);
+		/* Not use resource version, because we might share region */
+		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
 		if (IS_ERR(priv->mem[b].cpu_addr)) {
 			dev_err(dev, "failed to remap %pr\n", &res);
 			err = PTR_ERR(priv->mem[b].cpu_addr);
-- 
2.30.0

