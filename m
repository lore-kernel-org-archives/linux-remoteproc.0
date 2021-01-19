Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBA1C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:56:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 037AD230FE
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Jan 2021 07:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729409AbhASH4O (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Jan 2021 02:56:14 -0500
Received: from mail-eopbgr40048.outbound.protection.outlook.com ([40.107.4.48]:30438
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730735AbhASHq1 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Jan 2021 02:46:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRopq9xtcslSgOCYu/HuCC+9Vb1cV/CBKtpLT1ABbxdn89EbWRrVWK2NX4UiWUZjWVlQbzwhyxpFBVKBlv+b8Wu+T+pLIlrKOoqE9rusIPXyoU89VIAMGWwd3LCgL+DmQgCii+E599IZbQapVj2usyb6PLVu1awUUwrNXAHEJo+wY7as+JriwRQNaBMYlKDvjCnpnbxg8MzooUZY/sOvKvAYj2BNTOjYl8/0ssvpQuciTx7mDTNYaO+1ZLKt+38MAg7ZDVqQWVFW4SdHFKa0j4VC6sB+Uh1Q8VS/zMOKIDa8fBLnK4Jfz3W1olj06jhZ27LJH49euNvamLXKInqG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zpipmheotYKR4QF+DbiELFBamVa3QmXkYcS1XjQKVo=;
 b=XWUQLtuuVzE3yjtH2T/H4a6Kih+N2qUp1H2EKFrTm88pSw2spdLOker5lmhSPbH9T/dOK4I1JwO5/7WVnByPxTHJCWev3EUqzkv2pNrCC0FzzzG/zKii+fJVYfNdr8xJ4DHo3v9M/eh9Ssz7jId5+4wJQxRmP9yrtw5ksufcnvplyaVESofjE8R+6dCAlBe0t7vdWFZTnUJHIfGMM8EVv+FIuZ1cTQUHUos5G7qPdEiBzX3N+SaNOvk14P+y8Fza73AOVdY1KFa30A29kLH5xKEoreUPJEIsXhh3f6PJlzr7IwfIUs3iJD+r5OF+H/EtkNjFHDfSkkl1zRtr/zX/GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zpipmheotYKR4QF+DbiELFBamVa3QmXkYcS1XjQKVo=;
 b=EqlZHE9uPbEZ1w8BzNp1jXXndB3RBG9uY602aq/vDGNsLi8/4hBcxUUj5Q5EaPFt7818CfMZA2Qn5ZRN6PSrGojyxHhOf4AJRE+PfVQM9xFhQZ6J2kAgAfQ7y1XL+nombTxNkIqWjLarwqufolhjeUz/riPBIz7bbyC3EtW1Kjs=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4492.eurprd04.prod.outlook.com (2603:10a6:5:39::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Tue, 19 Jan
 2021 07:45:35 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 07:45:33 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V8 00/10] remoteproc: imx_rproc: support iMX8MQ/M 
Date:   Tue, 19 Jan 2021 15:35:01 +0800
Message-Id: <1611041711-15902-1-git-send-email-peng.fan@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3763.9 via Frontend Transport; Tue, 19 Jan 2021 07:45:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ebc5bc51-7da0-49ba-72d4-08d8bc4e338c
X-MS-TrafficTypeDiagnostic: DB7PR04MB4492:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4492E53FB92CF53C6E75A57888A30@DB7PR04MB4492.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GeF58wx/o/dZzisNAL7Hzc7e/gNhOd/sdp11ypz78GFJ8kOhV7MKfyCoarAu1WlQidxfjjM+gnwmcYzs73gsxUIy5PPc/KKS4KU/9FJycXyawsFOdszvpjZszsy7JYBsMlGk/CrwqQAs93XqcuzhfjmopmKLOPnvF6fssj9wAsrGZfPB1HMq8mCU+SECJWUVVQe6h9KzdypPlhrVLGn3Q9JoMJy1YVmx7VGwADzgdztDZorGe4e/u3Kon501BQIgGvoaMZ0wK5G0fUY6L41Wf2q/Hqqb+4ZDK5jNwzG7feJAFVFg+7Rdn8S/XX0FCgHrz231/7q2qHlnOEjOjlGVLKUyBbnVnYX1+cwlKxaeMpmxGE5wcmew5LGdMb76dkEaZndd78SzVRhoYPq+cpTg30hQ8jyUVtB1vxaKVJzKKMAYRNWL1mBwtbzE536tM7F54i1HNo9G1Zph3d5Vrl2pZfbdPsa5qLD+jwO47/1bfFOoZo4HXS+b1oGZNXV0fwcUQ2Izt2OTt6lKi4zbbqifXf+fPhPSef4sypT3EOhbbpI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(2906002)(66476007)(26005)(69590400011)(4326008)(6666004)(66946007)(186003)(83380400001)(6486002)(966005)(4743002)(6512007)(2616005)(86362001)(36756003)(52116002)(8676002)(6506007)(498600001)(7416002)(9686003)(16526019)(8936002)(66556008)(956004)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SgxRfS2MdLiap5sMVItIxmEiy9fVD5KDKBGggYO2CuA5YFVjvV4++gISLOOh?=
 =?us-ascii?Q?egvz9K/PADKBMVSjp20I0h2eyeYMPomI24p/Ycady/x76Qb61/2sJS9M267g?=
 =?us-ascii?Q?E0lNWq5zRIJjLR4YAGd8PmrRPz+PLrlrtXqK+9ktyS49GPgD4izJtdz0FzC0?=
 =?us-ascii?Q?UIGIsSNNE4LkT5mz5Y2DV0b3okM4aWeyIB2nntOfGFXARrLGJ4N/1p1VMrVL?=
 =?us-ascii?Q?uLjhwqQN3BIpZMh7VbsQ39U1tdaLQ2zVHEeow3oylPRP1j24ABcBck0ETDOS?=
 =?us-ascii?Q?1gOSp8y+1f8Yhs8+Js2ZBYBlNCZvpXB1ZaF0fUw8Kj4NgbQkruXOFA8zwbGN?=
 =?us-ascii?Q?N+c5eMT0bpFyNTrCMxuEDVcjxy9DCe755fDqmT4F6//vYFK3jy6cigC3khYr?=
 =?us-ascii?Q?SvRMpPMAqaXk6Anr6RdqyirD3RNS8o1jVl+6xRlQuCrp7+LXeC9qfDEcVLUq?=
 =?us-ascii?Q?ZBjxutWpmHl/tEZzj6S8k/6LvYt0yjTvCftAWTZUNzEQtmZUdxYpam3wbkkg?=
 =?us-ascii?Q?Pey+dRaU+gdU0rHsTwLHeHU6ko4S6lbZtoHASMC1FxLRyGY4fWyfGDoSnAf2?=
 =?us-ascii?Q?P5B2eF+k2LiYB346IafG8ItwOfUHjbxL3syMU2mJvoLirPdinb8WVFa21ozM?=
 =?us-ascii?Q?L83nd3Do97QYQHDDR+a7P6RnMlG0VPBlmNh8VvQYTDwnr1WMmyBPaK2YqPyX?=
 =?us-ascii?Q?WSItokL2huR+bbjvQ9AdNGyLDluwkKmf960uQYxBZNwmfSJx5GXEs+AzQbBD?=
 =?us-ascii?Q?imIfTN5005nJrefea+MWwI3iep2BjyDJhL3koYT5D58jIIvE4uH18tSpQU18?=
 =?us-ascii?Q?JzXzGG1tCrSRZc3jA+oO1Y3wWBFt4AppIpzTam8QWU5So0fbOYTp1zqXy741?=
 =?us-ascii?Q?KZVMmN/xEWF0vqEENClhnmgwxsng2qsXFzN7lwkJzVVc5zWQGd/C3SQGAC7w?=
 =?us-ascii?Q?VaFIbA6wN1aDz0EadlqMaAS3qt+hE41nls8CCJRk9JYGl11ny1+pvQ42UQPv?=
 =?us-ascii?Q?kFZL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc5bc51-7da0-49ba-72d4-08d8bc4e338c
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 07:45:33.4137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeyMwgB5kaTqlsAle1XloLJefx9SUUi2XbO8zTlqeew0MnoTvgqWaLCLUVe0pATgcz1IJF1wqX8L86PfM8EolA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4492
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V8:
 Address sparse warning in patch 4/10 reported by kernel test robot

V7:
 Add R-b tag from Mathieu
 vdevbuffer->vdev0buffer in patch 1/10, 7/10
 correct err msg and shutdown seq per Mathieu's comments in patch 10/10
 Hope this version is ok to be merged.
 
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
 drivers/remoteproc/imx_rproc.c                | 260 +++++++++++++++++-
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
 22 files changed, 407 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt

-- 
2.28.0

