Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB45DC433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:35:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8EEA613FA
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Apr 2021 02:35:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234697AbhDUCga (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Apr 2021 22:36:30 -0400
Received: from mail-eopbgr150043.outbound.protection.outlook.com ([40.107.15.43]:10816
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234695AbhDUCg2 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Apr 2021 22:36:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cofdXt6vh0IBS1Uask39Ay00VzyzMziVU/YvNik+0uhMqv9g5GE741wxqFSlVFYz6rrnSHK55RVErkZ7ePV3k0zMCtStxmMxO/F4zlqRLRnal8RaDN1Ph/R7ctO71eS7ZRSDIbLyauiiIfg77F3iqPeTPD0douZxj2SD4y5Q3vPrEV+aD/04ojCUwp7wT3d4pRdacVDoeb2I8IvtBMVfAoE6leNH3Ju2hkEQc9LyhrYr+oD2vwTbRwAyqIWaeDPqHYE2182avCUBLzrqStrEfVQBYbXy8jJNt0Hl6GrhuXl5ZQ74GFi2wofrUF/NAYYyzGR4r1fYWvRzJoqO2OXh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCRqmt83T7B1ZPemzgBrJCr2tq6gUaG7vIPBCP5gj34=;
 b=YDlZaoeoPc65V5XwvJW2vBGwqZYtWPcOStTDGqB7eN0jZ6WyC8KM+KgwyaUKDKPEyq+RgGbWSQmAeP0In0QSgqJlTvboJ/ABuOfBG3058iN21BFfvpoNJM7XP7WrHQzQInuKPxugjVY6Zyl0KGOxOJCMrl4MVjLiIbvrvihMkzBilvrJTDErFybs8N4ghZiyaZgaVMKekKOVtYsIK6/edK7+uA13bnWw+9u3DHQ1wAfwKeVgde8nwC7PU3X87CYrpaU9w4BiQ8+CVxsm1Lqp+1hmCj2IXJk5I0mBenIaEPEK2tzxG0Eqt5SOoT5ktP1aPtg82f5HOnpnki/0g+eTFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCRqmt83T7B1ZPemzgBrJCr2tq6gUaG7vIPBCP5gj34=;
 b=bQvMu1WfpXhkojJrpYg3xZjNHkUTOJvDB6bRMTVm90hOrddjm418cH3INRkIAQfUvGMzjzHSW1NXMU+C3fYjFl1DE9/kRlUyKkGxspkW8cOqrhKrxFWRriA65GBdHlaTb1mh2SYiHM0DjxNOTTuYLvSlBFCwHW8+v3MrrS75CVA=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8313.eurprd04.prod.outlook.com (2603:10a6:10:241::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Wed, 21 Apr
 2021 02:35:54 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4042.020; Wed, 21 Apr 2021
 02:35:54 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V5 2/8] dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
Date:   Wed, 21 Apr 2021 10:20:16 +0800
Message-Id: <1618971622-30539-3-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
References: <1618971622-30539-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0204.apcprd02.prod.outlook.com
 (2603:1096:201:20::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0204.apcprd02.prod.outlook.com (2603:1096:201:20::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 02:35:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c58b42e6-73be-40cf-a323-08d9046e2fad
X-MS-TrafficTypeDiagnostic: DB9PR04MB8313:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB83136BA2597B5A712B20F450C9479@DB9PR04MB8313.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:843;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gV/w7k+7qLznrvWcjdn5V9g8xxYX939uf3f3c6YM1+qZj+p/huDoMHcvRDqoVzo6iAyiIE5F+aiHnvOt5dUIggPh37RwaL5g+laJRhuWdEIAnaxfkUM86CG+masgnYFrsXtcSDxX7cOAtfK8TAgLvP4/XNKoGZK5nBGzcUKd52fTsTgrRirxmy2KthN8GhuDT8Rg5ZVO1EOZgFj0Fx8fyXYYnY2Hv42G8qxY1l5bpw2BN5PVhljUvXLKxGPS06ChgIxdnL+57BCQeg4FyDj8JV3ZoXPn6yuUO2S3DXM9k9vViDGJOCtSMq/WCUWf2HsPpeXVjrS5qD+9/4/pnJDQbHoxL4m2PYw0L8E127W3XsDvvnGqjAVYdLWq74XTzzUBQWIl6D+s4kIxf/2su7enrNbOItKcNYWY3VslHNMhnESiegM+PS2VQfvW2j61YWOV/XrcuSad8UCVQ5q+WwM5MHFFDqVbfmS7RWvPAI5TIFwKmP/SJe4YnTjqwEjbIOlSQJooF3axAp9N72O3V/IP2BELTDODWdEvnskNJQCY3OAkrOvvDs8TczDzHQwxX713hJrCaiB7O8nCc6pINNm52BmPC6U70bqCG1XV3OQs7YpOfbUNRaS6I5agcpAlL/ucTVLYFI06LnNytsLgP2HGJUVjz4V/MI17Cm+VF/o4kIpj9Z6qqEF7LhJ0yXuOaT/I
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(38350700002)(26005)(186003)(38100700002)(66556008)(52116002)(5660300002)(956004)(4326008)(8676002)(66946007)(8936002)(316002)(86362001)(83380400001)(6666004)(66476007)(7416002)(6506007)(6512007)(2906002)(9686003)(478600001)(2616005)(16526019)(6486002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?lprX+wXcyVHDRXYxpoWA2dEy8QvrEm+m069kmhnnmWtfj+USS8gfFA0oHKGu?=
 =?us-ascii?Q?iUep8tOoWw7AmGc2A/qd9NL41eiAgW2lPkVMckElwFaha47Co54y3RjauYaW?=
 =?us-ascii?Q?c/dq+qO8K/l6Z+VxyIJrnwGoMWlkccBNyyFcTpRGTVC42JevLXq2KLqYrm6R?=
 =?us-ascii?Q?jn3aIKPcqfAV0tfJf2TCC3zxMKINhhbSp9EwikXTSFVkjCKbayhH2wbngxoe?=
 =?us-ascii?Q?lcCphMyFKDMSBrnr9RVJ8XfgwT39SBQnUVO49l8Qi8aCzAENgLFOWbMoDlHw?=
 =?us-ascii?Q?TEy2glIWZ6rgEC15wxkAskcrlI6ttAcrv0ImFMH6Ps2L8TPMspOu/iSF6Uj1?=
 =?us-ascii?Q?IrOIIhR1UJCgR4E2r+qC9Hpu4yeGo9FGHIWKQb1iN/TcJ09pehrq+fdL1QMy?=
 =?us-ascii?Q?e5QKsKKPExSnwxF3vaNdhvbla99/qQpIvrJx6nwJwAZShWEMCR9TTbtZaFDG?=
 =?us-ascii?Q?DN1q28EknuuPXjkP97X3bWmKlFWxpGHWYIR9xys4L5oNabG+6YK7x7xdMgSZ?=
 =?us-ascii?Q?R3R5fkKScmg/ME6yOPDmeTkEiIivF1xfmDuU+/iQV/h7sQZnvobN+hM0BXjI?=
 =?us-ascii?Q?/Q4XkB4yUwCWzAHMbju3U1gNHrtqqSvTnHx4nVfqNMQLK8LP9DE+3qhNn7AL?=
 =?us-ascii?Q?jqc8e1JxlEp0GUHcmRpFBkyj/ytnHsH7lniQZGyLYRa0+Eqa5hQvSXwCe1RX?=
 =?us-ascii?Q?fQx4M2TcvajDXtf1zJkt5/aXOCP3voeFLWiqTzsmsKlC+kSXEP3r5DDHF3Yq?=
 =?us-ascii?Q?WxN+lWK31ieoPJyG7CjxkOH5NggNnGgKN90Uaps/AiNmc7UI450uOIbpvsC0?=
 =?us-ascii?Q?/aNqkFUtQXc828yghhb7f2yxbLi91dxnpWoTX/hoyP1sE9qALH3ex3DBphlp?=
 =?us-ascii?Q?H9e1DT2NFg1my9gQs7hV/ByKithJGx7Nl4aFm5cwolJ3/SwAW8TWv0Hi6f5W?=
 =?us-ascii?Q?h7d3SnqMmB1ocZM8ADAonsC1KIBdS/S/8YbVfjQacGEo8m43W8lR3nRcocAy?=
 =?us-ascii?Q?vjV3lAXeRcBwYN/n/VhHe5As367jF2hsuHKDqgJC7rRXzeMYeflfWxFiA+1G?=
 =?us-ascii?Q?INsoghzKt8YqPnv1SlT8yByUTd8Qo/QAq54Wjrqnv7AGn1ipf3e5HDQFints?=
 =?us-ascii?Q?3HAm8cWG820/Pg4Afwj5Fw86NxM6Ig/ZCu68pmOubCzMEhehKcSAF3uz4mnU?=
 =?us-ascii?Q?pn0o00yqhiut7ALBObE+DQIBfTKQtUppbrgeEp/FAwr/EWDUcJXMrytz3YD8?=
 =?us-ascii?Q?hDKGSDRxjN8CaOBlAxVPjpIuaoC+7jt8jv6JwCc4GA1JYiuIG9IDXaXmNAxP?=
 =?us-ascii?Q?R/kTOAu2DvTWS6JQI7Y4zDl3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c58b42e6-73be-40cf-a323-08d9046e2fad
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 02:35:54.6586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6oXzMeeb4SHgGJqGts0xWppV2BYnzheCnaz9tLikylIOHCKGoY6Ba9WAmfYh/djJUw3Juup3iwFjQqFvuFivwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8313
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX7ULP compatible.

We use i.MX7ULP dual mode and in which case i.MX7ULP A7 core runs under
control of M4 core, M4 core starts by ROM and powers most services used
by A7 core, so A7 core has no power to start and stop M4 core. So
clocks and syscon are not required.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
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

