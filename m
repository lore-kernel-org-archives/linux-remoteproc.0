Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A27FC4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 03:33:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D27C60EE4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 03:33:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238520AbhHEDd1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 4 Aug 2021 23:33:27 -0400
Received: from mail-eopbgr20089.outbound.protection.outlook.com ([40.107.2.89]:6822
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235289AbhHEDd0 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 4 Aug 2021 23:33:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHF/TCpP84qMtOAkITXdjbM8Zv1uXn/0SvkaUl620gHq4fuEkUuiXo3sKgnJ4Zc2cnKOq46b8L31JO/p9YtsFlnMgLM1TZJgQYmaOU6i5DNj+FAzRG73TBMzWqu1yUX4G2tTFK3isSMkbKWj1Ryg7L0Q1T8wxP236LzFuPzoh2w5kKK0lp5zwxf5eUIpEE3Ap2dU45chV+BvQWkt1EQInsXKiPFSwBsxl4mVW4eoUstzIzbmy+EZcTqq0bt0FJzFe4XAyCSzCAs901Smpfvz7+D6sqdhsOM0NZR3QuNKPKAgzJm0jDGTUWb/4lZKHLLwGf7o4bVxs1DWj+HaQ72zoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhYZ+GHfcDIW1uI8dOyAGzRl6ub+6ExE49yh+oSEtG4=;
 b=HWja7CS/YnQuFpODSeZkncqaSE15aDjs+VSOdSqTbho+Yh2ksmQlLcXu7slDg03Vwl9FZpIODMdyD4UmTjmzA8ZZJsFOTjUOzzh8OOjE2F3ftGrJBZK4ScW+8t+JOnWXCF/P/tL2CAI62SC1JmkWI8p6+v8DC31dTdkXXZ6ulc8yYmgAm2W3RBotQI8Do1rdQ1NjIPa4E8n4Mp0Q9lW3jNwB7OrORmMN1DFhWI1PBBVxBxPUiYmGkrpJM6hUQ3QPD8D6RL1EtDSPh2o286hwhe8QtC/EjvVaGd5j95eKcjjJzMRw0PYWP/gGmxeLyExKpIoFot4T6dwl1jMklklxQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhYZ+GHfcDIW1uI8dOyAGzRl6ub+6ExE49yh+oSEtG4=;
 b=UXoHLVj9leL0hoNqESy3I+hiY+kjSYuofoZvt90c4RCrj0wwr2CE+B1vo1XrJB6rddVN3MvLtcOzHYkkqjGYWqdGktJ7e1sTpqBaQhFyS/INZEj6f4qlZKz5Tcouo0sqJ1eB/HCFjsqAK1jjwVhIY0wkyo9WRpyKaIAswjl3Jhg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8837.eurprd04.prod.outlook.com (2603:10a6:10:2e0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Thu, 5 Aug
 2021 03:33:10 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4394.016; Thu, 5 Aug 2021
 03:33:10 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, cleger@kalray.eu, peng.fan@nxp.com,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH v3 5/5] remoteproc: imx_rproc: change to ioremap_wc for dram
Date:   Thu,  5 Aug 2021 11:32:06 +0800
Message-Id: <20210805033206.1295269-5-aisheng.dong@nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0085.apcprd06.prod.outlook.com (2603:1096:3:14::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 03:33:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37c36038-00a3-4613-736f-08d957c1bf8f
X-MS-TrafficTypeDiagnostic: DU2PR04MB8837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB883787B7CCBC6EBC43D53F4280F29@DU2PR04MB8837.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u2r53EPmBwCnz5Xm6CUnhR3aKr5l7OuIi8uA4/waM5oVjX7khUWtw36nQN0daleRS7MLtKeibMj14qvtwTDkI1u2nybxemvF9tCTixGDGJl7u+oKzgnJrwjEOWqkpCAXxcd8Q6JX8iXq7gBBxs5pQC+P/T0oHklDs2McaZE+EbKhdj4ImjnUoP/3IO5no9P8tDqEmk+f5BLjoKB4BeA7GWwHQoNR89etKIfQw0zKhZjGoi6rw1xd3EfV7YQuo0rhJEYBci+/SAO2Pg9mAhoKqilJrU13ytzsKkOGKTzT5kifF6wXaffWjfi1tju2obJz+GNM6WzwWOGLQG+1ERxqmOAh80/luP05v5CbFAtjRvOr1la5rhqDMcGXMSAcrrLn8l/Yjogjr7VJZ8YdOnmr7ZnCiB7kEq4TxXh7fdf8k5270F/YRimMBzQkCX07ie6i7eXrfFwsx9tU3l3JxvwPlzOLzTeXMhOvYiYLQUUmKxprxHHJbMBkr7H75/SmVgVbTZA1iR/R5GgZIPbPVwT+sLTSfv3a3z2Gf6m9KbqEhxTGD88vJze1PRknjKjyEdp5CWDExPie51cSgxd5bh1ihdXf5IjHB/eNKX9hxFwmBeglovqCqxVBTZt9dJcGSVqXLEZq8jGuP0ir1YZ2gKdhYsS2jHpOB+jHuwveWyYKT2m2yqtuw/w2uWI1IZIEvvy7GYhpWs82nmXEZQLGJTFKtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(36756003)(83380400001)(8936002)(6512007)(316002)(1076003)(86362001)(6486002)(52116002)(2616005)(956004)(38350700002)(2906002)(38100700002)(6506007)(478600001)(26005)(5660300002)(66476007)(66946007)(186003)(4326008)(8676002)(6916009)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2JO+PrugtEq0JDQR8B1FbGJCJti1EO0I9Dwrn5wM0699vZYme333jL9Ds6OA?=
 =?us-ascii?Q?7/7KAZinpsj/9eiHig8yoqKVn7uhS3Twce1x/5Ap/7BZP5jgy52nJDE+Y3Ss?=
 =?us-ascii?Q?nmrlmhpL401yllEc7YiuQkHjMCiipVzUN9dxTwta/1F/530l5W+1lt7qK/uh?=
 =?us-ascii?Q?BiXBy26worr7qACEto+6zNXdfW1Ic7fifliYvtgQVEYfh4N9GI3bAbyFqxkK?=
 =?us-ascii?Q?2sCUaghXFnual+QBeXSG8CrOy5ZUYhrU8A/k+RdeTcGcQ/xCukJhYh2DG47Z?=
 =?us-ascii?Q?5QoYDrT4cOGQN/ceLV+x39nPNGBd0naGajmHssoSkoVIWt9Ki1KXrXIIDwLv?=
 =?us-ascii?Q?rwbC4KPf1BFl0QIYPTsZgUAcAy5tLbPMxS2XMe9gae9ACr4iYJoEPeyKH5ij?=
 =?us-ascii?Q?CRBHNBj+a4xA4xXWdocbsoATMJ8wBJyE5DikxYmPGiXxxLVj2DMYRpw+wBTu?=
 =?us-ascii?Q?9NqlWeHa/aCj13VIRk35yaSHV6n+aXTvOJBAdslcW5j/8ACyXhB03flL34VC?=
 =?us-ascii?Q?dVXLcQbMpxr90UCth662F749tUIJfPNRPBtoSfyDZRlNBc7v/5TNOu1MpAzb?=
 =?us-ascii?Q?hy8aAvE3T1TtUbDwOBg1qYnYSrBeR6J6Gc5MMS/m7Xq+tCOTEvNT1OoE6N5v?=
 =?us-ascii?Q?urxFrhEA+1gFsfJ//6S9Q1wFe5n3th5SgBPHGbBvjkzwhMpPK/EuofsPmY61?=
 =?us-ascii?Q?qx1Tez8CK8oXx3q4l6W+chrPiSaE7DntvGCkF5wC/dUniZ41JXKANpQrd86y?=
 =?us-ascii?Q?g3gEXd1ifGIl3biQ4a0R8AoiNoIFdqISaD7EBUo0z+xdSfq0pTzcw2O+3/XL?=
 =?us-ascii?Q?TPLd3OMQNkWEnpkzZpiGZkaDef27rLu9Wco2nKa4tzdHd6QZMoAq1T0FPTB1?=
 =?us-ascii?Q?U0Ns5CowOWXug8Dnjji/lh5HOAr2Wh6YQS8D8CqF7377xwi3Zsi+bDOnVppy?=
 =?us-ascii?Q?s/YtdUh7TrRnlTwDo6faaadYQw9egnjjO8taQsZZd8CrONjSQ9lpmywjM4BP?=
 =?us-ascii?Q?DSM4OB+7VNzgcamTUNOzXgXr2t4Qygiv9PBAbu0lzX+lRMDqhxcpqKcqFwvW?=
 =?us-ascii?Q?Mr0DgvVhQ3tfr3YTRz+fZZA3IFTNK1nyOAn830qTyQCkfNexHZcEuJExvTgu?=
 =?us-ascii?Q?U6GNLq0Jvmw2x6BsFGP2QfmovuCjmlGbgvQwf5x8Sy8gi8S+go6Pl5mWeB5N?=
 =?us-ascii?Q?Nu7fXyMZIuZTrrAQKPXvMAtdDfArtjvrP69cQgc0IFbhfVWv3MBUT+m7SIbc?=
 =?us-ascii?Q?6ll7MIzwKNR2+Rv4cESwDzphm7Thre4Nzn34WJIqd9fzXgfzSax0pvX+scH8?=
 =?us-ascii?Q?833e2ZlGnjZmr8efrx4K2xQS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c36038-00a3-4613-736f-08d957c1bf8f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 03:33:10.6338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBZPibbQ/NeX8NdrVcKWaXUIYPJNcQOo+6bc5HiK6/ZS2Q9Yyk3D4DQJzO5SpTJvPEgZASHa78Dn0TEX3NH1/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8837
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

DRAM is not io memory, so changed to ioremap_wc. This is also
aligned with core io accessories. e.g. memcpy/memset and cpu direct
access.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
v2->v3:
 * patch content unchanged.
   Only drop the wrong tag in v2
   Tested on MX8MQ and MX8MP, MX7ULP.
v1->v2:
 * new patch
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index ff620688fad9..4ae416ba5080 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -597,7 +597,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 			break;
 
 		/* Not use resource version, because we might share region */
-		priv->mem[b].cpu_addr = devm_ioremap(&pdev->dev, res.start, resource_size(&res));
+		priv->mem[b].cpu_addr = devm_ioremap_wc(&pdev->dev, res.start, resource_size(&res));
 		if (!priv->mem[b].cpu_addr) {
 			dev_err(dev, "failed to remap %pr\n", &res);
 			return -ENOMEM;
-- 
2.25.1

