Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AB6C43381
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:03:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1E65206F9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:03:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgL2DDI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Dec 2020 22:03:08 -0500
Received: from mail-eopbgr50047.outbound.protection.outlook.com ([40.107.5.47]:26094
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726855AbgL2DDH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Dec 2020 22:03:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9gqtPHC++R7rbsxnRab19r7V1qAN/VfMsJ1Rgegd/e2pg2oQJxFXBKFq0aSiND1+hoBNu/mh7TnfzFR8H6thGRO+DLcFGw2ThM2cGIj+mrsj/PHDFWdgFxsWhrrDftrTiVMWkAU45JlvLYOd54dOGtpw/V0mZXjFmxO3PFoMGAU2WNe17BjPFvHwSwzISzrb+BqJ76fIqheXfPHTGVziNWr5AYZehuaYvR0O4GVw5gwFin7rWE0rlQjWJKhle5g9HSEn4VZ18t9gN6tUT2Xpazxr9q78QCTqXSUjkcgSCmbKlnCDRVGnSiQw72f7LxPIOXoJKN0+1w3UYJPGctrwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/s2puioSKo6Stie4/46zpWJ12TL9WHRa/U2UKWS059k=;
 b=gt5mLx/Gj2qIB9xyFzVnKwLn+v9UH1vOgV0fUDiMQC9eeeYR5KejHi9jfIjaP4w14eDo4nq7+wuNaAXy+srkXR52Me7I3Z3qyH5rHzveEdCcjRPdwTc8I1M+EDM05hUuv7/YU/wvXdCUiFCuR/msVg59K8fRVkvPwnNMtMddHUu5yygBxiMZSm4q+mzBdUQiZ1KWuq0Qx0TcSk3fi26QUxCw7RaY+3zN3YnfSilFA4w08exwvkFg0DURUYjOsl0+06CGsBUTWLxnevHc15+sL5n3v9t7QBYb2w6RQMLmoIv4zeJwT/eRAhUx8EQJdE+gM2E30fjH1rr8NrYyFZsj1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/s2puioSKo6Stie4/46zpWJ12TL9WHRa/U2UKWS059k=;
 b=XmZnImHPVGBCJtrz4VuquLaPrlu7S/9lqEm5r0Gl62AQ6SsnJw9aIihgvJbbio5YqlX4inZPlgqHtAOGq4Hcw6czB2dOsHgoI6OkADxZymdz9IcAEsw/wY6A6lrZs/FqI09Y2TGiKHIxpMcXgTv5LslgTRBnh8iTJPA+OBFKlXs=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7178.eurprd04.prod.outlook.com (2603:10a6:10:12e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 03:01:51 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 03:01:51 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V5 1/8] remoteproc: introduce is_iomem to rproc_mem_entry
Date:   Tue, 29 Dec 2020 11:30:12 +0800
Message-Id: <20201229033019.25899-2-peng.fan@nxp.com>
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
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR06CA0178.apcprd06.prod.outlook.com (2603:1096:1:1e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 03:01:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a4ef68a4-7c15-4fcd-32e7-08d8aba6172d
X-MS-TrafficTypeDiagnostic: DB8PR04MB7178:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB71789018F33E688ACE53AF4588D80@DB8PR04MB7178.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zjS//PqIXi/7IegItX0NEMRWjao2CKycSzzWSM5XAvg22ntA+t1zhdEcfW3Un9Idi9ADwPbZ2G55X4u6yzVAbkm+F2e33PyJpHvtSmEYnpmcPlav5r1Vu2PgVBbx/BpjQGHz0q2H4DX5/Pm/zWavViHkmeCemXQALXftB64jlPq8BtSbZteHSeu830c7UciSN69yV+Oo0iVNSU4LeiI4fHEP2oTXM+2IVa69zibeYjNVCG/POdxwlsnUkYP6fFWnLibbnYDTmrMYHP7xnCCqkF4epqDv7EONk5dRvQdY2Gf28VEH9Jf+dOXaHwSpkkQoayLaz8VghmLrjqn7Fqvr9EIKZ586Xd9wghn5k8uae9dDVaoZoyAdWMHa0DQvbaED2LiLdFM1Hxcx9yglb03iJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(36756003)(66946007)(4744005)(16526019)(9686003)(2906002)(7416002)(2616005)(86362001)(956004)(478600001)(8936002)(6666004)(52116002)(66476007)(5660300002)(66556008)(316002)(26005)(6486002)(1076003)(8676002)(186003)(4326008)(6512007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cE3ATSVD63yKVoIEibHV2KaFxAxDlpuBXIWH4IskiLSVbxcMBvYaz0iwjewf?=
 =?us-ascii?Q?EW3tKiJQcF5pMoL7V2DyrRm/elIU800yiwnPXrLtPfTDAg9szwDXQuPG3DwJ?=
 =?us-ascii?Q?KNk23o1e/dMS1D1RXeeBSiwJdvC7pcUTWmGGXY5rGNJDoklHdK1yTIj7K7Qq?=
 =?us-ascii?Q?7VWoRZlBTldb14ybOsK58oAd6sVGQ8MdQK668TgqjHeuE1z3IS5UnJYIMi7b?=
 =?us-ascii?Q?IXD2ai+254vcgPNYRMbH7AMQjsi5JLiZwf9dOKN19Q/laZu9tc3NyppqtyBD?=
 =?us-ascii?Q?EMVJpwmSBHNSPyDE0rIo/YmfmGnBLj46M//Sc+8eB9xDbGLOQWP5Q54QBbkp?=
 =?us-ascii?Q?KU8kTXl6xYKJ6Dsc9xefC6DHPVzp6wtYdWxy2ma70GHgktJJ7QVDNNBzd6KV?=
 =?us-ascii?Q?H6iZqJy5K2fMVSsbV0+F6JEwvkquinKQFzMeqeK9ylePh4/BrtFoI3iwCfCP?=
 =?us-ascii?Q?04Hyj4t6KFOY7EhGWwPGDIcHsZ9NwvRBTbc/8itVfWTKsV6VObvlqvBctolb?=
 =?us-ascii?Q?+N5mqL+ujeDaSsALp9T5nXFBbxrJOLmcRKX726G2wVCPAtUXELSHwMrUxgoY?=
 =?us-ascii?Q?LwX2GfG7EH4/NIFhzNK8veZ2JeZZz+jTyKnyTqNLOOT06+VSIxESAe6Sj2Lr?=
 =?us-ascii?Q?aTFIjUX51vX9RCVVWWGywIv6QnJKF3EZIXLkfMSw0Q+KahkCBTJqAs0wH5lT?=
 =?us-ascii?Q?VjKyBDzbEgOInYCsEss/774j2017Y3y1T1WAMugHhjVhXOVzvda9ocjF+zwt?=
 =?us-ascii?Q?SesiKcAXl2Jb+o6yzpwLSqMq/FihJQMRZ/vomD6GN23t5xl8Zjp23tYe1acB?=
 =?us-ascii?Q?MhXV+/3ySi2cMIVi9VvscUfh4EcAY99+ZJX71b7t5+bfe9so5iRzMC6qb4d6?=
 =?us-ascii?Q?8V6eqQoGjzjWoC1XbKGE2RMdqoJpwYv+4vpWdE8ljGdKjl3nAvJaenqKZRsi?=
 =?us-ascii?Q?Ht0dtDTFiHfGFrLc0b7bCJTO8dSbxqaBCMBIyGO4rqYX5qwFTX8F0sonZK6z?=
 =?us-ascii?Q?/EUh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 03:01:51.3904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ef68a4-7c15-4fcd-32e7-08d8aba6172d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RpUiYr7FkHHuTCOfVuuQ5loXXhAqB+DR7rI2juWYeESrp1g5UCxwNKmYgK420gj/2mhYoMHPY3XPRMpqoViuIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7178
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Introduce is_iomem to indicate this piece memory is iomem or not.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/linux/remoteproc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index f28ee75d1005..a5f6d2d9cde2 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -315,6 +315,7 @@ struct rproc;
 /**
  * struct rproc_mem_entry - memory entry descriptor
  * @va:	virtual address
+ * @is_iomem: io memory
  * @dma: dma address
  * @len: length, in bytes
  * @da: device address
@@ -329,6 +330,7 @@ struct rproc;
  */
 struct rproc_mem_entry {
 	void *va;
+	bool is_iomem;
 	dma_addr_t dma;
 	size_t len;
 	u32 da;
-- 
2.28.0

