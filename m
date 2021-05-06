Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B054EC433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EF8A613E4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  6 May 2021 04:25:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhEFE0B (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 6 May 2021 00:26:01 -0400
Received: from mail-eopbgr80052.outbound.protection.outlook.com ([40.107.8.52]:5035
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231407AbhEFEZ4 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 6 May 2021 00:25:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAWI0l9N1Dq1ZKQn56ephXihjHAMxeEJ0Ksx3XkCyBIckr/D2InR39Em/xUaYQ1b7JKF59Cr9IjHkawQXRplPlBRiClIYiUU3QHutwDAkROhb2qJd4HdsZ9ohpnqPQS6j4s6pNIqY1sAGeAoRhF8ZzlPlSxzeUgyrmJeXgAM7VyUkjuGRB5Q9XqXZL6v5bZhmfuh8h6Z9JyRRMzYwrOJfymfvR4LlHELPXBY8tsWMSoSk4WrD/5ySheSZQvkeOk7f0KeRB4Flphw2LvIZv5o/czLM12xqa3Swmr/jLCmwaOEPc+cfUc4j9oO94SnGS8K0hMs8VF+72zHoG8P//95oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwXlKefmrLgWHF+p/zEssQIWV36skW01SSIYJ4rTNLE=;
 b=SWtvdC2BHKvhDqcJAtBA23ytJx0ykH6aKa36DIa6YZ3oNIYKEsmdRG9CgScK+V7kX9MHI5uGV3zub+36HTkhPaErshs66Z8lb6HjKkp7Qa4dF2uiw0IrVdJEENOPX2FTcxpdBaItCLm1w5qZHCHVM19Yie1pNWYJRGg0D/e0Zol4XuNdomlPKtqKqZedMhHUgidt4oSD5QUS2yvY6xA5xpPnG6kIj12GeRpEUIPa9cQdaanbEhtWd0rFKr66aFU9D2cOg2QFtRvpGYU20HiL6/eHKacDhycY7Z4QktnD0E/Clp+8ZGA7biKFu7MgD601S/m6+03pM0kzl2KXDW2Hpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwXlKefmrLgWHF+p/zEssQIWV36skW01SSIYJ4rTNLE=;
 b=UR8DeYT65Bz4W/PRmItSt4tYl17PvHb8DEBMTQEuncSearN1+nqgMYl8of5HP6b0ELZpd6U3QjeQBu7541paCkDdERWDvKv9ASTtGwhVoTbWkdf+/rQogOKhpfidQ9GtLmAWNUHqY0wsmdHWu3ZMQYuLIoq4YuLipmfw6TByrXk=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4940.eurprd04.prod.outlook.com (2603:10a6:10:22::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 04:24:57 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::45b9:c993:87ec:9a64%8]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 04:24:57 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 1/8] dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
Date:   Thu,  6 May 2021 12:08:36 +0800
Message-Id: <1620274123-1461-2-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
References: <1620274123-1461-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:54::19) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0055.apcprd02.prod.outlook.com (2603:1096:4:54::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 04:24:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66705158-951d-4dd6-0840-08d91046e773
X-MS-TrafficTypeDiagnostic: DB7PR04MB4940:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4940D787EB7056A5B198C103C9589@DB7PR04MB4940.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mtHdB/vhfWPT8sbWkcIzSBTuALsmc8/OHk+Ac1GuDSlQ01D7nGtstWFvOY91wddanl2Y0wfcRKuDtsxudqoVKLRrfXnFa5SoDx9zymi6FSLDGjX/lYbLMmlzxumGALlINO1sCQefHNjdxMpTfdE6As9hcZPVKYAylkhGtbe3aKIsLchDBDWhN6WDgp2rtrBZ0bLd8K+4xR73WlwRIHWEGS2Y+HVee8UkwZbD1UGE4XZjN1TvbzmSGkCbFRrctVCQ0jf8Uvs5aWTcGF/VWJOdOHGkPosYlHszEXF7+T4xNkauLud6wwe8Wuv6jUiS1uE5Rgcf9I0Pi/ZS7RDgjTxyrWJc9brpr0aVvZZzwjodIj9zNMx7l3ArkrhTT6qWRB1T1yH/Vg89XVwAno+FN2nCINr+OAejnCcDf9fNynvoj2aYGwB8KxNCX7Ajrs1YWQAZEiRW3lMRI+RX4U5UF1x+pYbCZCk5YJVIsyOP4irkT/plKWeeevCF0DOc4y3QMNYNeesrt4GjUINxQ9SCIgJLVAvduHcJF0MqPiD/RgNemnJhGVaGn+SH84fRp98ifHLAPfnA5xTIDSJ8hIq1Sz0x/2bQEXCUSBMK6yy1HyeYQhX038pYFlEVpzbxpKhh0OTm2Yrk1cvtaCj2kIS9paO2K2ITXCbWGht2grPo15VaLfs2s2Gv2PspuSPm4zCXHdb0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39850400004)(6666004)(4744005)(38100700002)(38350700002)(6486002)(7416002)(66556008)(16526019)(316002)(478600001)(9686003)(2616005)(83380400001)(2906002)(186003)(8936002)(26005)(52116002)(66946007)(6512007)(5660300002)(8676002)(6506007)(956004)(66476007)(4326008)(86362001)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hW6rE0HTcUlp6J2xK8uEBifkat2lo0CMVedkJM/aY3HX4KDykJMAovfiQBGI?=
 =?us-ascii?Q?/+geUjNTqcqwN2q5nT6BN2k8sbFmC6wDisS9YIZ53eIhmxpIjzHzYAN36tBe?=
 =?us-ascii?Q?o6MOX9mPAuqKeMFVLdEyBRXPaC5Mz9ieUGeGVTxQIN6mh1XqGE7dNkDVmedX?=
 =?us-ascii?Q?SUqazzwjbsfkCMRNOcWh+Oen22VdDy/e/Kk1j3R+e9ZIaKJVL9G2Bmb0SNhC?=
 =?us-ascii?Q?0ibz4z55Fk95n+Du5SQHBxxAbmE4UgwscSabfErpmKYtH20roL0PY6JfVdyS?=
 =?us-ascii?Q?nTXKAMSMiIsVc9V6Al6dcfux094wzdnhKM/vElZVFq1nrl0zT/jEcyC+n3li?=
 =?us-ascii?Q?H2UpV3JuZ1Pm1q0eGL970+n62rzCsMBgyLMUQTsKx7e8K+j+69PuG9nKa223?=
 =?us-ascii?Q?//OB7ONkqtmelwzUf7jKsMkGX3gfYGz1BRxStbTPQkMbWKEcU5KHuTkrFEfl?=
 =?us-ascii?Q?Jl8vt7aHxw/l0qIuK4pWLvKVEoZjGIPKn2Co8GGvuE9xQ34Y069IirrYn5cR?=
 =?us-ascii?Q?IYHtjov+S/FWqXIKOCTwnPn5ZVpTePL2Yyuo6KVY67fC+VmEd3m1eV5vCb17?=
 =?us-ascii?Q?++n2rAM5sj8g236j26emeuV4Ys5S/L+aXnignYvG7Zfcw9hHpyTtjJ6tk8XJ?=
 =?us-ascii?Q?TxV4Xvj7iCG7o6LoZUrABDsokwuMr4Ih9xswXvLvuQXeBjlaAGSXx8bciBLn?=
 =?us-ascii?Q?KeQWtmhCqCWESGpTnsUHl2MJz9bsG3wryilChl3aFoQyArHIRiFXyT1mOXXm?=
 =?us-ascii?Q?OyYywSoxF+5zb9i1ZP9DZr3G4GlFzgxSQT9FGgIbwDNagJUT1Z5KpAbR29eQ?=
 =?us-ascii?Q?Ydmt9LMoJZtyNxAX7TsU+VxVdEKjOz0684yFiKHxoAhbg+BJKRCPhnusb1AM?=
 =?us-ascii?Q?simiesb5THSkmMQTTxkdjeTsLBsiAz8aL0xcqV+TUKAD7yIx/ldnuZ6V/Fwe?=
 =?us-ascii?Q?oTBze1jNL9H3hCiDPSkMytKhAxBFOm+hAxqFxYemSqctcciqCwAA5xZAq4kK?=
 =?us-ascii?Q?1ug+W5+gQL8ZpQ4xqnUZhQ5B4s2MFNxFk0PxNt9dOZGW5YrazIM0zu4EIgZ8?=
 =?us-ascii?Q?24wXczhdy9UDuGO+SQg3TPxubTuJVK6XDSjSIAYZzj3rhHK3vUxsqd+8+e8C?=
 =?us-ascii?Q?n8WlrbvGdOhn0WT0HH5lEQHHQTaLqpmTGXqbCTDTCVgH9XnYAJbkwGnyJltx?=
 =?us-ascii?Q?OmiRhMzZotvcnsZy3vHUEGriuFbxUApBxe11wSQU/9X4rL5Dcc70auOvXu64?=
 =?us-ascii?Q?f3spQJl7mDPjTvz/Bk7lA71P9vQ7/LMdQbcEt8PLDpZm/L4ZK9UrC1r9jqQd?=
 =?us-ascii?Q?YMOUqpBGev+39v1XbuI3GhO28jY1HK+fXB46EWsP2LjqqQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66705158-951d-4dd6-0840-08d91046e773
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 04:24:56.9645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0as9p+EMqPR5hXm34HjGYuO8mfkoCwc1R9apN9bmEInClz2A1enAtZYShKIwsOiecseshTOmsS/O+urKh7uWnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4940
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add an optional property "fsl,auto-boot" to indicate remote processor
auto boot.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
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

