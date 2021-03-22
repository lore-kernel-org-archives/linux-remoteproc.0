Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9137FC433C1
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 417F36197A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbhCVI0f (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Mar 2021 04:26:35 -0400
Received: from mail-eopbgr80057.outbound.protection.outlook.com ([40.107.8.57]:37150
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229455AbhCVI0a (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Mar 2021 04:26:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CB8FVuyjOvUrN9tdFlMOTsq6G/Cb9l5gxktarG6V9y9/OnvRsFl/xCMcNXhrFBA1Na0FIU6aVm9gSmNvOE0pmt4USLSt/9ODNfr5KQjnot7ZtEwV0iuGniB6BRjOVgyQR5vUBLS4lC7WhSQTlUpfOKTOBqzX6li/KIZ4m6b0n/9T9k3XWnPA+4VI+0rZlDsF3nS6ai60fbMWEU0z3NAWNg9O5jebRMKD75Tnd//Ex7Jwa4huTuY7iz/+3w1seoQdHJMkrylGMSeeNf+wn9wJUb7TvcuYoGD8+PvqS/R1Wt3QgLTt5zZq5QJK8dFOxbfHh4qnU8EN/xlmx8TAe3Am9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vqymw8xjQUaQnrHxvY9qO21DABQ+1+Z/pk8fb1CEW/g=;
 b=BNkNMeAwXzu7lCv0sNVLvmiDP55e/mcqgxhmFaiXVtSFeSSq7xrjZKrYBsNRXhe3x5Z0DPaeaJekA6RoAOuPLSvYoJEgapCfjzPrUzq/C31v9C7dBvu6reZPgJQg05yiljT1EuI3yNmoQFnhF9TjeZiuz2bd4qdNroK51+3YlUw6hMaSnHtKpsNUwAl1qXAFE6IQCXdLn1sjiKBKoAvT1jIticSQwMmiLNzMb3L7yEQohX9z8/rLcL27dBWPT3cdC3GK2JqmivnGzWViGccbc0s45SBgJVt2RvsliZZQFlxBqz9gu450L1HpGfDEWZ9jU+T0ZuKmKyMB3JCKCfTfrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vqymw8xjQUaQnrHxvY9qO21DABQ+1+Z/pk8fb1CEW/g=;
 b=DfdNswfkCU6niFesn2I1zoK0S2uRc2UoF9s76iBCilq9hIN6a8EtQ04/0qdFja2lFbfifKa0EzFSjLiw/mlK8NCDs76bK7oomnU3V4KX8Ta6Bz+vUxZEtcU4x9e+WFSbQMOg70hO7e8/6F0fwzJcz3waTvA1Y0l/4XAeS2mt6U8=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3913.eurprd04.prod.outlook.com (2603:10a6:8:3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Mon, 22 Mar
 2021 08:26:26 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 08:26:26 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
Date:   Mon, 22 Mar 2021 16:12:35 +0800
Message-Id: <1616400763-16632-1-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:c8::12) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.9 via Frontend Transport; Mon, 22 Mar 2021 08:26:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f32f041f-cca6-4b85-6049-08d8ed0c2efd
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3913:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB39133D0AF05963BC3E6DA2A7C9659@DB3PR0402MB3913.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DgZe9x5XMS45yARvR4NnPQGjWkVPlOgZcBS8r3o7OoIaHFNjBISloRiHptT840nRLFgdLO0gqsam/RuFuJMo30cQ5H4wgXAl6ahtglLao4DwtfZELnR4tdY34H9LK096PkYqgHsT2R1PrdpSwFrw+6OBdxh+1qB+7MbAbzHF+IPksqFhCGrcZFotFamIbFPIHw8Olief9jKKzWrnNTJdD6XmkrHq/Q/aG6LjAjDQEoDR3FfORQBoPlUGxQ9Kp+cgo+EaCUBhtz2NFbiq4Pr9CoRYR2KMKtbBA8MHuwJrRoJiocRsGwuGO5fXlnPgdDChkR7Fci2bPXIFdI8b5yCT9N0BSelqmLvZCVqTs7zhW+U76T//t12L7ASp+W98OM9kkhhADWi5GfvHHVEL/WAsxcnv5u7otsD7QzgXHdfWAJaUq0y1yQJztnP19IJMO0J/gcTiSk7OWgtTJ2fmCPiaQtFZAKQrZ8KTsWodEcMgRUAIRzpJihrohb9DvdDXIIXt6h9OpFT2G2TJQJ1zAnEQJw7WlvFSMl8cZfn4+Jb93LPyLEBxz+xv+p9iD1Ar6vjHftmPT1qsZa833aV9YKhyYZHUeYmA0lFtCEKVQU9sKq5CoXl576ImjkcK5X/wy10xKgOGd9NAVm7bgtJkix5fZOKXYkaBeOsQjxWZ6VjUpUL32zdD/XbPKuc9bvO84jMeQRMr6EZcsdFWO0O1UnSriuGhBioowF5WfprsK3iTw0PhvCiZqqcz3/Y4SRXFU1RPImWo+CF5lNtHakRqp1vMRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(186003)(8936002)(16526019)(26005)(4326008)(66946007)(8676002)(6512007)(2906002)(83380400001)(9686003)(66556008)(66476007)(956004)(2616005)(966005)(478600001)(4744005)(316002)(6506007)(6666004)(52116002)(7416002)(38100700001)(5660300002)(6486002)(69590400012)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AvBKJB3EmGqQ6wOvr2LGh1DnCzSajwf9Ri6fvphwBk8uxWPGkZXzI6O+ghnm?=
 =?us-ascii?Q?me9DCIWVD/fRviATFisn7EtVwm0Iip+NZ3JQc/LQ87vp6XU2LyHVGIW7/McC?=
 =?us-ascii?Q?+k0Lo2CRBVRBFw6Cg+aL4cnPw2bCyqL5xLV9VJfPwxLR1d03zERkihg4GgCm?=
 =?us-ascii?Q?pfAE6bl11BBG6B7v0eB8Tpp2FbmaxfFyo2l+jDoWDViXPFu56ktqDO9Z5iWE?=
 =?us-ascii?Q?lyRU/kynUjN8nwoJ9UyGa80XVpOTbqrWFRTm/Lf5GGN4yM94NGGPZJNReACb?=
 =?us-ascii?Q?+31qJm14oLtzuAFFSQq11Kv6Rk27zckvv+8BXlDiSZi1giqDk/po9Mqfho1Y?=
 =?us-ascii?Q?tVHOT370ylXgvdil13zMKkDCBFJCA0pUv064236lr/Zde57HconngmgpJuH0?=
 =?us-ascii?Q?5eA9npeK6/BdGaGjzLo0oEe5FDrz192IrDx+FfRE2DU6QH4mQbBGFh+uWbBq?=
 =?us-ascii?Q?hff1aHXG22Xech6dFc/tCG62tqgq/ecDOmOPI8CTvolqMxcb+HwfuLVw7ckw?=
 =?us-ascii?Q?+L5bfE5wbh/g54Uy2WdaLYV+vMXWvSStjWPiLX9xNjHyWZWNDMxV6MnOt2St?=
 =?us-ascii?Q?T4Q0W4hRmaaNCm0X2MydKA7Uktrs/a9ZDpkOWEYSAtSDCE4q+BKYT1bSJe1X?=
 =?us-ascii?Q?bnAw72YpSqpwuwoYfC1oiYWR3GcGaHeZlibc1ZUd2NY3u5iZUXMeIn7A8zxO?=
 =?us-ascii?Q?Dociks4qrG3J/wC076Q3WsdglZnz19pV9SctJ/EljLfq8wJSgmuq2GtwiW7K?=
 =?us-ascii?Q?CiO1pXOCPzo8vsaQ1Py6ckOxLmQ3WA6yiwCIPbPc66W/N/xTjsVKdXDv8Aby?=
 =?us-ascii?Q?B6/Y2+LYwLRCJaVEWehxhwiU/qjD9YVl7ClGDCnjOlPCXARaRqET0IQ/hJqK?=
 =?us-ascii?Q?VsLWYuNjGZD69Wg9lmb8Ao1CXOohe5OFwp7hGfmg7Y21tafwl9nsA1IvsW2I?=
 =?us-ascii?Q?wAbfwgBY7uJ5ldyRWeGbk/aTc8nV6bIsWZuWiyO2macBklzzFyxri0PG4Pvk?=
 =?us-ascii?Q?57WH4+qJAaI3BDgJs6qqvLk3IppTUz2yvjGO5nWharYOyTMadS9l3zJvT8WJ?=
 =?us-ascii?Q?ueO1wOdCnJP96x9Pywho5dbZOHImFoAsGg+kCWZ8OvJ0rY3UGAk9+EMTBxar?=
 =?us-ascii?Q?gNRjNxIKk7UU59v6hR8BKIEwu3u6Gu/4Pfu1W/jhzE0tg7b/BkULijB0zmU2?=
 =?us-ascii?Q?YK4ED6gl4cgTDPJ9eBM8WRWeaTwNCiEOEFV9v1NcOh9MDNAnWvcYLHSRGqdF?=
 =?us-ascii?Q?QJrDKmjA/Ag1k+Ky3piaaXfPtCjJlM/YNNguSqj5Kl6PDgoqxBMGKOLzPtuo?=
 =?us-ascii?Q?kUkMJ6hWAxIziQS3JMMqUavp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32f041f-cca6-4b85-6049-08d8ed0c2efd
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:26:26.1280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FKbYpeq+biYip7wYTlOeLi6ckexzVwDkFf8f3XWcxpU6IrqSNgdye/4lOaSd54KO9EiqUPRN8IgrjKYhNhCWQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3913
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

This patchset is to support i.MX7ULP/8MN/8MP, also includes a patch to parse
imx,auto-boot
This patchset depends on [1][2]

[1] https://patchwork.kernel.org/project/linux-remoteproc/patch/20210319104708.7754-1-peng.fan@oss.nxp.com/
[2] https://patchwork.kernel.org/project/linux-remoteproc/patch/20210319104708.7754-2-peng.fan@oss.nxp.com/

Peng Fan (8):
  dt-bindings: remoteproc: imx_rproc: add imx,auto-boot property
  dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
  dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
  remoteproc: imx_rproc: make clk optional
  remoteproc: imx_rproc: parse imx,auto-boot
  remoteproc: imx_rproc: initial support for mutilple start/stop method
  remoteproc: imx_rproc: support i.MX7ULP
  remoteproc: imx_rproc: support i.MX8MN/P

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  11 +-
 drivers/remoteproc/imx_rproc.c                | 158 +++++++++++++++---
 2 files changed, 145 insertions(+), 24 deletions(-)

-- 
2.30.0

