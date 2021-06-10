Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A1AC48BCF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Jun 2021 02:42:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2FF861410
	for <linux-remoteproc@archiver.kernel.org>; Thu, 10 Jun 2021 02:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhFJCoZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 9 Jun 2021 22:44:25 -0400
Received: from mail-eopbgr60085.outbound.protection.outlook.com ([40.107.6.85]:39301
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229557AbhFJCoY (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 9 Jun 2021 22:44:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibTvb2ASoATym6Gz/6bAzx9QrGgEh+DfibMX5L7Rt/KKXSevhRc5JAowenMfHAzSYzOAt6wXfAoXNJSCKj7GF9IVlToCJaNAiGm6DEyofHYF3MvEXOQ4H4iLim4GkYTQM7r/QRwk4GXwFLRxS++QnSslzKdqyCjL4JQJsxozH3MuNmkxDSkMmLAxMyDGkRrXOlYTdK/ttKEjxz+rSjtSK7wiTUoCVVeHilyrU8EP6wQVeOyuHgBy+Y4EdM/1kZf44N/Yeg3r/LgRxZwftvULDD6yUQlHPWqbaMd//8kALJjRW5LLjWRvWbwgPdpDFxK7+w1VR/n5kdt2FSpSWhC4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DL0tERAttg9dtuwOPKZnQHIRcrA53BILFtFbyvLx2SY=;
 b=bLPaaUr4UHTvJ/6X2s2qDs3/lj87KBV0IWRk9yEGxqXqP7N2bdMGRRoFwu5gA94aNUu7YcBwfB7Jc8ZUkinrbv1iCVr75znBWbK1KWXS3RcAApvNaqZF4+kkTwA25IdiQ6a9jLzu+7RzP50HzX2YO7FfCndsT1LD58qEZCX9o7kyMw3NRoLy5EFkPYH2nOdxq/wo2sV45y8sU7R/TYjAJhKL3Rm9pOf8+M4PFkln4lU00JaSiqYo53N+VzCCQ+7wtfCfUsZquVPLW3PHD/JNZEbpOSluWLBCZx7zvtwLpqjimcSUePHhfddwmJ6dihSv8br/Jm9AInD7FBqdz5ChJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DL0tERAttg9dtuwOPKZnQHIRcrA53BILFtFbyvLx2SY=;
 b=OwLD8UVvFWKpaK5BpQz1pSuxiG8kaKpJgrHNA/mfBPtL4ZWJ+E1xjurHhvSxESOSIw6zaB7j1DghBnfLQalmU5hIyiLVsPk/0LB/dG4SJBR6YoMGRGIUmORIsj9QfFNbfGcGqCIcAkpScjE7edTEugOQnBRpVXl1W8Ynp2guOmo=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2757.eurprd04.prod.outlook.com (2603:10a6:4:94::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 02:42:26 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 02:42:25 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] remoteproc: imx-rproc: Fix IMX_REMOTEPROC configuration
Date:   Thu, 10 Jun 2021 11:15:30 +0800
Message-Id: <20210610031530.26326-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SGAP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::29)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SGAP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 02:42:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fc11761-5637-440b-713a-08d92bb96184
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2757:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB2757BC949F1E873AD7C51379C9359@DB6PR0402MB2757.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ebGayLD10QrLU+/dJwqPT4U+QOZHrli6ab8STxy8CbuG79IVvqQ7mtKl2z8ypovWaGqRHarSKAAs/4GxGEV3PgOtPWyrpdnMcana7bup3ydvc/VGl9e2rUSTiTx3Z5fmGJot4e5WBwuP6/aPTDayQU0BFQwp51ZOgpJgd8M6pyoipYdFPg5z7sq9GiNKwrIrmumV8XHNTfZbfPbVahC+8wli4eke6kwqxKXpcHsTJuFsG/2iZRTdcroG8laEfGYqimyCYNvmMZxvwlZIjHKD4hXmptT8GiIMfsxKbKBIFHdAef3WasOnv9yBu61X7xo0W4BDjJqv01cZsLpt4qta4SgjDh0od9oSgSQb0OjVEOwJnijlFxnkT5ALTgMMceBoAzQmdmulyhzNW7R74PuqMTF+nlUMJnL6tVjEjdxsxaUkc21dLuCjJcPlohTwWc3inLHPBAmRO3GvpTAqpM224cRzn1XAZkpUcIeNxKSTzH3RmJu5hVo0bOyWKK8VA7opq6Ce/BtTRP2TVa5xB33elnVdA80ynRHZcHEdBCvzm1rgocXORr5ZXc004eqS8Er6xZwjQrMFWkPP81PGBPbQxo8CDtDDhSbAWEBPzwHV3OnLXIiWinqH3d+PCjR4JiD9sUca6uteVFa1Io6doZ1/HC/QbS2pgUmCmEVJg8z9a1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(956004)(7416002)(1076003)(26005)(66556008)(2906002)(478600001)(66476007)(316002)(38100700002)(38350700002)(66946007)(6512007)(8676002)(6506007)(4326008)(83380400001)(6666004)(16526019)(186003)(6486002)(8936002)(5660300002)(54906003)(52116002)(2616005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GOKRlTposcAxpn4r+HOFoJ2KarHAkVRCOegQ50LpdxjKs/KOt2h1ilAzXOkA?=
 =?us-ascii?Q?Usl7qfR56H9ceNXLsJx7x4gosVVW8wiH8G0Pu+ETprqnxZ86JHkdGv10iXt+?=
 =?us-ascii?Q?37eHzocl5NXbR8cst1yCDFwU3XtDQlqk0UMBN+etzSJ6gHme/t5Z48FrAps2?=
 =?us-ascii?Q?e21Pj1Fpzk6blUlJe0NDANcnZOzYGH9sJg/FXfZzl4FNjpliYbmcgdTQkF/c?=
 =?us-ascii?Q?/z0wZpF0ZJNylNMlmCfBhd9qBytCfW2bIyHS68rarYEK55XL1OdMwcEcW8cr?=
 =?us-ascii?Q?jH5JnW3CgrhUg4JSSIEE5Zna3D5QWMHWosHnc+NC88IhUnjqlviiUKTzvKq8?=
 =?us-ascii?Q?qvGNemy+Q2v0SpVRGeTxXOpe8r5IyCIDjnckU+nSRhz1gYuEoMcWG0AYhEt6?=
 =?us-ascii?Q?Qy5jLdNPEB/FDy4qak9d/o+h9A8H+lwOwVxASrfvx2Ya/VAgJNl1b8hFpOLL?=
 =?us-ascii?Q?TVCb/V0mBVNIMtui1zGnx+Hd0hEil+DxGZqibgSBWuD51kjYIF5jlKhpg1XU?=
 =?us-ascii?Q?BvPTHaSAsiA9z8woEH/6+9+TqR/LH+N59d7QYOjb3L58qIpnckJNq9mByEzJ?=
 =?us-ascii?Q?RJHCBqwQ6R2+BN3s2Xvyl2TrsH7ESHNtxPgTuMibbH9OXI33MIpIFcJAJzHx?=
 =?us-ascii?Q?XIEGWIjb2aigcRoYNzeqPooalGOSKaVuzVAY4MlGJ3LBY7O/q579cUf2DrYx?=
 =?us-ascii?Q?BTfOW6KGQMnmqbTbih0r1jFjcuDkFbgSyMkHrWDLdZ+uPJINvNZnzAe91kUO?=
 =?us-ascii?Q?Zf+7fypWdw85VV8d0Srfd1RPSORLawCebHeh4WehgpBSHAdOzHlhOVxLktVp?=
 =?us-ascii?Q?1EXMDDsbs/D3qQx8cKedBtElNEOUHY//+/6pE24OSkwVhxWoLuDJz2VA4Eao?=
 =?us-ascii?Q?Sn8Q6ZKgrLl9HDwNFOEpwYNuwfq+nCuEHLREiRmeZLTEq77oGfldkCNCdter?=
 =?us-ascii?Q?7RZ10mDYfHw3I3rIpjh9V03jcKh58Kw8elK8uhS5EqIQrp7M98eMeJjHgmUE?=
 =?us-ascii?Q?i97DHFiIIbHOyz6YgJ71X7qHr6bLV9/ykp1lPbF+E0okOLtYoul+fhwLfbJP?=
 =?us-ascii?Q?Ed4mbBjh4/Qvg+7hXSKk3AXJIzXHjjygPIpBZ7Rwh0KB91S02mraw1U4NuS5?=
 =?us-ascii?Q?fdRM7d3eo4Tk0j1srFPO03DXV26/v1y9iEO2nlE6XqrrVPo655iMm9VvRG0W?=
 =?us-ascii?Q?AmrKCKKK2XdAoOPiTGJrxyI7RE7HlISGhc5YPoCjYj0B1eVcWu/9R3lGpqWt?=
 =?us-ascii?Q?qiKiWZbuHGPwaDb7fwzqJch5Td344XRl+W+7SExgOJFyR+JyUl1tNwhuu7Di?=
 =?us-ascii?Q?4obC9Y5/Vy+2FP5UccZue6jqUOb4QMlAo6hTtkXf+8J6+g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc11761-5637-440b-713a-08d92bb96184
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 02:42:25.8497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zVl0WbiVz6aH0LC1g0WfbCMgW1OKYSnol/fU8dol4eslPk6yi+0V2Mb4qUs7PI6xMfbi132rvHnXIe0bT6IcXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2757
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

When CONFIG_IMX_REMOTEPROC is y and CONFIG_HAVE_ARM_SMCCC
is not set, compiling errors are encountered as follows:

drivers/remoteproc/imx_rproc.o: in function `imx_rproc_stop':
imx_rproc.c:(.text+0x140): undefined reference to `__arm_smccc_smc'
drivers/remoteproc/imx_rproc.o: in function `imx_rproc_detect_mode':
imx_rproc.c:(.text+0x272): undefined reference to `__arm_smccc_smc'
drivers/remoteproc/imx_rproc.o: in function `imx_rproc_start':
imx_rproc.c:(.text+0x5e0): undefined reference to `__arm_smccc_smc'

__arm_smccc_smc is defined when HAVE_ARM_SMCCC is y, so
add dependency on HAVE_ARM_SMCCC in IMX_REMOTEPROC configuration.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index e68fcedc999c..9a6eedc3994a 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -26,6 +26,7 @@ config REMOTEPROC_CDEV
 config IMX_REMOTEPROC
 	tristate "i.MX remoteproc support"
 	depends on ARCH_MXC
+	depends on HAVE_ARM_SMCCC
 	select MAILBOX
 	help
 	  Say y here to support iMX's remote processors via the remote
-- 
2.30.0

