Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C65C433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:42:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6ABA9611F1
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:42:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231482AbhDONnS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Apr 2021 09:43:18 -0400
Received: from mail-vi1eur05on2079.outbound.protection.outlook.com ([40.107.21.79]:14912
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233098AbhDONnO (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Apr 2021 09:43:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6kW9cjRp6BMIIZjCxnE/ATMMArtkYnBzvuoJHfICPJzt2rmN1NApLRQ49DomCN1sk8POzIcCMfYJJG7u+6ryq8B6KsxdEYG/RVfsj345FdXVth5Yl6Qb6yovZrnXGa5Ijh52bKiws5beplIHQHY8xdtRKPIvjaUmcDg3pLahTCF0zTiMMnQ4xeoUpyZKbta4K8EAFOk0tuXQLoZF7c6VOlxyDUc0dd3ldclaQd0fNeN3nN5CbjzrOyOxyhF2ULdygdfUN2e8WvvgQ10o+ljtMqcW2mktTp/W3avlxtASEbFl4hhBOXw7IGfnsUYjTL2njqZsbloTpGv7TrlLaCvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dReEWMdehdCpVzfrIa1Lb3yOHoY2w7FEariL+JsEGCo=;
 b=UZVJERBFKlrYnUZMaSToy/f9WssPPOmhrL7PhqNFQ2cOQvt1uXRdEYmtzxujBoxhK45RQh8l442f84H5OHWoY1+HvylFG4cPopp4jhEF5AnhhtKYjCkBkw8XfLKXw9fuFBv5fH0QuIn9UBWtSUanDscMHBq1zRApxGUh3JitTvb224rGueRvVoXicur0Aen9OihoRht3LE9rec7s69uxR/Mt6l/x3mp+whz6LmwG0XeMwmfajXd4LsB4g/ghP9rMtHUiqWaO9/Unn9KtW6F8rMpLRfRNlJ4b7oDHmmtF9e+Hv1qxeblwoD5JePDYd3QHy+Cw8Gww4S6/anWpfx69lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dReEWMdehdCpVzfrIa1Lb3yOHoY2w7FEariL+JsEGCo=;
 b=UnVlvu+KX5u4aZ/C7huEsqze37KkB53xDrdo9I2ObE+l+e0/mpkvKRc2jbZySgvaiwaXOQK72M/oS2KJR4A2qpIAYPXNlVmRPAFfh0YlU1FPPsUPd6g8ENfKHys0r1sIxxgEv7Y+k3rdzKgvOYjS77vODryvUQ5paNVofAyAPxA=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7817.eurprd04.prod.outlook.com (2603:10a6:10:1ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 15 Apr
 2021 13:42:49 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.037; Thu, 15 Apr
 2021 13:42:49 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 1/8] dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
Date:   Thu, 15 Apr 2021 21:27:34 +0800
Message-Id: <1618493261-32606-2-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
References: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:202:16::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0132.apcprd02.prod.outlook.com (2603:1096:202:16::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 13:42:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0870842-b06b-4fb9-9d2b-08d900145bf7
X-MS-TrafficTypeDiagnostic: DBBPR04MB7817:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB78179D9EFF8DC44F075A0062C94D9@DBBPR04MB7817.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mf4zre2zi71RpzfK7jjmUGdGQcGKwHhyZtkozkH/LYaI/4LP0O2BQMhZR8BX0UhPDi5CzQaFLXpCkfuiljIeII2MR0a9P43J0D9YMT4ge7GYp+F/SAoV6f02k9zk2tRMiGPh78DE5rtT9YwEg+i6HBXmMggdcx5AsBpGCx6DBgCadUvA7e2LQ31m82xcohVNqdMs9fU6RxdCUdqns+cculg+hFBbJUJxvH+WYGAFuo1Ra09XW7pdBZBWBndQFiJaFqGAsVZOEQpCRANTalUlYa2fc8CsvT39VGlUx2VzEJwNhVgyKXURKSHpWpo4h5XfsW+AyRkDPCfRwwsMvJylW07Qfz3TOR6niXOqOJO4RypZfQegwuEsCPmOcpY5nd6EfKaYg3xEQ+KDb2261ScUmun4zHms1LOIdzmFXChCsL6YpEgclvQAnVD9qrgTBUPirMUEgTPTpzFKEnqnsu8vpSC++FA9BSpKcuuhCd7HZMdMCFz3jFEO/88M7PNxxjmU3zmCJiMTq+RPEiyeJXVMNP4RfMCLdQ4Go1G0qZEOtdMtbwAmuDTQvdr0p7UMUxJRVOhyf1CP09Pdlfo3B62qNgsEKSGvFM7xK85HtGYmumWKQlvSxXgpHx62kbOmKX/wqeU1jLxb/D5JU1YD9cHfGGtybZIhJo8vtJJN6XAz/WqYF2v+fVVjcVoewMxq2Imm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(26005)(478600001)(6666004)(8936002)(4744005)(186003)(5660300002)(4326008)(8676002)(66476007)(6506007)(86362001)(83380400001)(2906002)(66946007)(38350700002)(316002)(52116002)(16526019)(956004)(38100700002)(9686003)(69590400012)(6512007)(6486002)(66556008)(2616005)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9CMwFXhxxBYBVNu5dSU0nmV/5D3ObRjz0DjWhGCiq8Dy54oVDRw0tmaj4V1H?=
 =?us-ascii?Q?xgmG+XwgomZnFyXSeWv5Sm6xcGDBBLd+7AKhcZs2oH57KCd3B6SEOGDnFL1v?=
 =?us-ascii?Q?aOmOHA8lNXFqFGfhPbaT5xf2GWMyN26zrTEeKub71q00U/I6zsdJ85qTX5Mx?=
 =?us-ascii?Q?jBm8rFXi3BR5zZfdwVNkk6jrb7IqjgIUNJ/DifyLs4leP+9VLK3Z30IJDsN5?=
 =?us-ascii?Q?UfP0ipHcRpK9tzAs9VgyF5cmh1u+DVl/kb4N2KEqznLIJxi7Idy13k1ZSxIr?=
 =?us-ascii?Q?gyn6hdTQ0vpAG3hPbWqzb40mIfk69960uS1NVV37tlQqo5Em0hEQNFpao0RS?=
 =?us-ascii?Q?RnghtoF1As1QSzRo4y1uv7s2WZrPxKIY1tsNI+ICxIHyWLbx3dgXn1Cv5vF2?=
 =?us-ascii?Q?8MW1DU2MWRbSBBbFdsNILEaOmYLwmInm6pa4Ehc5kmwH/4QyTv3upBY3irAF?=
 =?us-ascii?Q?laITtK+PbcbxcIUg1t8HFv7vRDFGLcLflaYBajm9jL0uAShGqDnKdz07bZRA?=
 =?us-ascii?Q?rWJ+VVqQza2WaPP/PrrREND6kbUVjIgfCHkO18P81hU3/L/RkvZKcyBZtOQr?=
 =?us-ascii?Q?5TRJ9YuKZ+oys+pKybNxJhyrJ3A8quG/gzesj8aJ6m4dMMv89IYgORrg+lwz?=
 =?us-ascii?Q?ciHa2bk3hugIy1kfuhZdG5oWqLGVcb3XArpqhUNK7+OxxUISNy51JwFd7Pma?=
 =?us-ascii?Q?zYrgZpGnhYz9YdrIGhp6ZDTt9eSYyuhrzgshc6/VU59KxDMUpw6zS20XQ/u5?=
 =?us-ascii?Q?0kBO2+Sl94yyoBK5eyZB3UuT+7DqGI1YyMZEqqXXxYSZbvTUaw9+0FSAo7dp?=
 =?us-ascii?Q?q2jBjaMw8sL0wsjr+pLiZR+oQc5IzuNShrEJLmBv2gPc52xyzBDFuE1fnXdE?=
 =?us-ascii?Q?j8jeDBI7tQhkXjfI54nMDfw9yh/XxdsEzvzBu+jpR7iWyIAaiovkzL8I2Y80?=
 =?us-ascii?Q?sAQd/Upr/d0LmxlgvVBtKodxaqqPbHRMcRWwnkKz3KQ1louc9Ajy7C0ji7ez?=
 =?us-ascii?Q?ytmTxZrOGQbJw91L/00XqxtO3+ZQzeJmU9zPtZii1uzXkLrXb4hqXkdBfzD6?=
 =?us-ascii?Q?FzL7WkHBoMTMYTLkibZwNOGfRG00gJPSjYKideB9Y3+dp4FMMWvWSFGR99W2?=
 =?us-ascii?Q?vcVZvmJuiu6O/n1RZ0i7iiuvxLqsK4Z4QIXtlxXp3Jhxd1pk995xSLhet5Pq?=
 =?us-ascii?Q?ujMTWVNUmUq/RYrKfxhrI0peqssFbRcGdLFF7yot7QduFtY4/EvhT7pXFsHy?=
 =?us-ascii?Q?wIlyjDcpy2xTVOq+gKJUCCkmijrzoWRF4PXbqao2Q7BAVdjKS9i9haGc9tdg?=
 =?us-ascii?Q?zmXm9pFQe76jrKA4fUP0Gqli?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0870842-b06b-4fb9-9d2b-08d900145bf7
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 13:42:49.7153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FD3wL55QmgKy9pgxM9FRTwEKjL4Wn5eVHVenyW2xlPs92KmZKBJNPAB92WZQaha/rIZQHdvp3RwK5ORiT5yVDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7817
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add an optional property "fsl,auto-boot" to indicate remote processor
auto boot.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 208a628..b13bf8d 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -49,6 +49,12 @@ properties:
     minItems: 1
     maxItems: 32
 
+  fsl,auto-boot:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Indicate whether need to load the default firmware and start the remote
+      processor automatically.
+
 required:
   - compatible
   - clocks
-- 
2.7.4

