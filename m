Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22EBC433E6
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 837D022D71
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730842AbhASHvW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Jan 2021 02:51:22 -0500
Received: from mail-eopbgr40046.outbound.protection.outlook.com ([40.107.4.46]:23219
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726155AbhASHto (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Jan 2021 02:49:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSlUAycSbw4VwLV5O1FlUKFkhBjL/UheswEQexKvnqNj/D8+uCrvwQI9NStzFsnQYdaRNYYM2nfFTEk//0nFdcPAkkb67LJFvrRag443RwkCjUxcqudyapka4ZbPbemoSm3sz2/yU308EGdHMBG6yfJCuRKLkR5VclOVhVoA6+GZACNiIhVMb7TXVi/4eFUAPmjnlg9OqGGlFb29xjp3A2R1FnXVnR11cdbakTb5g74Ze2kRFNGqtgVM71Si0CHdP3XjGQZiocD8K8tNYs+P/3wv7Jedl5SierTCQFQlCFcSm+bGftPcCqXLcHIZlpFzrh6Q41KUSZJ36dbX0zfDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=115xpTjMhzr/pXT7tXiTDwfmJxE7ztAJUZp9k7KqSxc=;
 b=CHfp5GmgicwOM9qu4q8pgH/4nSWlUo535ivBhCCEzh0t59bmr8+Zve5PlYt9XX0J/G0dElN+vg8nd8kpqkjvq4OQumEJcuCc6ObNnFytQ0PEEg3a4TYHLkbnKdkdgqjmOz59U85C/7SBG/R0z5V4Rffniad98YI+Vt9l50sXLImemAYXS/N08AjPqUh9GWQ4x54Hlq/E54lSjRI24jHggGChdOq7Kto5+BBkr0veqV5aN0E2FpUyllg1/YXsn6SaMlWSE62EZ0jClWm3toXKCP8NiYH8lzXuA0PiJK+1mR94FF3c995NQeFB+Qnx24d9skkTsxlIogTXLEQRVUPqwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=115xpTjMhzr/pXT7tXiTDwfmJxE7ztAJUZp9k7KqSxc=;
 b=RSayW8HScpocRb00uxeRF6SYI+S7YntOzOjSMRu5M4z28PEGPcNNYwsNeFaWtYI11WOroWPzkqJRDmfmYETIG+3o4mSwhORuGsrBWV5DAOZPTO0lIYGu9vx5DL6MExC0PTztWKOlubGozfwUSURQCHATycEMstA7RN6T9FWvJtg=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4492.eurprd04.prod.outlook.com (2603:10a6:5:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 07:46:28 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 07:46:28 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V8 09/10] remoteproc: imx_rproc: ignore mapping vdev regions
Date:   Tue, 19 Jan 2021 15:35:10 +0800
Message-Id: <1611041711-15902-10-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
References: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 07:46:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 468938e9-453d-417c-4b1a-08d8bc4e5458
X-MS-TrafficTypeDiagnostic: DB7PR04MB4492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4492D364F123EA546B57EDF488A30@DB7PR04MB4492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wvlzfERfPvDqY1wrpF+Rd/KrAfFMHhUi2pe9IZwiSciHdYO+jcfnem8Tr4X7xBkDyyiORst07WYkSOuJvUZ/wtUaJP8gMxm1U04DhyrIMCAgwRERKNJ23suYU0icE8KBRR2fHVAao7pTRqoNnpOVxb/LfTX05QSPCJlBSmrSoHfNFPF2jMC57kXuKt53RD1fkJ/MQBNIvcFdPi1ipWcfWzEGejSnhUk6AFZ1z01IT2tHb2LhoSP5F8mTjjWEHZzbiVHuXRui1RBw++rgLmmT/spu0CDaJ2DIUBzSXpSJGIxwVY55BgVqqdy/3NEc5BbvyGwck0P0zx+Pe11+BwGj7bcTzRJNuE99522N/jbTWJlXtFdBAqI3jKtzeMbXwXUYdtT6MRNaCj0s5Fcl7KxCXDlFv5fBl4C/7SH6UP/o8IpcUdx4jpm0e+dGAOTQlTW6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4744005)(5660300002)(2906002)(66476007)(26005)(69590400011)(4326008)(6666004)(66946007)(186003)(6486002)(6512007)(2616005)(86362001)(36756003)(52116002)(8676002)(6506007)(498600001)(7416002)(9686003)(16526019)(8936002)(66556008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jbPAusOaVUiD9fVHA3TvQnBsN03Kdg+oa/CD3LRcGVdeH2vi19bpR4ycKsDl?=
 =?us-ascii?Q?NWXPxc0aI6uvnnUe3XbIY6Zn807CNfkwqJ4oHJXTbrWSo+/4E0+RRk0VWXxa?=
 =?us-ascii?Q?lMjh8d3Yjh2apccc/RfxZlTm3vk0NKQB3/lS05NeIuz940FlaJCv9KqQTdxY?=
 =?us-ascii?Q?WYOVkSAZfzajIxD7JoI7p7+lxpbzrfsdmcrDkUnueIhF2TCMzQ5ZnoUeM8km?=
 =?us-ascii?Q?oVd+xGTQCgzhR65SqSKCRYcClKydigr+wIJiHv8kDb1P3ZNfPm42tBw+lGwR?=
 =?us-ascii?Q?Mxx3O4fE3+roN4njffa0yjtQWiB4UmFfHD62uRAbUVfNtGriRgKEqe8UKMio?=
 =?us-ascii?Q?uSRzlL3YfRsvQt+YhVwA5yPRbt5fWYNr0VnIC64u7XS/yM009KBLbjspB4Hb?=
 =?us-ascii?Q?RGQR+TeXbhdZLoYh5TU+c1qpm1A2ZEBIGS6K14WncDc8ewUUBvH8Y1pdUbPQ?=
 =?us-ascii?Q?B2MTkyE7UK/lIcqMKg+aDJQf5ofc0uH2UGvLOkXKAxkIbz+TTzRTALmQ7u44?=
 =?us-ascii?Q?xR/0uuZY7KmOGeciLog1OVBsPH6FKMQxZWlM5UxF2DRqoT+T1IxNjYYi0kxm?=
 =?us-ascii?Q?hVAo5o+HHqU5ght2HVbs7Zb2BH5+v2MwpQlfRexJAIVxtTXt4cFMC8u4bZ9Y?=
 =?us-ascii?Q?ls++WRDxnUw53/uknDTb82zk9qTQfLlEj5dRWKzwT8uAGgztHrJAInHz1bit?=
 =?us-ascii?Q?xav4BAnRwiKci7MC5dTjnrXVkL7Q/vnzPUmoJJnLUGUDznx84P/p27+12mEt?=
 =?us-ascii?Q?aVRcsPaDAZtFdRga7xOuNYSmST9CAojY+HBoadUBzNnOF/ETTBGoSW6vlOeS?=
 =?us-ascii?Q?RlWsgYsykr/0oKUKoVv8dQPJmJnNa0HL0zWI5AdQvRjKy8dLIpQ3o8JgSfqu?=
 =?us-ascii?Q?lrRcI6Wgr+zxqBivSz+yylzxJu0rXZ0SCvwM6se8R/61PeJDMgWABocJnIKG?=
 =?us-ascii?Q?nGC7z2YzZOQOTtYyASlzzXiG3jUyABLgw0UFpitYFzZyxS2kICOdZWZl1Am4?=
 =?us-ascii?Q?P/6w?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 468938e9-453d-417c-4b1a-08d8bc4e5458
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 07:46:28.4737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmdTF7zii5AlI8U3t4Mbm3oZA55cteG5naw50xKinKWxeNqvhhWCWxXdI5WQ07uT4lMPQZ02D4eLC4tnC83X9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4492
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
index fa01e64cc791..54ac143ba033 100644
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
2.28.0

