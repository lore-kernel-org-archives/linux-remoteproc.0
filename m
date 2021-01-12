Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3394C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D5E8230FD
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Jan 2021 09:50:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730320AbhALJuL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Jan 2021 04:50:11 -0500
Received: from mail-eopbgr130070.outbound.protection.outlook.com ([40.107.13.70]:50926
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727792AbhALJuK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Jan 2021 04:50:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZS/5kQmOep4IqO7PNhkJrXoibdxOGEEfsTpS0hNsLHRdCrOD7oiAfriHpSdCLumpHLgngby4lNfeV/DvUYvmDUP/6csIB+NnLvfqAmV+9mkWmmAOt+/FIkVf56LFodBHeqcwEXdmaucn/d6x1CxoxV4aFDoIf73IjreawSA2bWBZlTE6CPQq71yPG9QlJOgXIVrFrGWe0L86Vo2TpSjxvfAMAyDkWzsOPcmXR2IajZIrrP648CjKS4C8LuaMkWRK306xdOVKj7r6mIJBuxkUoVpLNvZQ20L/vnTR2h9dHKMqd45nxgtvycVJc3UoHfuGjBDciZUjLKSuHsHtoGrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkaNWyaZe4q3GuTCuwEV3h8Cr90yLi6v+UipBnd4tjY=;
 b=CAUZ+lwoI0rdArqPxopW4DlHlnN35S4IECXhIkm5aXDBT35z/jFgg+t/9dNakchBvzY/DTwgw7mlAVdakCN+R0AcoNOLWdhW3l6oCWTxMEnkqcAPYOUMZGA6n4PAGw5veMUBBu0pd2uNBCrYU4TurFLGA2sqAgZ0npzg9/UBLrQXHrJn0aPKHd7DHlSmDToZYd1bcogrgKEM4pR3ZzhTTE2O8iIOyG18JjbGNNsAVZfctXDrtqRq9I3ERJM6qYcdvypnrs6vXfL2WkaPZ0jpTTfVvxfpWUEA0Xb7J/ZE/oLgZAC+7+KfSE6XGPLbF3N57IusnjIlqMKGTJK5OAKr+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkaNWyaZe4q3GuTCuwEV3h8Cr90yLi6v+UipBnd4tjY=;
 b=CiCG9x6KdiprBto2vHxofNM534kAnIU04PAKgQmeh5F7XdXNiAG70azM4/MzCXYVCxi15e1ufvcpkEm/GkodTKwFAi9nu6t3nKR4omRhwUhCoD/4luj+D+9w8rtAm2L2tAa2RFiGcuFstAT2CBVNDQTSRNY8/Iz+to9ugm6Ja04=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4089.eurprd04.prod.outlook.com (2603:10a6:5:1b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 09:49:19 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:49:19 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V6 00/10] remoteproc: imx_rproc: support iMX8MQ/M 
Date:   Tue, 12 Jan 2021 17:39:09 +0800
Message-Id: <1610444359-1857-1-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0212.apcprd06.prod.outlook.com
 (2603:1096:4:68::20) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0212.apcprd06.prod.outlook.com (2603:1096:4:68::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 09:49:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 419f27bb-c5f2-4722-9f8e-08d8b6df5514
X-MS-TrafficTypeDiagnostic: DB7PR04MB4089:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4089F1FDA0D08DF8C779296388AA0@DB7PR04MB4089.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c9oG5z8DRPGI0xPzOIQRNRMy7RXcozLdih2YcPZ98ONb5uEY1FI0GCC4bh/C1g8Al/pZ3paOFkEzvbHL8tf69p9+htKzFZ8DA/0V9/+lU5I0djthOwO1AsSHQGk5pFZ8POTFpsptpB+WsSmjb3eHmbFAumahRuoerhxw7f/YsVLkbBszDJtZLXLgAgGHIaGxzP5V10mdzEArIxdZeE8OvXGymnPBrTc0Ia0saeihEo3jKhXcaJdXjqSqwggxE022899NHhMap4QeH/uzDyg2pKdqjxIhtN0+6Ee/982XJnBc+ZgpQc8pP9kOjkDQOv6ALjmZzKRQDEqdTp2/8hafGy95NNbfw7kknkiMo/HQvWCLFKKH3p101KasIlQqhUy8bIKEJvnMJn5irvyH8R26U5gSCqdzsvj0axo8vODH9bn5uwKmKlEfriZw2FtUf0l9geWVu6niWzS/PCSOaHq01/ObQ9/h2E/89GZkSLZQym158krmi3ObojFgPx/bPiJcV+oD2Xto0VJg2eqJq67oOuRoLCZtGqe4ROgcdInh3r8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(36756003)(8936002)(186003)(66946007)(66476007)(9686003)(26005)(6512007)(16526019)(5660300002)(4743002)(4326008)(2616005)(69590400011)(52116002)(7416002)(8676002)(6506007)(2906002)(956004)(83380400001)(6486002)(6666004)(66556008)(498600001)(966005)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1sXEDNKPXXIB4PX1x4D5CSoqnH2rvv9jjjNP/LnC2QwvXqUjYGmfnB0MtICB?=
 =?us-ascii?Q?1F//OWPOSpmQnY56jjib1T7dloAzH3qB3QGpKOqZB0sVNeMmvoUA/WSKxd/R?=
 =?us-ascii?Q?cA+nG6m7jSFq5d3HmH5Ln54CpTz36GlVmAMaPDyTFMaFGE9CjqLte8Ze9Nje?=
 =?us-ascii?Q?Y8S9ZLn4IFJwa/y+NIYgMsbPR5QOqV7bSkI7OR3cbt2tR7XUqEWduS9+eSz+?=
 =?us-ascii?Q?UUgvcR9juB+YJQGP9nRDWZynwJeluuvNiHrIL6i03Z160RhIcPQz8JjLczJi?=
 =?us-ascii?Q?H9s0AH121agCFQHS3QRVmnch0ll9hhk5biWfuxKL/7POdL2GbVcZjlG0eQHl?=
 =?us-ascii?Q?oXb/ZAnOLhkHZNs1EqX13csm7jgkelTHogPx0gGBJqJ7OSptYVnNrosKWzaS?=
 =?us-ascii?Q?bAYe6AN7IW2uin3SR/qnRC4q84JLQrx/UWOmqotn8lL3qp2xsJObCq5ER0Gm?=
 =?us-ascii?Q?ma9m6pRMIqJjTXJeeyqOKGLizD04BPmFYD54gO5ChAH3PlP6PvRnI9Ql4oNK?=
 =?us-ascii?Q?6NdP5aCi0MT9UH6q4jzDDr5XxskHLb2kAENR59YeuJcQZvAX9zbS8BxSqOXe?=
 =?us-ascii?Q?zS9ZamSz0GWbgvKubxqJIj29z8sN/cfXpx09MtSxkc1qMiBoP13L+Yqw67L7?=
 =?us-ascii?Q?McYxG1mXpIz9Xtjs4bqQHwj7yFbBMCg/NNee2fk5XS80k3zwKIKTH5qkPj52?=
 =?us-ascii?Q?ttSYmH8RNcw+cIijmnoY6HD1TUA9xeTygF77EgfWvqg0+Ry75RimR2cAMUfK?=
 =?us-ascii?Q?L2gDzzDU3jm11KvBJAbQ0ZpEevxZtPG4HJ40dMz11n9jFxdT+3jyk8beuvdg?=
 =?us-ascii?Q?G9xFXn8aj5Cyfv+DgN7alHNhxpVVfp3vTNrWJ5kkCP5I7qdnfcBNHvMdH2v0?=
 =?us-ascii?Q?L5rjrE8yHjiK+Jiug/8PW8ju5HvJf8ayULrRNMAzeGoyBFjSJzRZY4LnUcOB?=
 =?us-ascii?Q?5M5PTxbW3A2WR39QSbvV43p4nQ6lluwWDasF2KPGYXOxIjRF8CkLoYpOYLen?=
 =?us-ascii?Q?X39u?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 09:49:19.2853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 419f27bb-c5f2-4722-9f8e-08d8b6df5514
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eb2d6kkj3uB8bt0iBULzWxhd0VJrlwqPxAbHc6845mtYe1lgFcLc8t70yLsEGkp0btxJrcgHK12dJKN9HHfXGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4089
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V6:
 Add R-b tag from Mathieu
 Convert imx-rproc.txt to yaml and add dt-bindings support for i.MX8MQ/M, patch 1/10 2/10
 No other changes.

V5:
 Apply on Linux next
 Add V5 subject prefix
 Add R-b tag from Bjorn for 1/8, 2/8, 3/8
 https://patchwork.kernel.org/project/linux-remoteproc/cover/20201229033019.25899-1-peng.fan@nxp.com/

V4:
 According to Bjorn's comments, add is_iomem for da to va usage
 1/8, 2/8 is new patch
 3/8, follow Bjorn's comments to correct/update the err msg.
 6/8, new patch
 8/8, use dev_err_probe to simplify code, use queue_work instead schedule_delayed_work

V3:
 Since I was quite busy in the past days, V3 is late
 Rebased on Linux-next
 Add R-b tags
 1/7: Add R-b tag of Mathieu, add comments
 4/7: Typo fix
 5/7: Add R-b tag of Mathieu, drop index Per Mathieu's comments
 6/7: Add R-b tag of Mathieu
 7/7: Add comment for vqid << 16, drop unneeded timeout settings of mailbox
      Use queue_work instead of schedule_delayed_work
      free mbox channels when remove
 https://lkml.org/lkml/2020/12/4/82

V2:
 Rebased on linux-next
 Dropped early boot feature to make patchset simple.
 Drop rsc-da
 https://patchwork.kernel.org/project/linux-remoteproc/cover/20200927064131.24101-1-peng.fan@nxp.com/

V1:
 https://patchwork.kernel.org/cover/11682461/

This patchset is to support i.MX8MQ/M coproc.
The early boot feature was dropped to make the patchset small in V2.

Since i.MX specific TCM memory requirement, add elf platform hook.
Several patches have got reviewed by Oleksij and Mathieu in v1.


Peng Fan (10):
  dt-bindings: remoteproc: convert imx rproc bindings to json-schema
  dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M support
  remoteproc: introduce is_iomem to rproc_mem_entry
  remoteproc: add is_iomem to da_to_va
  remoteproc: imx_rproc: correct err message
  remoteproc: imx_rproc: use devm_ioremap
  remoteproc: imx_rproc: add i.MX specific parse fw hook
  remoteproc: imx_rproc: support i.MX8MQ/M
  remoteproc: imx_rproc: ignore mapping vdev regions
  remoteproc: imx_proc: enable virtio/mailbox

 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 108 ++++++++
 .../bindings/remoteproc/imx-rproc.txt         |  33 ---
 drivers/remoteproc/imx_rproc.c                | 259 +++++++++++++++++-
 drivers/remoteproc/ingenic_rproc.c            |   2 +-
 drivers/remoteproc/keystone_remoteproc.c      |   2 +-
 drivers/remoteproc/mtk_scp.c                  |   6 +-
 drivers/remoteproc/omap_remoteproc.c          |   2 +-
 drivers/remoteproc/pru_rproc.c                |   2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c           |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c            |   2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c           |   2 +-
 drivers/remoteproc/qcom_wcnss.c               |   2 +-
 drivers/remoteproc/remoteproc_core.c          |   7 +-
 drivers/remoteproc/remoteproc_coredump.c      |   8 +-
 drivers/remoteproc/remoteproc_debugfs.c       |   2 +-
 drivers/remoteproc/remoteproc_elf_loader.c    |  21 +-
 drivers/remoteproc/remoteproc_internal.h      |   2 +-
 drivers/remoteproc/st_slim_rproc.c            |   2 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c     |   2 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c      |   2 +-
 drivers/remoteproc/wkup_m3_rproc.c            |   2 +-
 include/linux/remoteproc.h                    |   4 +-
 22 files changed, 406 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt

-- 
2.28.0

