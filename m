Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B31C43331
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:50:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9BD864DC3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 15 Feb 2021 12:50:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhBOMuf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 15 Feb 2021 07:50:35 -0500
Received: from mail-eopbgr40044.outbound.protection.outlook.com ([40.107.4.44]:27717
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230223AbhBOMtN (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 15 Feb 2021 07:49:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZtHpkHCFPOw0gKHSkCFPQEuwiWnKKk/4xPBMpnqQf0CzYhE7DC18i2HtE6kQrlVEtwN8IBoJrii1dqE/uaqdUzHUSjcqu1e23qfg9rgUuWdjsLWH8JQiWPIk+GoA8xTA2vCCwwQVjD4u5ZWqR3VDdYq72CkAO9RcEs084crx42IB9DMl1+SlobAfz0FX1mnkbgyK++L3KUjO4kKYPoC7lQuvops8kur6hlx/2i27LRWmpqZCTncTN3VpssbGFNd+g0ajzbfEVJJz6w2n5HKwkxUuHf0oLCfsoyOZduZQVNSkN/I6ds+TGoT6+GArhLJWBrwpwo92vrm3x4QUEBHS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylGtRczgykA3LROiqvT5P1IRIRg5xXAemZjMRiCZwqI=;
 b=Q0fZZc2MpZQLJDbUPSCiKH5WQr8JfkwYqzwnSQIxys8LUzUAtu5F+muNJhArt/mtdpW20TUheqQPDhvSbomc7nGcQ4JisCDGkDwhzJ2/Eqkm8OJR4lBZWsAwhUiXXrUTJJcu9v6NnOa3C5paQpzS1cyKv6rPn2KlwEEcZXYIE4bUMD2XKfraDbYla+6ItqcXgSzoorH3QdZJBHxwTJMiVSVXfpkYcypj9T+4Np2+HkBNU7V2kAqJr6nezd3fMOjWCqi5cTCiEz5pktCxYC+UK8kbwbTsoy5o3xd232vlUfBazYwKx4c2eks2Vpfnuna9OSBEdTrjFwP4NljJTFhL5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylGtRczgykA3LROiqvT5P1IRIRg5xXAemZjMRiCZwqI=;
 b=XkNXVhMo49blUbChTgWqup2GFmUxOT2KFyNr0GDT/dD/MORsuKP71oHTnA+JKlRceEAxxd6c0QjTET5jZkQZclWJMPUbb1abzjkRHrh4xb+M1DP9hGUz7teuzZ3pkf1/YLJhv5IHk5TPMLGL+nOAtN1iJEoKx9/geGpi7JQFC0w=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4091.eurprd04.prod.outlook.com (2603:10a6:5:1e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Mon, 15 Feb
 2021 12:47:14 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.027; Mon, 15 Feb 2021
 12:47:14 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V10 09/10] remoteproc: imx_rproc: ignore mapping vdev regions
Date:   Mon, 15 Feb 2021 20:34:22 +0800
Message-Id: <1613392463-9676-10-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
References: <1613392463-9676-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0302CA0019.apcprd03.prod.outlook.com
 (2603:1096:3:2::29) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0302CA0019.apcprd03.prod.outlook.com (2603:1096:3:2::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.12 via Frontend Transport; Mon, 15 Feb 2021 12:47:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 79cc3fd9-569e-4eec-b260-08d8d1afd14f
X-MS-TrafficTypeDiagnostic: DB7PR04MB4091:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB40917F01B068C88FDA48E58DC9889@DB7PR04MB4091.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bVoM7i2asLfAAOZrze0WAyYR9SmTpFMcqcK37MBTv/maPkxbLixDoyT/4QHpInqW9kjoI9QuHJHA87umvZNS6lNpkYIEMRqf0rgbFQD+rupzzjtSZKEPzBAJavI9WD1H1CmxXnepREGyCg9apAQKE4J06dPxtvenoE2th2tozm8D/Tm6B+HRoF/6gneDmspPDRy9s+DhZbW4zZFE7rBfeb7psTGj2fuxuY5ljGbO7g8HUiEn3WBEgNDVa/tAq92MhWYHVSM2hgD7cz9J2u4sWBLc21zH19i7mnLX2LGySlmCNyp0djqe9NCHUo6Sk+xj0VLOwjNWuE+Ys0zPEIKwwvGP/BXAS2B0bsmfsYBoO4XE3eNcJiLsvFqdQUWg0i6hkE+r1C4dgniFygj+RtIkB9+arM37F2hLCiJw3v5dmzY9e8LliJZ/APZp6lHbUr8oSBKs/pnrMw6dLnPgdhC3nSehccnG/k/Rv0GT2BB5kymExlLje7pBhCdl7wg0Y1xrbK+AhRZLrDh4VlR3fLZc/v/Z4zWat/gJtENvUpKvz2u+tJAzj+LdsYpOlIpAyt3UIxvLfaa/HTnyR2l/+3emtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(26005)(6486002)(9686003)(478600001)(316002)(186003)(52116002)(6512007)(2906002)(16526019)(4326008)(6506007)(8936002)(2616005)(956004)(7416002)(86362001)(66476007)(66946007)(66556008)(69590400012)(5660300002)(6666004)(8676002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?t4GlAx2XRCteQ2yk9PzGMBgutBgLesWLER7cRUdstaYCkEN8odhaUM5arDvJ?=
 =?us-ascii?Q?2I1zdqDZHJStY2UAc8BWlaRw8Hamk0g4Qmn5oUq95MUUPbnm5Fi17cG2R8kL?=
 =?us-ascii?Q?xzZJtn1bwFnqL1kj+4v9J1Gh2TacV0DU2dXzN4JN4W+FX+umdJUpY8V1CQR5?=
 =?us-ascii?Q?6+Q1WRlOtBtXS3O3ucGRxIt/dVIlwwdiR5b0xxMMlpQg96q8nSHolypz+rad?=
 =?us-ascii?Q?PTVNJ+Qf4+gj3tt3gKmyYoC/JGz3xo94aaOFQKDdnq2lBZx0zY6V+vUW2EcI?=
 =?us-ascii?Q?SOglYsWEv0R1rvp2xsfGuBNyiV74JNFlOJOAD0ngJ35pTx5Np+5KWriwWw/R?=
 =?us-ascii?Q?rsPNNf5IRbdgRG7Tsn2YSJC9YchgvvQnyMhG3kSvqbFluoqLowEG82jOW9EA?=
 =?us-ascii?Q?/5SKWsqn3jRvoDIclFwVyvB90puTUNUUbukaYdrPZ/G129YxGYukFplRSGFo?=
 =?us-ascii?Q?1g73jknpxua6bvfqwAVkTO7j/8Qf8wyEMm8PIUpt5gBocfIFLklCLescmUe4?=
 =?us-ascii?Q?98eVjUJ9w2SdC5DIXsTiAPNOSxgOasd2xjekJumvhhbS6QWfEuHhg6WyHetD?=
 =?us-ascii?Q?/6B84tM21jTBMRnc2q/pqGuddqJvyiUGqV/cYjNxpUoQmjO/vLkY6PGGCrVj?=
 =?us-ascii?Q?H7fvZg5NHzPW/Xe7D0evjPOfvbYjuXZo6qo1ugbubRSFci1s/Efr+QtIHvIy?=
 =?us-ascii?Q?u3yuOz9wp2gEDnq0qJi9WDX8jzRVcXgxlmZ2Cvusa8nLKBmXHz9mp1J2qJbc?=
 =?us-ascii?Q?guOZHp/Vp+bKLrhz4s2abbcJioWCtKFdDypGCccDdYvblLvW7X2AbDWIq6FP?=
 =?us-ascii?Q?Mn9wq0+m1pZOsOAnorU98z5D3sxZMQNao0uJH3e4HgmT1vhRNiS8TztJzxh/?=
 =?us-ascii?Q?bg9uilPuQz9W3UhAEyNtKoMI43HRcnT2jPNRxV50zEfkVmGckxMMVCqSArSr?=
 =?us-ascii?Q?/X78CvPDQH2YuYVadcx2DdRYA2f7QKaUuM4XuFxg541+j26z0wg6WnJ9Z1up?=
 =?us-ascii?Q?+ab+CKv8whhpH2H5GjradfOM4vOykr1Okk+I9d8J6Uqwq4QycNuSA4AoOS0g?=
 =?us-ascii?Q?0YEf6Txt3XrEeBgsQnIAZh/usZgztR4LMectdYM4+nEj3TjIdYqlAbPHLlWS?=
 =?us-ascii?Q?nOfMs8LSiNEOWiVflPsJD0K3r16goqF7aFtLh/b+q9cH6imREia3XegIHYew?=
 =?us-ascii?Q?MPLylZcPOYnXQHLr0ITrSKF3S9NYApuepn/ytCsY3n6HTSEMxpUsudRlVScW?=
 =?us-ascii?Q?pRU9LM6AyCpmRs9l1Rgu1x10zsqHFioNauBNt09pzuxMumPVwVsphqVAIxqz?=
 =?us-ascii?Q?bYE/g6tcGw1zZIz8LGQq8Acp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79cc3fd9-569e-4eec-b260-08d8d1afd14f
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:47:14.1614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkCa6BSDST64d2lGDREoli7yWxxQViZoPKEdjc0TGSxsNjYn17he2b2wf4zJ3HO5W9+Y/9SGXZoRAcwx1ENwkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4091
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

vdev regions are vdev0vring0, vdev0vring1, vdevbuffer and similar.
They are handled by remoteproc common code, no need to map in imx
rproc driver.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 0124ebf69838..3685bbd135b0 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -417,6 +417,9 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		struct resource res;
 
 		node = of_parse_phandle(np, "memory-region", a);
+		/* Not map vdev region */
+		if (!strcmp(node->name, "vdev"))
+			continue;
 		err = of_address_to_resource(node, 0, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
-- 
2.30.0

