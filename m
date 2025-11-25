Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6833031C56A;
	Tue, 25 Nov 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764074975; cv=fail; b=ICCXx88kRTN6+se85vELc4eQT/K8+kK5pacc9/kZTTM+GujO4H18XXUEbcUR3wCrsyNL1ArhCDbto1Tk6q9o5sbk1e7p2PqaocqmH1KqcD5sYz7SzEeioWWu8cCWvBYJblj6bJKmTyOUMDY6UPWxMaELFYwJeJHetOa7nsDaOvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764074975; c=relaxed/simple;
	bh=n6IhHUVdTNu+IJ87QWicJ++zIbYz8zw0XU3U0e1wPNM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=hR7m3PHDQQNZdwlwnif4UrrzlCZ8ZTcNll7B+swgEfcmLCyso1SNR2n10KM2f4ybPpMEOoF57tUJyb7WG0IUBWL/U1ZleSBSkcyQhZie9IwG2Lh0+ztbiE0CcEaztT/Yev90kY6/EwJaci0xBLotktlAftGfHl/3G7paBnoSJeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wZxQxvNW; arc=fail smtp.client-ip=40.107.130.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wZxQxvNW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPhaVJPSEhv+K37GdtOz3+Z/XmDvH3mxk5Rq/9ds+/qOp3yop6Hf5d1xRuuCDxo0xmEFBkMkTBX5CmMGg8IZw4RZwJV2vwcbEAKrI3sTsVJNCGFJ67OE3KDQtFIQgu18g3uIk66IcB2eoAHvsNvsCTL0DmbB209V/4zaX84AYW972fgetuTD4ni1t/iZt+HWqXrtSbZetmCohO4iVUf3wLkj/W+dErSbO5eKL79IuD27x0zXlC+3bc6Ibd/mjoNwH2ny8Zo3TDqP4LnBzG69PDjgThVOl01e5L1DWedFeJr2Ttq5/HiqurZBNt4Obe6f+Wcl7XXuNFJWWc3IIbOrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHEkRJI0vpjbpSAaSTJvrWDWBb7hBKrywuwa2bGevTs=;
 b=h1pYIfdwZm1Rp5UEuMcWDA79KsLxyUHlav2ACWbFqCnZhdK5igYUG0fzY+66zjGRc3cTjx50aePyv16PSDA/tJ1fp69qUQlRKdY2pNmMz12Om0XJoaTGppWNqZ3Js7wCSlkHTBLs2Stsru18wswTaZM7kE+ff1XOO44ZfQGJrhtYOfkO88FhRmGRJ2Y3SzjFQlMQWTIlvyvS6+ZlWdGg7Od6LnmnAvCtSDeyEZoa9s5Y5ZuezE9VjcTyx7lKWdfQt4by6CpQjuSpG4/jktG3cqujWTUK4znmIJgWsavpMoRC1iKQwj5+ZNTl4AI1D1IiSi4gs9bW+SJoHLDWCXz/Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHEkRJI0vpjbpSAaSTJvrWDWBb7hBKrywuwa2bGevTs=;
 b=wZxQxvNWjIMqVBJ9frkjVXsUy0bbWjXPwiPLjXQk7aFj97JIa8ypDeULQvBzQ03sgcaQkBINNBhF8ka36gDpQ/tF+TD8Mc3pCexUv/S0Rh49/82LyFPM1jLDm+CqAo08mJ2g4MTWLPqYZ02I72l3RVXg8np4/8812whE25zwwhBqT5+MFn4GCZ2bXe+MCa5WtUXJg5iW4/7wqjrohn/mY6vRqFO8DBi8QaP6/2FjU6UMhkPhHfjnpooO61c4KH1z6xIQXIdwV7c9WCmJg/LthhDlK9sT85udgssGPQhjBst0aZC1rXp0H8tUn4lIWfc7i3Ng0gQhf2DGdvrJyHiVsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by DUZPR04MB9872.eurprd04.prod.outlook.com (2603:10a6:10:4dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 12:49:29 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 12:49:28 +0000
From: "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"S.J. Wang" <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: imx@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 1/2] remoteproc: imx_dsp_rproc: Skip RP_MBOX_SUSPEND_SYSTEM when mailbox TX channel is uninitialized
Date: Tue, 25 Nov 2025 14:49:02 +0200
Message-Id: <20251125124903.962295-1-iuliana.prodan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0026.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::11) To AM9PR04MB8907.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8907:EE_|DUZPR04MB9872:EE_
X-MS-Office365-Filtering-Correlation-Id: c21d89b5-d323-4b17-c310-08de2c211251
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0sUYo9X5DIoffhHSuPPer+8L12h+XNwmnJR8cTb8gVarH1oh7EtHSC5tzHKA?=
 =?us-ascii?Q?PFb23fQpo/7uVr5g/RJjTfzOmNvr3gHra8sSSF2D/JJLdRQlY6JrzjWtULtG?=
 =?us-ascii?Q?+bPLEIK212slw3xHAp0/pObSsyhKWZ5V6fu9FDpNm6BOsJFSv3yW1QKPkAwA?=
 =?us-ascii?Q?QfkCX4wupeyvu4C6+Ev9PMwQxSwL3WvKfInN56SnrNqnxwsNjMN6RtARta12?=
 =?us-ascii?Q?mwZJnkwl/GIORS8wRV7dFWQM1xqqQffo82TRuFtGia0jf4tAra+jxoGeS3zv?=
 =?us-ascii?Q?5nmveWx2NJC5SnKumzIvJ+ULR/uqOO0oNewlaBzXa+D/RSGcAqhUZptRMaE9?=
 =?us-ascii?Q?0BHNdDT0YJQAEKhAMwSrZGglY9TIi1pEmoKmsu02pQ0sRkRel608VgblWLvk?=
 =?us-ascii?Q?kVYmkZSRyVCuNUDI7uAmGglNW8AyE6D2Muh3sWpA14RP7W1mkk7XXVdmKskn?=
 =?us-ascii?Q?k7uzJuQ1Tda8RdQ8Xpr1Gyo4okPd8HXpsDBLiwuRxUiqJk7f1SUrSryKWvD7?=
 =?us-ascii?Q?zu+gIhhxnzrWy/YJrssNp1bulDfi5Q0ySkH/TCzRy0dsOIlhvpAA2kBHwzEi?=
 =?us-ascii?Q?KxJWCXFv6w+CNgKKwqz0xuthW8I+UoNc9caf2YIcLy1r0LbTrq+op3/Bxp3p?=
 =?us-ascii?Q?B9d0OVinrhz/jeuF3jLCSvhgXLMDeiieqfW4GGlZAJ7rg0N/4QjBmI3EOJFO?=
 =?us-ascii?Q?edFhTHkUuQRk5uIIqzn2ZwrJYi3Q4O+Su9cFvVuf9VffPzCBZb1ssWq0WSjo?=
 =?us-ascii?Q?y6S2pxPda7pOoW0zA292zzl6nav3jnDHKAFBaEtdaqqzRdtVQwH3ViyXiWZZ?=
 =?us-ascii?Q?1v4EDpB+eqbEnkvn1RJkiMWJLq/b7S41W2QiuWsDNyUapjZRdfMuWrbpCjtU?=
 =?us-ascii?Q?VXaA3sY+imyho06K01fa2yxGx47g0ZUjsk5kCGmKiIEZlQFDJn0LndAMpilH?=
 =?us-ascii?Q?m0pMdS08UYa5B0vLBRrMV81S8Xc4cA9a3q4XV6QFZ00i8BqQt/Gd//XE1Y6P?=
 =?us-ascii?Q?8JjN5e7O6C/01hC1GZ6gx0BoxVBDv37AggMZJL4iZlFBdCmETAo49JRyRCJn?=
 =?us-ascii?Q?zFYj/R7d+XHq66M+mmMmaaQ4k58hyqYmqq7B0Sop4iNRkwQg7RXm+/40MUQs?=
 =?us-ascii?Q?iy5MKBb48z3QWR/j1FHRrikltEeKjsAiJ2Dsb3BE+RI6c1hRC8n4lgFYym/8?=
 =?us-ascii?Q?gdZCv33Z4MQKNd/OFqoLkwcasStubqK2KQGPX6Nd/pMTl033ZzZn7qHr9fyL?=
 =?us-ascii?Q?zmFECFySC0sjyeW4davUSU1hctlb3owYiROaLnprqx1N+fWPSw+6LH6OqBtu?=
 =?us-ascii?Q?F9fwtv+QRdnfbPs6ulucpBUVdUdiBZ7pvqBRoOxdBPzEBGYTdwsSPFMLYb6c?=
 =?us-ascii?Q?DBNx7YnpUbfZyd0XZfPnbdh0MsMVQ6qEZPctr/N6kow4T+VHzabC8X3F8uF1?=
 =?us-ascii?Q?GdaRWWfK2V1Y7SOUwzjyXieFiJpgKBuMmUx204qx+IjsN1oChjYXIrGEObcW?=
 =?us-ascii?Q?80JdU17mMtkwDOALcVxJWDlZhDq5Z7w6N4oq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?faewMgZS19kG2DdhEdxVw2YSVaBiqs0r+Ej4Ggddbfk8RG9Py5z1NnAu6gM5?=
 =?us-ascii?Q?oLGUJTbqYJsDt4Qw7fPQP810kwNscbbI3Isaasg/qv+PN/9Nrafph0FRJ12K?=
 =?us-ascii?Q?EqJDzRR0Aksz0v5w54B9Iy5iFYYpaXaT8J1HJ0fr3Q4ky52NNACdSiofwpy8?=
 =?us-ascii?Q?HP5NWKGc1nw8cyCnQfOHAPFtXtKoQmCbk95n0YJmAWP6fQt9bCBWKSDl2IEO?=
 =?us-ascii?Q?m+IP8/Y+dCpgqNbkxFYqqxbWsppgKhHkoXYtO10jY+sEWQ5IFTi1N9k1JH7u?=
 =?us-ascii?Q?YooYrdZDXNRpa41ZfrQoRSHmpg+/ZrVLRXlK5kxilUZtxF13yl8zAxa2pXhD?=
 =?us-ascii?Q?0+XO/rjW/LoNj64ggSxKQtrhWokcK0GrvIyd4ecD7TeRlxLHgtm7fN/+eAFd?=
 =?us-ascii?Q?Z72YadCidM9Uc8xQ9cG4kp1n7cczfQvyreCStMIoT+ZJ+I4NETmOtGlE+DLG?=
 =?us-ascii?Q?B2+btD2z3ZsNVQO4yLiXXEgA2VY/28CeDNC5/RhxpO0by8gBUcaISoeYbC+E?=
 =?us-ascii?Q?leyyam9GPL92fBLU72IXRW0WFqSTmtJA+Vztt3jvbNu/PJy5fnANclo72zBB?=
 =?us-ascii?Q?TMYE6NcW3YU3cSa/BaECnDWD/9hw8PTsaL6QIXKsbu6JzV/+pnh3rKzSNtnu?=
 =?us-ascii?Q?aIao7AZ/UVT9rfyxAdDsGH7tRt+IJ2u1S4SELSs3RW1mTUVa5k6Nr9GuIboR?=
 =?us-ascii?Q?Dx2GKJ/UFrZ5SyCUt9NzihbNpqjDjhObSK54LorEhyb+ICT8SFWrxSk4OMNF?=
 =?us-ascii?Q?NFNS1z87D4E+PRXrYmD23dp2RY+Xw6W1QXYplTzOpAreeHhCdR/ItBkiv/ZD?=
 =?us-ascii?Q?NmZGzjNq2cmNJ74G79Bc1p/+rowLUuaBE3lA3pzCXq1tGulyMBOHN9tIC1oS?=
 =?us-ascii?Q?DvFTeB0tdYqexyculRiFIylgoJT/Reryg7U/b2yGgDh20oPdBykpf8DOXvrf?=
 =?us-ascii?Q?kjHPBJO35M0rBjng17p7NDdAvTvpClSATWceOXWpjgHORsHMXqcA0yYd5QsP?=
 =?us-ascii?Q?+NUoBRd7X2Y0iSAgq3gjNsLn7qp7Ej0j2dgmXqcKD8ZXulG/Rx3riOpR9pPe?=
 =?us-ascii?Q?6UUl0MUOcqHNrouZoPHoH3zP7a3bRq73JW9kL6u8VB8plbCpsa4FQSJ2xVoW?=
 =?us-ascii?Q?HyEk880IT8ZMJA0CObanGLq6Nsv149yrV/K8RTWgJwxgDxhj4Q2/H29z6MSc?=
 =?us-ascii?Q?+7UQlffU7uw3Xl6SNnxxvqyA2L0bn0aunZnJa0gFICFUoN708o+y/8s8xsbH?=
 =?us-ascii?Q?mRcxSur9tlMdYSgSc6RND2EHUTyGnWPSOxBGRFv6uzpGk9LAZLjDPTIucSql?=
 =?us-ascii?Q?dY9jwhjyNxwTHlV21+EkNupB5i/khZL4GSChFMFk/mM9dn33Ig+xLMc2KYLD?=
 =?us-ascii?Q?FO9oCHU5j5yVDns/gjxCUCV1Up0Dsl4i9VIF5RaPlVeloUiv0NUDOsMB/MR1?=
 =?us-ascii?Q?weQPn1Hg5nzP2Jn9nWgkPJWGOo5P1vygNCqpN2prKaDu2SjAU4YxOpTBEhr9?=
 =?us-ascii?Q?DHb1/seVYR7BjUfAuLmLK1vG27qdwJJkRFeaRyXNbAMrJQTaeIwdLkOBNrjV?=
 =?us-ascii?Q?3kdrgbq0GDB/eDo/Da/Es1LidN3jrBxfRIgneMdU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c21d89b5-d323-4b17-c310-08de2c211251
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:49:28.8490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Hax6qMR0NbwEr9dn6vMxiof6Y/4TPY2BizVTFBvyVnRakqm3qN2KWLrxc1FT28sGIgtE9p3uYqFDW726Lk/Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9872

From: Iuliana Prodan <iuliana.prodan@nxp.com>

Firmwares that do not use mailbox communication
(e.g., the hello_world sample) leave priv->tx_ch
as NULL. The current suspend logic unconditionally
sends RP_MBOX_SUSPEND_SYSTEM, which is invalid without
an initialized TX channel.

Detect the no_mailboxes case early and skip sending
the suspend message. Instead, proceed directly to
the runtime PM suspend path, which is the correct
behavior for firmwares that cannot respond to mailbox
requests.

Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 drivers/remoteproc/imx_dsp_rproc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index f11662f9a12f..fc0470aa72c1 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -1308,6 +1308,15 @@ static int imx_dsp_suspend(struct device *dev)
 	if (rproc->state != RPROC_RUNNING)
 		goto out;
 
+	/*
+	 * No channel available for sending messages;
+	 * indicates no mailboxes present, so trigger PM runtime suspend
+	 */
+	if (!priv->tx_ch) {
+		dev_err(dev, "No initialized mbox tx channel\n");
+		goto out;
+	}
+
 	reinit_completion(&priv->pm_comp);
 
 	/* Tell DSP that suspend is happening */
-- 
2.34.1

