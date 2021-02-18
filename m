Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEB7C4332E
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FB6A64E4B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbhBRBih (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 20:38:37 -0500
Received: from mail-db8eur05on2047.outbound.protection.outlook.com ([40.107.20.47]:41185
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230019AbhBRBif (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 20:38:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuyftZe+2uauT32GTpxenzy/ETOwRnbuSGQ/22zui8KJb7LwMzVDZvJX+5NdTehha3x+KJE+yAaHJrD0xemWEGBFf4ZAnAsyokJ+q0VDNaudGnd4Az1kkfhJ+TT3QR7aL8vF85IB7nSQlWsstO2Pqyg47EqvpGb+X+nU6/VUTROYkhFqxmbkeArsKkkBlj6zKiMrCMAD1/7PnbqHaMHeMXmpuSNytgp5H7J9PW3FIyYyQStf0moVSLHwQlhHjmj8pGf7p9CggbkA4XR8kUeVo0LlcYx+HfmsDVkT02LciWhEjKcNXIT4llu14VMNItJNFo+NXDAB0MSnnFy5EdMLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylGtRczgykA3LROiqvT5P1IRIRg5xXAemZjMRiCZwqI=;
 b=cx5vOXraxJctV6RwfDqOo/x0yg6ygE98uSmLbg5HnGzO/TcRJ7RzDOuSJu45kALtMFxxmwlyqFhDKIxBzEwhq9TCHbdcNspIp2R7j08HUusMSzvwpmT16/+jzyqWBTDRg6CN9tUNhzBd+JF4t3TTKGC6XR53mf6Rdd3UaCL0Hl6Nucsy5ZagQQAX7duyE/ctCkKI0L49ST1uIBqlz2JuHRxw7/q6GzmqOnRSI2lD6kZcljpIYpibMl+KHOaDuO46Rg+U117p9kmATXYk+TjortQpTapet5+wLQjABakTERtI7B+poOoyYEMwom0nN/vOBhw/yQO8/g8AOodm2KFRpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylGtRczgykA3LROiqvT5P1IRIRg5xXAemZjMRiCZwqI=;
 b=FxLXxP988GRVxaH8U3LftDZISzA8utbUm5EJSgTkZuTtm9Pi5sWcRmRzJ9vMjBsJGM66zZfHwsPX2+B53LMKPuIERnJkay6o6e9zCieXvO3hvqxycU7Mt5F1DnKnvHsIdXENq6fFFsHj6u44TLJKV1s9Ud01AAV6fg3sYTUw3QU=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4092.eurprd04.prod.outlook.com (2603:10a6:5:27::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Thu, 18 Feb
 2021 01:37:45 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.043; Thu, 18 Feb 2021
 01:37:45 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V12 09/10] remoteproc: imx_rproc: ignore mapping vdev regions
Date:   Thu, 18 Feb 2021 09:24:59 +0800
Message-Id: <1613611500-12414-10-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by SG2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:3:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 01:37:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 64b8c733-b283-481b-e7e1-08d8d3adca23
X-MS-TrafficTypeDiagnostic: DB7PR04MB4092:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4092CBA9916A8D43E0DE707FC9859@DB7PR04MB4092.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uo0eMEwI7wwE+53koG2VRRUXmaJBCvgpz9yBf8uz7T3fLT+bn6SlHlt+WJW/CiMJmfJa+luEB41nEnYOUbwW/3UnIUX4tehBSk6umEBNnMb9Rm4i72lS3POnwHW0KT5MKj46UB5eTAl7bc9n4+XhrQbLDGQmq1S+Vz38/TwuV3QM+F1meXqhvQmVN2d+Bd+inQ9rcweJ+UGOhCfQO+HHBHzrHXYhizG4IcLfv+vPK+35GIgK4tL3eK+Ppqwe2rhl5fX/QJvLF8HKrHmQwedG06zKtStOiiGxJfJQVXz+s8ufUgkXIXVIi+/DjjhYDV2HkW+uQXycKT5MbJilBSJ1TSBBHLUInkF10ladpU+aK5JnFFE6YHrYds1iLc4wk4oZfrXcKe+o4yCfa/pcsPzG7XuXEcDePY2cVfwLIv3qBWrlBWdllcRSohXUhEvBlnaTY50LMGBQkDjC9xoyySwvyPhDiNHYMbZsLu9PKTi8FUCIsohZH0m/RdIkWtoWR/RikAerr/RWCUZ8TVWg0q/invvJ4lsKAX7lmxr8A2ZJhCzYRFHosMuUnu+kAtpVX2MZ2BS3RjUWQ03/CE5IFkZtnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(8936002)(2616005)(6486002)(4326008)(52116002)(956004)(8676002)(316002)(4744005)(6666004)(26005)(86362001)(6506007)(5660300002)(66556008)(186003)(6512007)(2906002)(7416002)(69590400012)(9686003)(66476007)(66946007)(478600001)(16526019);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xeXKBxeZ+jvPYUV8BG7e/HLw9CX56eavJNEfkP/3b1kVpLysd76AJf8PJBnj?=
 =?us-ascii?Q?vry1qhsdjVmcQqsKFPI5gNqJw4kFItSY6JnRGeNEAU8S6mjO4HDrIvuSbU3W?=
 =?us-ascii?Q?evcAsQbrBDuSkuYJvlX1m+OnNdxV47LSMH/gUpEYzjq4vniYiK2cpsLKtDqO?=
 =?us-ascii?Q?sulw6jGGsveJDG2irY9PJKA+k89F+96L8sfIl9pRs1pm6kM8AWdVj+t4/yGi?=
 =?us-ascii?Q?ClRyjrOXQYfrq8AQA8sOHcq2qStXyIDK3XR589im8YGyo3GT9eXTglY2uPrt?=
 =?us-ascii?Q?MWbQXtR80V+qM8ULXKxNI8UZVDFBRCKc1bCKcUur1Hew8rimWaPvBC4+zeHb?=
 =?us-ascii?Q?2M8c2zovMjCFcPswFYXXV4CcG1O9qcudyQIaaoUhFcpQbXOCLGrQQAIDDP4z?=
 =?us-ascii?Q?g4elJvRDMXK3hm7nYklWEKSrwSn17OJhY5A0psmGvey2zb+qetKQ4v+bFh1y?=
 =?us-ascii?Q?TGYxM7K8Z1nbrL1pBtasHX1SE/9Nb00B+WCKvHm4brKYSB73PdlUx3y1j+/B?=
 =?us-ascii?Q?HdEykT6Q0IYon6Wp4Dtk9lU1siAW+TKNA7r6uy9pZtuw9RXANUnhuv7NZW5x?=
 =?us-ascii?Q?2fqBNLxM35hpyRB0YktEaFRlxLtJFyuw7rZU7vZMsxCCCLPH+pYyrKkUQed+?=
 =?us-ascii?Q?PP6nWfsAIc0vfqotSK0nc0YnO/SQLmhO1T8BaHv9JdGe7jAmDOvb9r/hC9St?=
 =?us-ascii?Q?U5o0XKIP3prJtPGB4AperVuHYJurk51J2gyxgwhP21hz4NFPgtbFFljFivw5?=
 =?us-ascii?Q?AFtUgxjdAehh9T+n4EPtHQa/jaGyQ95IkSGwAXZNkydCwB0ArhXXl5H71lsf?=
 =?us-ascii?Q?rHZ2zErk506nzFEbilaWEeCiWYtkaIChE7Bs4fwWnWdddQIT/5MQUt4s8yf+?=
 =?us-ascii?Q?OOli9xeo+iHyVwAXzsNh0UR8oNKv2MmlgSUPwmYn+OgI/wC1BOuKqowTjDsQ?=
 =?us-ascii?Q?6dUfeFQ1/ccA7Kf4BZ0YO6+I04Ea3kQVdV9CvHgo1eyqAkLdvExVTtF5xFzw?=
 =?us-ascii?Q?Sl/bki8UNW1TeJjJwMGG5lFlps+dy7b9bAA44NLYqur2AgQ6nE+sGuzhm38k?=
 =?us-ascii?Q?6fBFRiGrF7lml0vAO7u2CMtOvMAQ4e3mpX+xsZoN573oOY8bFsI2wpfQrYXx?=
 =?us-ascii?Q?CqPRD9Q1/IVnz+8L1POjZYnUkqINRq/ApxGNs5vZ6UnfciyWB5SSv5yJiI49?=
 =?us-ascii?Q?GnRflUK0TipwD9B0vOxq0LIb6gBX0qcpHC+oRJxcYrGf6Gr8JtKMAnOUB3Sp?=
 =?us-ascii?Q?Iah7wR9Ph6eQdOZyd0Gu/b/j5+g+PFT0S3WAT7NFRfk2y7+xXha6vXOwtGEX?=
 =?us-ascii?Q?qt2T5x8s0nEJHvyETkIAAwMy?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b8c733-b283-481b-e7e1-08d8d3adca23
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 01:37:45.0477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNNTR4D2+qtbyGnPxeNwpgm93ubl5vI4pN67QotVNVv1mszU8/5X1CHWUYwIvzW030613s2QNyYIbQWwkUCSgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4092
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

