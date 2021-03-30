Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A68C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7397A61996
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbhC3J1n (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 05:27:43 -0400
Received: from mail-db8eur05on2055.outbound.protection.outlook.com ([40.107.20.55]:25433
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231438AbhC3J1O (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 05:27:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/Kl3o63g0WW1x5hiE5tqOvkqtTDNfoRZcdlSt/fC2nG97Gjo6T4ytBYP74acyeVRX+xkuYWnK47xXVn9sek08c9l1Bz6Jxd3gFUa9fr5nm6T9s+lWEThMp5zJDXNRQtHqVr5M9EMc+pp0R8NP5eK2imnL41Ghxk3haGBOmn/3LmQttl6xF3dLFKM0rE1G72K8YahEPbyMn86yEXaKhf4iNIdL/3GdClKyGqL1b576gMpgWuGFJMcpKSBW7VDkjuJcae5u7otuUX6/Kf4sbfV8w1FAZeSVcyARSioe0N4v+4/KxqYgxRFDEDu41gNH6ugSSBqlB1lKNQC53c5OVQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLRk2+Fgc0+feSPEK6WktzspNN7lNQkTCxfRir666qI=;
 b=UBsi/kOBCjMbd1iWjtLKOU1fiWC3U+i6YGIu97MFbZzFfEqDqbP4JZ+cW9r6q/drVGRMr2HPUboDsGDzKIaY2JsvMRORzGn18tMFwPxs5jwqZAZNmjrM1ZqE6GUilkmUdOWA60zSDyvu9ggGpmv+dU88c8TH2YhbgVzj69x4Q8Kl2Rwy6f9iu9YVE4QCG/PzD1/zDSfFSESUcQDvQyaP/Bjw+P/7QPoj37hdudXgMC8IFMTdQQY8LUe2hiVB3eF/9bs33ryo4aUTmq0+BlbEIqgjoiKGNSdgM2Pn7Iz506KOrgqg9Xc2biSnryIL8fKBt9EsyWynjrRIVVcQPPT5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLRk2+Fgc0+feSPEK6WktzspNN7lNQkTCxfRir666qI=;
 b=ItUiGhS4Ecais9ekYaVCmlUIMVCWpaTuqwBSR751SPH7GfEIJrAftbi+CuowwCJAMv2wm6Au+iXz5qBY+oTtDKrGi1UW/3VvgGnaAhHRNH0beBtNXLQKQgerSyoOdlw9lRXmDi2nSvM+7dDns5yEdHTokDOWTE1r/50A2CJW/XE=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7595.eurprd04.prod.outlook.com (2603:10a6:10:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 09:27:12 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 09:27:12 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 2/8] dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
Date:   Tue, 30 Mar 2021 17:12:48 +0800
Message-Id: <1617095574-6764-3-git-send-email-peng.fan@oss.nxp.com>
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
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4020.0 via Frontend Transport; Tue, 30 Mar 2021 09:27:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0ea81a05-64f2-4f33-8faa-08d8f35dff77
X-MS-TrafficTypeDiagnostic: DBBPR04MB7595:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB75957484A799BB8BF5E44C93C97D9@DBBPR04MB7595.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +G1rbUOHPOWxMpFNC1Ik6pN3anOG06as0TD+HmzpVe65ufuSvTrLyJsiXcSnCSxtPYfrOxbqC3nfX4jsOxeXbujpwkkrczWuB/5CDCuWvgXiZ4N+CEIE2g4OYivB16l3o2Y004yU15/4jWqoLdBKnEofX7LO6Vl7s6XSQaQueo6F5P2LMciZtjzzFBDHbEocvv3xA6kH/tVLUrMsWDr632G/76ANFx6rhvs8+Nl6JB1q0d0WegjakgImX4rGSSfJDbUcs5908dcH/GX8NUeHMFTWHJeTAHRzXe12yuTPJX+7laAetybqV03gCXmE54xq62/Whe6SFl5d+L1KRN4LuRPrcp4VilWKa5UopArqlfwk71vowB1J+g6Y1SYLlmTlJ0ModkRh69N79xR5D+BgCLHl7gYVj+SJmoOFMbD8V11yqHxu4wRk1TtE5yyroChVdzzmXqq1HTV68jCwHUkKwHPwjRfq1aKiQiCIlIT2eMTbQ+72aptHQmh7zdBGLKjmHPSsPDW9Mvz+xjSZ4h7kD6F8KGThY/pZtDbe2S6FgAl7XGZE112QczbBZYCthSsFDilbQCxfCu8PT9Ya5W7T9vyr5y2EItA5DbblzpRPwcrL1VM72H6SyLNw13iJu40ZY6xT/+5rwYG9lJha4LUEe/bO6jf/i93HCbaNhbTelBUSNso6l4m6Gfz+Nc1aQjxA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(9686003)(66556008)(2616005)(86362001)(6666004)(6486002)(52116002)(956004)(8936002)(66476007)(38100700001)(26005)(4326008)(6506007)(186003)(83380400001)(16526019)(478600001)(7416002)(6512007)(2906002)(69590400012)(5660300002)(316002)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xUsBPlMuUEgk000Iji3P7WG/ni8MNP6oPtp/ocxwJhUw1XnpKj/BhS4HYyty?=
 =?us-ascii?Q?wXVuQRQ+oZ37IzFnwx7j1n9BmGwMyULflwWDGr29SM8Ry5POH+uuGe1yecR0?=
 =?us-ascii?Q?+fnHjI14NqkIQb1SrRuz81S+xIS2VyRnLXQ+ovJexbUgtOxJYviEIkvw+AHC?=
 =?us-ascii?Q?TCDlhsC/yyeDdcMLyar78/KO+1ojzmf1hGOPDicwNXyaowa+OmvCiwAQm2an?=
 =?us-ascii?Q?4g/+gE/GjGLeDjdOQIjozovscYYZU93xD30HT/MkCZcnrneHgvZBlm6LP0aB?=
 =?us-ascii?Q?ONrnwNggJcPL/3UO04FqYiXIjxZVRl+Ix93IEY/Uu+/hi6GXw996jjjDnU3W?=
 =?us-ascii?Q?5FYIip3CxU+9D91nT28myRCeN4k0nnilMjSHEBPnAm4tpnN3NbyZJTLU9rTy?=
 =?us-ascii?Q?Al1NFzO4Zlg1UxI/R49KCNWNVCawB56yDsLjD8Al2J1kKvpHPe15P+x1yKBG?=
 =?us-ascii?Q?1ycbi3czBvpReo95Z/X4esq+LbNoFOJdNHAq4WeU4GUb3bjbS+gF4QDDVbF9?=
 =?us-ascii?Q?9PHevxAOeM0kuZMc9cxc+3DDISpE+DsilZj/H78D3MkszBlNACUXvticYHaY?=
 =?us-ascii?Q?yP3GsuDI8o10ZYgRZMQ1TgjkZK1XXTKjaH/3z1cBTF4IhL+I20ksUuJmzZ3L?=
 =?us-ascii?Q?BWziVdrr2InUMsdfs7NUs03srv8T/h9r7rzt3aTdl30yZteZb37/WT+vKQL1?=
 =?us-ascii?Q?p0lLtWYNRl/Ciy+gGg3/fC7DTOTHXD8tkF12UOKm18oyZoN8Bq00NICqmA/a?=
 =?us-ascii?Q?SBGDn7Hij+eZv+kfctxFD5fJST+g3tqUjeQscNjJVNvUvjlaVw6r/gNdx5gD?=
 =?us-ascii?Q?Xjo86hcF1Qp+O5Glri8suPqu/MlYyJuP+YvCua9HHKdp4BtaIeDdBWmoD/M1?=
 =?us-ascii?Q?M43M5+IFa0OHkOqU2qTr/Y/aKT4OhXtQGzuBuWxOT5bUcWtBaMF9BH+YVMp3?=
 =?us-ascii?Q?8hxy9Ln7LYiD8XwlU8jdUHLDPjfD85qT+SkdBkSx/iU5VOe41TRkKtkd3mLR?=
 =?us-ascii?Q?eBmf+ZcTIpDmU3CE21jeq+f+eMaZPCurfRwV7iccIuPC0TTSMCHucQxTi/5H?=
 =?us-ascii?Q?kusm3zryWSpco8ZWCGchYkQrEuTffwliNcFwEGnetrceDtrVn6CO9pKBYiHy?=
 =?us-ascii?Q?pTSu5J6c7NQyjnSttIN7FA6crZ4zgJu4IfEVqr3zWsLPYVuBXCNw2bQnc4V5?=
 =?us-ascii?Q?1ZXxXPj/IsZ96XNK3Or3X7qwroazfYTIXhhSkKlnjYuTJrWxSyd/Y0j1WBNP?=
 =?us-ascii?Q?IbG9NdxTA9S+HFD4MABnC71wssWgux0LuZWqClJI9UsjIA9PsRkcKU4Qkfjp?=
 =?us-ascii?Q?1c4ylk6SNmAm3w0rO5am3UfvlBQ4X3DClN8hohfI0H+Q0g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea81a05-64f2-4f33-8faa-08d8f35dff77
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 09:27:12.0027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFhAI1lIuuubaRA3uNGBO06RhkEqux4+nsmqFYj7+6YaixI92rrAw5Jp4v1v/bADm5n61Wnu1aVLxIAI5FsrSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7595
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX7ULP compatible.

We use i.MX7ULP dual mode and in which case i.MX7ULP A7 core runs under
control of M4 core, M4 core starts by ROM and powers most serivces used
by A7 core, so A7 core has no power to start and stop M4 core. So
clocks and syscon are not required.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml          | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index b13bf8d70488..58bc2a23f97b 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -18,6 +18,7 @@ properties:
       - fsl,imx8mq-cm4
       - fsl,imx8mm-cm4
       - fsl,imx7d-cm4
+      - fsl,imx7ulp-cm4
       - fsl,imx6sx-cm4
 
   clocks:
@@ -57,8 +58,6 @@ properties:
 
 required:
   - compatible
-  - clocks
-  - syscon
 
 additionalProperties: false
 
-- 
2.30.0

