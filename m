Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B2DC433E0
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5602B61874
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbhC3J1n (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 05:27:43 -0400
Received: from mail-eopbgr50068.outbound.protection.outlook.com ([40.107.5.68]:8865
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231773AbhC3J1K (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 05:27:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmNSFYJJ6e3+9RDgw7awAl6J7NtPCRyJin3Y1sO26XFJRo1joPlOQKVc57hP95aE3w2yj+o+3QgUA5k+Ck/1YmHJtr3PMw0EglZHSlhIPwh7y3wdapmmaWrQT9sP7JxDbHIbb8xksEZBX15SQRNHO2quXj2lIHUn9gPoF6cZrHuRUtQv6u+eGSvIGYigA0vKUvczt04ULKHN0REDbsTOvruhzEjuNbrrnNjYGerEb1/UqgcKg8wad5cw9/U16+6CKtnN84jp9pRJ/UjGYTxHu3wsJfd9GH5uxPh7dCZiEAZ/dkKRSYiJ1Vf51iUMrWIGa6Mau2xTitBi1h1AOLwOsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDG0D6zfYNJqA/PXlVEbpx8jCA2iN46laQRJEh+SubE=;
 b=PSecAQGnTKwUELPdvAFuqxjEDmeC2l41tWRhFicTwr7yjIJstI958ruNymp48IXf0lAC/MqUjQkwiI6T7l0dypyeavE223fiwPiGQGYzVyu3Irfi/S1Abv60pY85Il0FekNOl3/N7GhaRUzEjHSfqWoJwg0u5pzZSh9ADTHeuCoOaS20oFvJBeTaynnBSULsQvZtQetseXFOxT721dwXBxM8GoP4gTzElwkOgxeGqU/c0tLueJlUkHa2PwQZ5nzPkMxmrv3vv6QMTv29BR+DX77hl34rgPHOiImaqgooVZzMEoURWJr1pC+GAe2HusvzpWR/dCf4UlOpPN8iBhGlWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDG0D6zfYNJqA/PXlVEbpx8jCA2iN46laQRJEh+SubE=;
 b=I1pNX1BNYP/fv/8jZC7SzXH/2vvN6iKyg+2L5H55yeQp62koTs1JAWFwxyelD0d9zZgKwAn0Ogfrj9Y+3Jdnv5fFtedQUnSjvN8XIIqRvnLQim64cPf0tJ6wt+9fjrauD/ns9lnve/X55Ug3e23keEt8QF4qysHa2jXxL3F8R4g=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7595.eurprd04.prod.outlook.com (2603:10a6:10:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 09:27:07 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 09:27:07 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 1/8] dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
Date:   Tue, 30 Mar 2021 17:12:47 +0800
Message-Id: <1617095574-6764-2-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::21) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4020.0 via Frontend Transport; Tue, 30 Mar 2021 09:27:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 04f410b7-da3c-4f66-7c3b-08d8f35dfcb4
X-MS-TrafficTypeDiagnostic: DBBPR04MB7595:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB75952AD097B7526A6FB001B2C97D9@DBBPR04MB7595.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SRUuvWWkl2W522T8hOq+j1GiIJyvYMZu/+qc/s/BQMImLXGqaQwdqa17hHrU1+MXLb3v7oPn1tBE6aKfKE5BSml/SYUy6uo27b/o/WIySw0tNX1Q4z1bUY7cHYxS5R7MwBoftTpTtgpn1WuMo8GRDz98AmFs/O5DVak71BdJUysoEyeCqbdWP+5yZ/nyUc2arxxr43O32AGlNHZV80b5nGxaSI1vxyodgiwLdkcAcCZuT1313i31hZ+eToS6Nh3a9XvlEEznXmu5FKB5/BXfWHg783NDdJGSqjwuMaxhCzJI8OcS4GkSalIaNV6sAHs+/3/nh9C2oTIYSPHancWAXiJ9UfqzfGXtJGRSxt2Llgsuc1Ue/GRsS9VprcWGwgNcBGRBopO/5e2Yr2DxJK/RQA+WkcUqxpZDZoYIf/Ruc2r9mVnib5fQ488a8sOvhiLwlQvLODyfchges8iYECHNje2+hkd90Cf30KM0z/8msv/jgiO5+0GTkqzvomHOH9mI3zfh6kCDk5+ccSsAHH0e5epDjAHr6nEgN8tlO3QC2R6BEPE36SurN9fXIsRfUcOZxSlnIg9UF6jzy4dEbSmsWlsHKQIA13zwnbSo34viQpXNZdjcH3EZevtInvYPutu+0VgyV+Ef9GWyPEei/rRMkG6n5RETp413VWXRAK0RtI62WG/KwHjGs4VjEAa4dzmq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(9686003)(66556008)(4744005)(2616005)(86362001)(6666004)(6486002)(52116002)(956004)(8936002)(66476007)(38100700001)(26005)(4326008)(6506007)(186003)(83380400001)(16526019)(478600001)(7416002)(6512007)(2906002)(69590400012)(5660300002)(316002)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BifXGDV28qU6NOEi9liNBYRvUBRF8k4b4GQx+D41+Uac1+79D5UyCbvQHQud?=
 =?us-ascii?Q?i8YJEId29ukJE8l1ALfGjGils1PNxnGuWA+kAjzyibrvv02rZEhrfoZNQ6cp?=
 =?us-ascii?Q?9aJC7R04iOeEe2OqzQmUHFCPgGAzNnrucibOskRTXZCWch2n6svI/+suqoQU?=
 =?us-ascii?Q?4HfePjIYRVLFTdmVyqTqBhur3Fnw89N8Qm8Oo0wsF2Pxw+GfFLi6knfyuLZr?=
 =?us-ascii?Q?Tnx8jrGUp9gXHrGVbnjp2Iq2nHW/hrsicRV8JDhPVfULypwpan/dt0eB5MeC?=
 =?us-ascii?Q?pYOTyqgPUEtYLqCxkImeR7RWnn/kYE1l64RO0z5XFPvK4/SZJCDS+Y/+IBhq?=
 =?us-ascii?Q?boOoDB5F3JQ1bo3iHI/L5CzCCChkG6cRV08OY9molkmzho1I75E+gyWe12L1?=
 =?us-ascii?Q?twuHM7+WMEqrCQjByiS1HLCW4tXEOADgFuokhot4is0f1/ThjY39a4BNqDyw?=
 =?us-ascii?Q?+0QWrSAz/k+UA3aKpS+Ta5UKq/sLdmHG5mGe2aaX828Vi5KOct4H+OprSXTg?=
 =?us-ascii?Q?hxRoiRHr/9nOHKJ/00IRSBVZQPUu04qfep//Dnr6qgOMmTS9ywmdHPc1Aira?=
 =?us-ascii?Q?elruuyQ3AOmQc6fZugRZGrbNPPgsOnfUMVb7NJrvWpfRtRh92h5VjQhG4nFD?=
 =?us-ascii?Q?udlQBNWEPMpg3B9lcK9wDw8a9GssL5KhO6v4ZvuyAnz57o/CK2T9k5S+uQES?=
 =?us-ascii?Q?T6v0Vda4KdzuMgYXHMQb/13Pzx9qPpRPuOXoIb9X9nHQbKyCh4Q/TyG7cddH?=
 =?us-ascii?Q?kWhFnrzPOQTKyAbt/Dw9sKScCOQ4855Zdwvybd0P4yPfNK0HSurS89Ne9dvA?=
 =?us-ascii?Q?dTmEltrc4Dt6RD/31eX37D2uXU/HSWa63te1Bx8u7Pjsc4hI5XTl/d2u2i9+?=
 =?us-ascii?Q?2AodeRv75uEgXLEWq864lO3ZtTNjXLUpdnOM9hHzjawY84HjFmbs7LwDA/bZ?=
 =?us-ascii?Q?uCOXxCG/luUTbcLoO1PYF8lqUljOR5N+KPeabfLE+CuGojVxA0+jEFB/oBsH?=
 =?us-ascii?Q?QIFWHnVTqtM4NNDHln2ncWOni/jUZ8ztUgzj+5RwBTKurjCB8h6gqDhK4O3K?=
 =?us-ascii?Q?PZ5PlvG2eLzrMuZScSbmYz/hu9+9+Xkk46DzXxjSAWKe/ZkSzwzJDhTFUCN6?=
 =?us-ascii?Q?YUttthe46SA6bMhpvWx0yZJnjDxVlACtAGPhi1oRh9DfUHrz9Ds0VtLQXYJB?=
 =?us-ascii?Q?uXF3L3O1cxSJGkt6dSmxj7o/qM2fNNwBJrKhgX5y+iCWXk7/hEQ5HU17vMxK?=
 =?us-ascii?Q?FvzRk61KWOdKuPVjqNrMRFqvv/s29LrXqxo5jg4kxt14dbo/Nyi1DFAMXwXT?=
 =?us-ascii?Q?1IWQYenDnp9rNAj9YsBt39aaeixe/pk8UCd3jb8kAbBJGw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04f410b7-da3c-4f66-7c3b-08d8f35dfcb4
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 09:27:07.4168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yg85wzbegRDYq7QYbGvuM5QT/x2xmviTczE06+/8B8yTUkffNacFEsjJrp4UkUnyG3Q2SDsyAsH5u/OYHGSFew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7595
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add an optional property "fsl,auto-boot" to indicate remote processor
auto boot.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 208a628f8d6c..b13bf8d70488 100644
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
2.30.0

