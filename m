Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A52C2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 05:28:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B4046128A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Jun 2021 05:28:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbhFVFam (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Jun 2021 01:30:42 -0400
Received: from mail-vi1eur05on2045.outbound.protection.outlook.com ([40.107.21.45]:14593
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229917AbhFVFal (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Jun 2021 01:30:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byE67l146TBvuOB2cW87t7s+d5q+8gk1yHdHpcD3TpJ6+Oh1+Z0P89duUYj84lkhHmNT3nWpTvXsdz3Z6uUbcclx8b4ZT/AyLfcV2Wq+GLhOyIvOSp2EZ5DQ4aq+5yyxn/1dilEw/dj3QxQA+46lvayut5LuNx8PBecDj5iiYtQYK2OG8gFQ983db9JjicfUUtHNso9XSaB2miUnaxAaZ1wm8b5vzYr3YH4KIVPIdIfvlWrt0Cam1IeBChvDZpLxpzbTLGoI3TvzAalNcbELi3fwqayKTxJInEZLQnThDHBpyoqqCg70Aejg8frC0Ug3dgc6tiTqhnSWD0zJfcU/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EvS1provBgvWd6RTu1jI+e4uqATEpWmDgP80Eg6rPc=;
 b=KF3TRMeDxN77fSJDCoOcb8JC2cF40KBnmHOkulDJgRdPG0SB8VjYS9R/wubiRTRVQZ5TjRcxHOqUMqtW1HtVzbP90c9eK8gJAqq6HugjIRUCYojbtr5Wl6uB96x70QVeXxFzeK1wHB5F+dzUyb68tFKaYBLOdVWHfI/V0qofSoPXbuh6JlTxi7ioW2U41Bb6gEDG/tQ2RIJVm0fHNMipM5b0kXVP4NugXVyUkJ99xEu14x2y9TDGOHREU0B8P1wqun19ZCE9fWoSlo7kGM5o10NkMgBPmExcy6HMKi2hyAZewMtHPJahMBZD67Zqb+rI/Cu1FaQ5X38lxOAAaAVvbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EvS1provBgvWd6RTu1jI+e4uqATEpWmDgP80Eg6rPc=;
 b=VX2Iu1GYNuEZirHO4uyU7YbDxndHWhniUQESKguedY7ncqHB1wydhKdZQNmUkOCjhahuZhxL6og3M/xYss0rAyd4VoN1V65JHPlzGgUb0mnuUhUcxNFRoZROfJYN97DkTELyYOgcnnhQPTpCuOWroXarkrIPnBJJzgzBYMiCOXs=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3659.eurprd04.prod.outlook.com (2603:10a6:8:5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 05:28:23 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 05:28:23 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V3 0/2] remoteproc: imx_rproc: support i.MX8ULP
Date:   Tue, 22 Jun 2021 14:01:46 +0800
Message-Id: <20210622060148.18411-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR03CA0133.apcprd03.prod.outlook.com (2603:1096:4:c8::6)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR03CA0133.apcprd03.prod.outlook.com (2603:1096:4:c8::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.10 via Frontend Transport; Tue, 22 Jun 2021 05:28:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df0e2a23-4d25-4c56-478d-08d9353e8d72
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3659:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB36590C7F5A2725D25423064FC9099@DB3PR0402MB3659.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t6Aa/Ip2zZGL1NWPM++4iNfh+jLBNvY0p1sE+LwxcJVZ3ErlS1KjKLTvbc3eGCN85jaCd3/2VJuXjxpaQaU1wg7en31tcUxhQqm/MsrodbAyVCqVPbJyF6xSslZII+HsZ1Jsc/RQNGuD1z4qO85sBPEVkZyegJvjSiFd/KCLA2T0OngxispxcXorzpK+9YY9PKB1q/8fWxl5cCogvoEob66rBt1PAZHrRtXGhOHorEtfIlFg+26+i89j9dY8Gt5k7+uh0ERNab1UstbOIxLe2kTdmpnLkHdPCFVa35IA4dnjsV5uEUHOQPBjSP1pL1rDiqWbD/S9k3Se+qwN9mcqlx2v3sSVXQ2GE6mBK3eYj5lJRqn+vAUxp7rs/OfhJGmFLN1Ysmj8Rj8yTYdeAdvMVKkdyqeiHGRSzpRjGoG4/9I+0uhuAXlybCSntgp15VPZhaMkRgPtf09rIP1GPgpQGuOhIrD1SMqiFv8ilMcxwZE5QdW42zs9FRdzDINUn8EP8/UTirbEXOW4KxwOb5xVZ/0H4EWqhp4WzavbkOiaClyVbngtdr8gQVAEPWmZX7Br+hT0KJVorXcSJt21UuPSpUrKNOkO2zRPd8G6ugzg4QUQ3U36DGo5DpuD6XzpzeVtznQ6Fb06ScgFkAeMnG716N6uz/GFTbjy0HuE0Nmzpz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(5660300002)(52116002)(83380400001)(38350700002)(38100700002)(1076003)(6666004)(7416002)(16526019)(6506007)(26005)(186003)(6486002)(4326008)(86362001)(4744005)(478600001)(2906002)(316002)(8936002)(66556008)(8676002)(66946007)(66476007)(6512007)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1izzfViBOkO4XR0Hfb7IrP0rdJzfTLoByqS70e8XI+u35Joikt4PRBDZoMb4?=
 =?us-ascii?Q?MV1BUD1ocs1NVkQlViiVAYN/goj+A5UzVi++vGU+25kQbLV042H5vAsGZGwn?=
 =?us-ascii?Q?WaF+nnkpBeKJnhbiWyKCeuzTSVHMZDlzw9FU1bY/40FCZmTJbYKdqCwcGIip?=
 =?us-ascii?Q?lkz5ljf3VaxqeN9gG3scGED1q8B3dKQ5wOF/Fm2OU8bGO43TWBGEBtM5s952?=
 =?us-ascii?Q?cX93KQ+F3SV9QSH3+pKEtWqXlDfCIL/re+JgXDvHpckklCbdvNpP9sJ+ctqb?=
 =?us-ascii?Q?H3f246WeofTOqeAjLDWK2dtmrH3gUa2Uu2oCdh8hSbvK8sF7BCgFWgp45Rb6?=
 =?us-ascii?Q?HQvBUhauWEqGLiXZ6ie00ZI2MgUxGWbntvsk+p7Be47GQdpJgRtwQnp8g4KF?=
 =?us-ascii?Q?iaMEgGMALFvlhC2CSKCPvBeMnsjFMp2w77hwfmFiTPibZlBQMuExS5eeEVf9?=
 =?us-ascii?Q?MCMwVc/vQ86Ccgti/PtRhKnlFjRZC7O7A75Nu0Y8xRWHVdwFhiPUgC6ilh+V?=
 =?us-ascii?Q?HubB789kW3pB2Y/PcfIp4FlTrhfvebiLfYUcGPHHKRcQ+ETui/bSYMNLRFsH?=
 =?us-ascii?Q?q/m0XKxHMbISaYNmdsZRGoIwZeG/A21TJtRpOTzvDmVurquVmvBXgGbwasLO?=
 =?us-ascii?Q?7y2W3H54HqCB4yA9Dh7ipa42Z81mtZ+X4tyJNkzeNQKkYJaNUaUzdn2+tU+W?=
 =?us-ascii?Q?eM2WH3ZfhUcCJRpEHS0qhAI/BVuPIg2Uo+/UL8YXD4e8WJXqGbCCdu+hanZ4?=
 =?us-ascii?Q?SvQEFN4AVP5V62Bd3f6vXITzhBME3awBBUtfAup0+bAsQvV1G7DWtGc938Ip?=
 =?us-ascii?Q?uhjVm2bPSSvrpLjnbKZSv4X8/i1Z0OTHxUPv581BIXSim9pJhJV0DPFCdmu5?=
 =?us-ascii?Q?xPv/6iQ2gr6tlnlSLEoqPDy0GOr8sIZ4gDGR4ri+cpVl6gJ6FKUXhA5Q3iuS?=
 =?us-ascii?Q?O2wlvQjGvrOAlpBCITqYMAUj/jaKKK6E4FWh6GW28w/yyQ/ygOGyyYM76Zy2?=
 =?us-ascii?Q?lkCmu2eJJjEEM3H8xQUi2poPRTYWp61KOrXxCutei5LF/dnP+TGhESn84qLS?=
 =?us-ascii?Q?YSRQLPn4fJIUQTYs+DleUaFy1MboGIim6+H8+PqM4cqTy8AjWkr1kFgvHZiC?=
 =?us-ascii?Q?AJoLw952nb/VIDjhTb6ZDuHaTTZe3Y3Ok3NhbS3InQW0eHkOqE91/g+pwUN0?=
 =?us-ascii?Q?gaD39uruA3duURmKZt8v4+tKtie8xsxdB5byhhVX7KmD1N7NuxIDSXMM1NxR?=
 =?us-ascii?Q?f3Uzq5KgpIQdkM6IDB8ZTNVCalv4fgcd8EkXTdG/ov0+uWsvxoVf88H948C8?=
 =?us-ascii?Q?axtOtbPaCUoJHWNZzHbOPRBsG9wgPAtLnDg7Bu0nuFiObA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df0e2a23-4d25-4c56-478d-08d9353e8d72
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 05:28:23.2534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LZACMV/1GjeCek3ebou85Mwr87Cs4/Ro57rzX+VNYbXvcEhZ8yUrau8YcyCiPdu16uHQhAFApl9BSmxnl1WJ0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3659
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V3:
 Per Fabio's comment, keep the entries in alphabetical order in Patch 1.

V2:
 Add R-b from Mathieu
 Add Rob in Cc for dt-bindings

i.MX8ULP features a M33 core + dual A35 core, M33 is kicked by ROM,
so like 7ULP, A35 only communicate with M33.

Based linux-next/master 6-22

Peng Fan (2):
  dt-bindings: remoteproc: imx_rproc: support i.MX8ULP
  remoteproc: imx_rproc: support i.MX8ULP

 .../bindings/remoteproc/fsl,imx-rproc.yaml          |  1 +
 drivers/remoteproc/imx_rproc.c                      | 13 +++++++++++++
 2 files changed, 14 insertions(+)

-- 
2.30.0

