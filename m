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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE15C4332D
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C33BD230FD
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:50:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391254AbhALJue (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Jan 2021 04:50:34 -0500
Received: from mail-eopbgr130070.outbound.protection.outlook.com ([40.107.13.70]:50926
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2391167AbhALJuc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Jan 2021 04:50:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZfhzWc162V03nhVL7+6oe9oIDe/O4rI5g036IYT/80p7dnXQgenhHdD66KjiZBXoumcOOzhdQazOu5uLrijRZZdizpn9bavCFnNdxxgX0EuQYMPzjPMwDvtQfwxmpQVrBqyFRuEzhVvYh++9xNhRrushYgdH2aRQ8QOKGevjlSgvMwS/ehtk46IOzuCUJdQ0eyfWlv/NlAI7b0VWbcsu8zw0mXlnuQXtMXkJSSVzfHGyfys722ior7uXFh2ho/f0ZHe/wtS6/rT805TxZRTp0UCMKmbG/hf0PdUM3IEqEMmDRdcUiEatQ2DLyk8P1Zf8dIeWx25GhdAK6FE9N7zqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOyXY+Wu7yjAZykW6d3WzVozTOhNuNfY+00aYS59St4=;
 b=Y7GGeIK5puRPKAYhID9GKfBBI7P12AX+bNdAmj/KbpUYM2LGtiXNm9awZm1JtDr59ycqtva7QBm6SiTs0nE1qwEFQV1eeuxzLoXpK96geWSoqnKM804wGuwc408gpZgZX2Ev/qzqrX+0D962LmBhbeQDMjjuqnpbLA9KRgMIeGXSF/oJ5Rm1wXWV5IvR7jshENoUuxiFZI8r1tE2Tzr+NrB8fmEk4lVhGMa5RHqkobN9/STTa5itE+zo4HpWbCIXxkPSh/u9yY8B5H+Bd8HnI81vQxuFQH6Nwgw974mBjBBM/RQOsgO80YBysus8NGpduKDteenzuTbvO1bvU4zrIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOyXY+Wu7yjAZykW6d3WzVozTOhNuNfY+00aYS59St4=;
 b=iXMvTJKaSErsCQUkEZXKw702rffh4ba537pIx1EG9tvs7UILwPq8zyTFluZ+XMSzlg72fxJODWBCwDS+E1I0HMrRzxcAgAubLOZwlaT8Iplvzft2ATuTHhObbeh/UAIYU66tsND+HtQqAcRvMMntYLVy4Ns18Mpk4udW81aXQAg=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4089.eurprd04.prod.outlook.com (2603:10a6:5:1b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 09:49:35 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:49:35 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 03/10] remoteproc: introduce is_iomem to rproc_mem_entry
Date:   Tue, 12 Jan 2021 17:39:12 +0800
Message-Id: <1610444359-1857-4-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
References: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0212.apcprd06.prod.outlook.com
 (2603:1096:4:68::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0212.apcprd06.prod.outlook.com (2603:1096:4:68::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 09:49:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 92bbdb52-a622-414a-bf6d-08d8b6df5eb9
X-MS-TrafficTypeDiagnostic: DB7PR04MB4089:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4089F869AD3F326EC2EAA9AF88AA0@DB7PR04MB4089.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iaca5x/E4vcahzqWx5LlAgOe1uE2yOLmfSPWfDMbGyRtc9PdNWbTA4G2dcTFzf4R8g4LPIGqjsDF+57PnWwWUtPX5fJ+QfeXAa3m9hwrIp+orSXXXbMqt10UPfkCDyM4vtCXhBiawQay0ZnRRJusKaNDpgC6EnlkSaeszA2cQCWOMhKh8ZctqQGHZrl1N1eeFdYhlp1d9s7ik6zpACmGPgSrI89DPF+G8oUD36kGqxYEaaXShmtP37g3OBnntE10dIp/Sf52osL7WkvvkCiL4+5stPjoEQ9w1+iZBhrRXnVLgDDlHGRMIuNfHYXDo6KPcnTuZrZMUV04M/aPZ0LPqPlfAVySJSIeTNXKkNMDKGT/yKbVlTSzWOdUne1Ji5zA4P+W6E3jnVntytLx75/YkVc3Vfu9KquMuZg6blIeOYG09J9bmUooddAt+tnnBo/vulAUnTOL0dZpxHTZSYri8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(36756003)(8936002)(186003)(66946007)(66476007)(9686003)(26005)(6512007)(16526019)(5660300002)(4744005)(4326008)(2616005)(69590400011)(52116002)(7416002)(8676002)(6506007)(2906002)(956004)(6486002)(6666004)(66556008)(498600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aDQo88/j+PvT4KQT6MeJI7EeBGQzIvOx1E2Rz6BO3WpGb/sPBqNG5BveKQfU?=
 =?us-ascii?Q?bthHduWO5VCtiUfH9lgXFetJrzjMMUYMTQoc+IW8wewC9oVSI5nzY3vLHGNl?=
 =?us-ascii?Q?UplaW3JgzAG+/jK12cZtm1xChrmczS+Sr8+gOF8J9UhCztETEPxoiMzEnT6J?=
 =?us-ascii?Q?eBRZM0h3huXibb5CdN5hZtvX8X9qVDbY3zwjrt/Y349N73eZsK69TnB0uyyH?=
 =?us-ascii?Q?kGUcMet23w3xDWtRbDO27ZeJxizJxOi8ceAlKVaeOYXWll52etzps3ObCgtT?=
 =?us-ascii?Q?D3p82DDjFJtbc/b+nFUgxbsAIXU9sldEMzvNrFpjLtCrLdriecoq5nKzIs4/?=
 =?us-ascii?Q?VZBENZO00+ZhktLxmbd0P6YuGLgVic/JF+N6uqhlwzCsypsi3peEoJU91mW+?=
 =?us-ascii?Q?TQuXbH2v+P4e/FzUpR7676WrYCVvy4z5NXPhWG79H9QN+DKN4Awj6NigLsoF?=
 =?us-ascii?Q?TpUAYqKj8QnodvVsbFpSZCCfAJq8xk5gh11VZkR8cuCF6mknmYQVk57Vt9yp?=
 =?us-ascii?Q?rxJwonXNMn3n2ukSoAPyq4EAH15+ukGNW1+QQKXI5IexwJ+DZkcccJpsMyX+?=
 =?us-ascii?Q?7v8iuhL8/X0j+9A+RxmvwoGlnB+BbnG2XoKHVEF5yZlDJypxmGf1yq6EYIow?=
 =?us-ascii?Q?tSOkg+Fn9LLsZ0ozuiSJLTVCtM9KFrdvBbpjwHhUUj5Op41EXzzAL0s5S6ir?=
 =?us-ascii?Q?w6cKk2DGekGegxhQr7udj0Q35nWxFEwjUFxm/PlbFiZHHvgGXsU6T6n/fTtU?=
 =?us-ascii?Q?s8xnKH0n5mLhAmf2k4WNn1F7JNW8nVswtaGbs+FhNfjFdVyt3FQYV9RUyQX7?=
 =?us-ascii?Q?jP4eUjoS5qoeA6WM2zgszYMYmNX7+DjcGyE9tZS2uo+ZwknMtVG8o1Rfgi09?=
 =?us-ascii?Q?E29CZaBAZqxckuhVY/sZzIUbga5Puafa9/21YYKtrvZyR8xeHTf0KBVtJRcy?=
 =?us-ascii?Q?91RKEde7ukFyUBWLsODSqoYhUT1R0vKU1Hp73eYyRvhF76QdejJjp0XXz8dR?=
 =?us-ascii?Q?dl98?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 09:49:35.4599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 92bbdb52-a622-414a-bf6d-08d8b6df5eb9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MZZ9r2gAFqF4L+e1B/gcomJ1tB1SgxF4LE7Yi2b5nJIzZ+nZFU0dxxGXIG/Ur7F+OwtMMvAocHeeoFlkaHKU/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4089
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Introduce is_iomem to indicate this piece memory is iomem or not.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
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

