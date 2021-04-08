Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0635BC433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 01:59:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF150611AF
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 01:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhDHB7o (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 21:59:44 -0400
Received: from mail-eopbgr140047.outbound.protection.outlook.com ([40.107.14.47]:9026
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229924AbhDHB7m (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 21:59:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8rHY3LgRB/hsD3sMujF3EvO+FZWWrWByInomvhsYiyNteZtxaZggY+rUqht+CFzV2JqKfsZ+W4FUpYX396p4gmkHqsTDxulP/zMoBXiiVgZ4PplY+8LVD653qrWbzQbajipIVC9qOIHPatsBBkKeUhk/c7HOV0yziSXYbpWDLDFIE6mAGRLCnK199nSTf5wtLQpNb8m5z1UI2phgIomePJFYUP548+dJXI6SKQikQYXakyOZBNqbGjrSEVmEuYnk2hOB6fWZdAEhCE73svsFCRrGpZ1VTgBffqw4RcTtaO8TNpKzq9NWiXnZk7ptZNgBmwmxmhlsCvW4etIr3wU5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sttIUApDyABGOq7EwZCpeJzMHJnkpzX+IJHilenPjw4=;
 b=aZ/AkKkjOny+HmMv0EEAcorw0bWSY2DdY6vQ192ys63cSjPpOXQREAr1dz3MufqIa1CxzFwjC8xwz3Gge0kruHbnoRU3rhcIAoj3SwsnbA4EmH+0CJiQP7LkEzEsijc2IRKCMrwvelhXWzI74f4FvsuZjGRpFKd5fkzzq0qzPu4aIbtDyJx0CehLi4YSpo9vadBUYjE9lLr4254ZrWnOwuk4VjyEWIPq/jDKwKz3j/2yzTLZN2Hxz0LZQ7oDFCfLoiMHUe1UON1B9IfdKg/jG1ok+SGVx1nZUMqGoEzYV5PIn1zoYkOfMeY4Jdzc+2ZJzAX6evASTc2XiC/cudtWkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sttIUApDyABGOq7EwZCpeJzMHJnkpzX+IJHilenPjw4=;
 b=jtY1sRi6/iFegTSO52F6WfWSD5gkSUAKOuZsyYWu9dkldNYDD69VP0UhaCM/xvIh98RP8sP7n3jkGWTky9hZyOaC+RT6l84M30n2Yarw2rIwlbr05VNHFFba2InxhAkxxZgcw8aFtVKXTRWZJ+79jFbhySkUW5YqjYnpWge4wgg=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8140.eurprd04.prod.outlook.com (2603:10a6:10:249::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 01:59:29 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 01:59:29 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 1/4] remoteproc: imx_rproc: add missing of_node_put
Date:   Thu,  8 Apr 2021 09:44:46 +0800
Message-Id: <1617846289-13496-2-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617846289-13496-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617846289-13496-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0219.apcprd02.prod.outlook.com
 (2603:1096:201:20::31) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0219.apcprd02.prod.outlook.com (2603:1096:201:20::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 01:59:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f34d618-7c96-43f3-3497-08d8fa31f209
X-MS-TrafficTypeDiagnostic: DB9PR04MB8140:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8140E5D55C615432B1F8166CC9749@DB9PR04MB8140.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6fF/ysxigxwZrQbIP0lerb2WdGbWjfCpso/YqMCXqqGNUVgaq66P84Lj6jvy98o9k7lJpHkSEyIf+dBbPuLAETA9oXTbAIIIbC1D1WM74ABmf9QGehLBZM9/iayaZw4sCVKsTgfeLUrM7AV/X5VUyZe/tcEbwEf0BXAqG7Wq+UTu5Vnkv6i1m7GOrIIUTUZj0saDnE3kMEDiEdpikdG4j2LDPovgCGwzrw8UNOqUO7AQePIlFLuMidEmP8BPVMTFNw5vFNMoZo0BaCqBcGpGjzEo/7qqAEKN8ZzK3Mfu4AxmvbE6OvZGI2yMN5NZY0Y5Yl23tP7OhZm2HZugNw44NsBqfxZOj0ltoddw+mJKufrc0lneMhindPvU7rVe5Kn3/kdk4gLD5Vb/nqnZb94M6vlEmJyIX56KgdWLXFDY1INudROn332U4iwT702geZbkE04zvgZWygwHPUl6PNZLVUdgOoul/ctGBmi4E32ZhVOncPiCN3LHsQcT1jp0GA7+8Gcdndxn8D4xqF4Qt5U3PFeQNsF0KfWEPD8oxQyJ/7vw5mfBB4sJk3MhrJPmEl/F/W15C2Htfdp+DtmlNaC3GClSfkbGEHlCIZWthCdp+i6x5KffMFgpCB5Z0NmC+BuwzcqBWsw1GCC8b2JFmGdPNiHojOscXESckeqmE9qziz5bK3W58fdiFGzaxKvQoLuV/bi2miieCQwupduVOOYxbrMvKkTmtxALZXgN1nK4ZEo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(956004)(2616005)(4326008)(4744005)(8936002)(86362001)(6486002)(316002)(38350700001)(5660300002)(66946007)(52116002)(6666004)(8676002)(6506007)(9686003)(478600001)(26005)(7416002)(186003)(38100700001)(16526019)(6512007)(66476007)(66556008)(2906002)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uUHB0kIaan3Jd8g6Qbl+ePMNCVqDbJvx/y+CLh55A73kvfT0m1a77B0Ern/K?=
 =?us-ascii?Q?Dia5WCGhQ3CSJs9FjD+p+2nZ7x+CYC1xP3Xu9G3Gx80mOE5AB9UkE/OcRoZz?=
 =?us-ascii?Q?dQRTJzmfM6gbL2NyiVQEMYxOGwxtr+pICuKsV3/PAk/6hhAVNX+d7vUpNgq9?=
 =?us-ascii?Q?ry7zdEzppFxNtDhMEkhdbxY7b5BAj7uI2BcRp3qbxHtnJy0yCD55l2Bgj/A2?=
 =?us-ascii?Q?AZ5oo8Xol/OzQJZJhFZ3cg+ikHAFf4JEs1PX+9hJov7Hs37AWUVIErP8d9OF?=
 =?us-ascii?Q?vPXQ92fKRsR6sezZ4dmtatsCFG+6cmByHOaL+0aoNLObiQgw9Avq17tgo9ui?=
 =?us-ascii?Q?HVyc+jMtqcYwILhNCjWsK1R2PZmH/4TAgnUcMM8EYyKaTNZqYcQgtHbT5bG8?=
 =?us-ascii?Q?pX6HDV55hfw2LulV7vGxeJ37j45x5wJGHnXcpR/H+WqHOa7++bfL2PcJsfhl?=
 =?us-ascii?Q?9H9dCvWaRzJYYa2jGv6uyOrhHA3Z5SCyW+nj2CjcLkWd/pIMa7DbG4XqiMJO?=
 =?us-ascii?Q?9GurgVjhXoRDkVEyAzicz1XvAzqcCwhHuYEQbfOdWn7c4PzqHIruOgGOZmXx?=
 =?us-ascii?Q?XIoY4GkNYhRhvvyJ6PibV5HgHK5tbFjpfQQjZIjq2NUoNtylzD/RpbQ271BC?=
 =?us-ascii?Q?xkJ2bw24QGMdrlVAxeboYkxrgfQUfNZ4CQODmHyPs79xzxmPh2J3bpAmO/tY?=
 =?us-ascii?Q?YYTZiA9crTgg6GWSY5rKA+QtRWG2rIBTJ//BVEU5Ikdb/enIh7iBUIORuqHQ?=
 =?us-ascii?Q?mlWOdtSo+1fGgNPuGaOSzfk24HPpCiLaYDxH/Gyb2CeML4MGjMuP5QtsF+dt?=
 =?us-ascii?Q?sA7dUpfPHVQarmkz83SzOjN/V3qjtNv3zvFmOzTumI7ca5uCILA6IAjGqS0p?=
 =?us-ascii?Q?LmCsAMJ4ZQqEw2MrBolKJIJ+K2rK0XM3dEzdM4n3A6LSTgqTDQNQAf8218i/?=
 =?us-ascii?Q?JV+oLVWfj0hvkeireKEXiXHRkTBHZaTqQ7ZlxJKSxlkDntk5rwywnIMZbKrN?=
 =?us-ascii?Q?qUPSZPsFW8l63LJno7dARoVmw3cPasjoWd4oUTNx7e0HHr+ZUE0jaDbXtYAy?=
 =?us-ascii?Q?zvYeJYNfCuRblBJ6t3EO2TvYgYJ61VnGA4NPEZxmkMAkmcSSPZt4fZxbeGuO?=
 =?us-ascii?Q?ghGvBmcgLy3G5QLIN4hwKjra/rh+GON4TWGGGZgw5yd/ygcBa2ylbCRym/od?=
 =?us-ascii?Q?ETnCPhl7ZjNa2dmwRIAhLTrtPlHb/dBZffhnMIrU+D9fF+61tN4ZSg57arMt?=
 =?us-ascii?Q?anU+jG3uyVt7lGQ3aTAqDhKa+ujUouWiQ6J4gJtuDjJ1fTkWSfsCSwV8s9LQ?=
 =?us-ascii?Q?JAN6kMP+93134bFL9AO9DTHJze3fiKUGO+vtOQwDByDspw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f34d618-7c96-43f3-3497-08d8fa31f209
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 01:59:29.7594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L68APQjoYdMqYCeVf2ByaXlxnHfK3Z8xO1Uhcu3R5RgDYXFxsqBWvDPaBP+ofczT+R/oBYkMTq9xKmijOn4tHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8140
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

After of_parse_phandle, we need of_node_put to decrease the refcount
of the device_node.

Reported-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/imx_rproc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6d3207ccbaef..077413319f58 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -459,6 +459,8 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 			return err;
 		}
 
+		of_node_put(node);
+
 		if (b >= IMX7D_RPROC_MEM_MAX)
 			break;
 
-- 
2.30.0

