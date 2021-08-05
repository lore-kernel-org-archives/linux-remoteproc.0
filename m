Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B07C4320A
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 03:33:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44E1060EE4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 03:33:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238518AbhHEDdX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Aug 2021 23:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235289AbhHEDdX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Aug 2021 23:33:23 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::60d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2F4C0613D5
        for <linux-remoteproc@vger.kernel.org>; Wed,  4 Aug 2021 20:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKSRcPoMcOFYwiUwNtYtlfCIOuN0ZrLFMO00iYGonzLXn9KpiR6OJZzhFAJOb4t0B3P5i6GOpC8NM7JHhOjWihKgaa0r7iJKhNvl9WJDc1J9eXSZ34+ZgzrWfkcLeF+yYtzXXrWyHcFLHQag6ASqps/m1nuyE9saEvYyPlW501sJIRCpNWY9cNhcxmM9/SoCBPE8h1zs8L+ZwLubUy14wMhEvKfapdj+29E8FbTBMzpbt7gjDSQdI1k+QmDkSO+xmaLWnNJzBzceFfgKw9utHoV5tgVw+Xr7uJEKtF90hrR/VpcNWgQX7VEZ9Sbfpf9cbU3ZG5UKf7bqovMhDFIaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBpBiotzyw//tLTA1XFzKDFQ/dO7RtFjNUmHTpoqKW8=;
 b=EsbFMKmLkcvzykwiAGAO9grRtpFlWTVdbtLgZMwN51kiqYT2yCwA7jmNyFCQ+M6hzb5RTMN5BOHzKu/pb12nyFc+1EdqX/bEbsJDaa/N+f5Jo0oNhUAX2t858PH+RKhgUo82q/ZozSsQsH4azXktNs1eR99BTrrqNkSLaV43zJ5YJTB3ZM6ElOsPx1UDRMSDNKRVUn4uHtCA9GmqjbBRU9xoa0ISf+nD1muf8Rsn+daxdyJ4ATvgnSjPN2h5lo3/EUf8z0KeGAE4JA4aRUq/HAc5nv4jtPG6jxbuYtcZNd8QdJEViYKcdLRyC+o5BdnWfYKNrAcwgkOoaj0CMQUqHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBpBiotzyw//tLTA1XFzKDFQ/dO7RtFjNUmHTpoqKW8=;
 b=SZ1TiGDWLEdaY/7Ifr4A+7xIFIWZ6AD/czf8UV6MGSiXmMvENvjrJsAFSTVd1TFFW3xXTUBFAy3ZuyMnfpN9tsL3TB/qu72mkPEY62bj3ml6NaMiBTYfMK2NjUF+TLwR8o+N0W8cQQZiLVqxnfd36W562csl6zgVP8i4m4Jrxbk=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DB9PR04MB8448.eurprd04.prod.outlook.com (2603:10a6:10:2bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 03:33:07 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 03:33:07 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, cleger@kalray.eu, peng.fan@nxp.com,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v3 4/5] remoteproc: imx_rproc: fix rsc-table name
Date:   Thu,  5 Aug 2021 11:32:05 +0800
Message-Id: <20210805033206.1295269-4-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210805033206.1295269-1-aisheng.dong@nxp.com>
References: <20210805033206.1295269-1-aisheng.dong@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0085.apcprd06.prod.outlook.com
 (2603:1096:3:14::11) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0085.apcprd06.prod.outlook.com (2603:1096:3:14::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 03:33:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d751a60-5b70-49f8-d9b6-08d957c1bda8
X-MS-TrafficTypeDiagnostic: DB9PR04MB8448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8448863298308DF4125DD07680F29@DB9PR04MB8448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JER8vJyykgkKEF/jOx2c//+ClVQTnbWg0Mr/DN1+oPcKPUXKuwxh798aY6id5PElkw0Tbn81RzIjq5TuxB2bexvw2siOLc2gYGNnm3lUnGbHi+4Y/i6/bUh/44acLqi1/VDdfTEEZBh1H0CpZEFKeB/jf1jwIpFXA4OTHTUoOvR1WUiLjNMjfNl5kJk6xep3CfTJlan8xaChxthnA2EEViyQMOsq0VSpz99t2LuEBlpOPC+ZoVG57RYJuG15bROZNcJ/C2ATpFflmKf4Ygra2/NTEXNP010pwcAac2GUAhocclpo8SlR8LIWAi09gTU0q6cEZA+Dj6ycv0HrPPG/XXAxnOA0hn2seME5+Hqd5h0Gz4cBhcmmi3M1RK3pQvrR84bQ4N9I4TT1JV2LbcWPz+HYAoChgafnLB4ps/9gL/s9aPFfdaC51R16UynTQKUloex7VFqgy3zmJUWFhjkL1BbUAcMh3oAvdIJ41e66omUnZKoptyTjoWzObksdpspqaDDUXUi93lM2Gc3Xafv2qO61TkgJil6g2GhzIwC2wrkKQn4xXP3zASP6k9okNi5tXgau7NPjERW0sZ0vsKKvML8rX1Z48nh0Bn0igTlEYU3SoTdFTwof25VNAWpL+tW4jdKwOysEEhfYY9A5tLXZZHw18Z/VQdYPXFUd7Gr9rSir26R+66koRaZMWuw3jXnAdAuiWIeqTHDFtKwTTYxm9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(6916009)(6486002)(66946007)(8676002)(1076003)(6512007)(38350700002)(38100700002)(66476007)(66556008)(8936002)(2906002)(6506007)(186003)(2616005)(36756003)(86362001)(52116002)(478600001)(956004)(316002)(83380400001)(4326008)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Musyhlilk3CL8FQQSiBVU3C2fUx208f9CVHdeVkuxmh/YDic9GpD7PDN7//V?=
 =?us-ascii?Q?6rQB1cLs5mfwF6otBHCBJhPRRoBjPef4tyuH15hRya7rug/C3nC2tK1z2eI3?=
 =?us-ascii?Q?UMRbVFX1DfW+urPwoNVsh7e8MgKuFKdVKo8FF7udTdL4ovOTL6g6dboeb/qP?=
 =?us-ascii?Q?Bqefcr+X861EMA5afVB40LWAvgeTGfxdbJWZrpgDeLqsKQ9GPIEkCNgH/WqX?=
 =?us-ascii?Q?TcI0aPcTc/wr5v9TqA6IWe2N7bdffvcRvd2ejD53VRgoyQl14LFCrfnKpvSO?=
 =?us-ascii?Q?l5ksARuhUiIorxurwqGn6wGj6GiPr0DnLYa1TIITgERtt1rcszg1ZcBo8qjq?=
 =?us-ascii?Q?p2PgmJ/4+Ae3oMWGRn3ball8urtKt0ciAw1+nnpj0g6NV5r3Xt02jFgQfb+e?=
 =?us-ascii?Q?4YstzByYv1OPFEpiutkcyBvx8tVLPsYjX4ubgo5XjrIBfbGG1PvlVXAslfU7?=
 =?us-ascii?Q?bEnJ6M2HwsNKgchHJ/BjJ4AaGcQRCTMhaX601D+Zm9dI/d3CMmrWK8uQlp8w?=
 =?us-ascii?Q?yW7YCHeZshNugPNpA5wduC1N5vhQwJSEVdJsjT2CSHcbxsmIxsqvtbzxIhs0?=
 =?us-ascii?Q?GeSEb7EnVziB85YPd2PtVNW6bK19p2UGoDenU2MEnJAAOhOOEPXHJjvBXA1g?=
 =?us-ascii?Q?d2griafxZF+UeXPfZIOzOTVXB/g0OzTJ1po+xxw+cWjjEBoGBuHUZno158Az?=
 =?us-ascii?Q?Y7pD0H+wULC8w4zWDYxeqJQW5tNglMtFRZvC17FYLbnuKcYiYL0HQK7/vYhu?=
 =?us-ascii?Q?rn6lI8g+El44yPSPQJ+m3BEp7Eh24LnzRhQZy5JCJ7tCBWeIGTXtktdXEX8e?=
 =?us-ascii?Q?BXUWrUD/+AngrgkFhlqQyYxtEE0rZe/70GnX1raoJTxzSg+fyQn9dFd6HMDg?=
 =?us-ascii?Q?eOqHpqlSOPQU8rUzXJ1CfqZa2Q6ov8JMwdPAr37xass/h6hRMrzdeAzZ17wy?=
 =?us-ascii?Q?gIAzUbl7XML1bITI43rK3lJ/drm0HbY9622SdoATe0feXs5IFBRZXWmdxR+a?=
 =?us-ascii?Q?hY0sqqwj813tzPSuZwWzN4CsOKEnoys8oirn324UPRVLLt9D/rGzDAbwDpl6?=
 =?us-ascii?Q?DvTP2FHhi/I+WfTsiw0JvBLh6dnzbfYnKiwS3DqrUfOfdepee+oG4+vUn8pa?=
 =?us-ascii?Q?HnY11DSJRsU9yqkKOxaRhmyvVTvhhIed577gHyd6Qm3ULzT8sd+YCVcFddxN?=
 =?us-ascii?Q?46aYqrcJVFNZfuYgTU5xEPgRB/msASLa9V3B/cCYeCNcovbOq3q49Ik6xPCO?=
 =?us-ascii?Q?xY4E4ex7hPQvVgibqP5dlLVEl5NlBJi8PUAjZAd2D2xXl4APn9M8nVv8FHD1?=
 =?us-ascii?Q?atDMLtkwKidOivrTKT2ojAnN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d751a60-5b70-49f8-d9b6-08d957c1bda8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 03:33:07.4598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4anR6IkcJC7kTzHLMEj9vnp51S+RWiiE98kkjg4Y8o1avAcmsqM+yvCYV42DjehSZxndKLVIJ06OUUa9RBlc6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8448
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Usually the dash '-'  is preferred in node name.
So far, not dts in upstream kernel, so we just update node name
in driver.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores booted before Linux Kernel")
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
v1->v3:
 * no changes
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index abfeac0b1738..ff620688fad9 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -604,7 +604,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 		}
 		priv->mem[b].sys_addr = res.start;
 		priv->mem[b].size = resource_size(&res);
-		if (!strcmp(node->name, "rsc_table"))
+		if (!strcmp(node->name, "rsc-table"))
 			priv->rsc_table = priv->mem[b].cpu_addr;
 		b++;
 	}
-- 
2.25.1

