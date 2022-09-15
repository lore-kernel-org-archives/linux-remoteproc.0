Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A2AECAAA1
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Sep 2022 14:12:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbiIOOMQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Sep 2022 10:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbiIOOMO (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Sep 2022 10:12:14 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D93539C20D;
        Thu, 15 Sep 2022 07:12:13 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28FDu2H4009729;
        Thu, 15 Sep 2022 14:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=z7KX3vHdWEGLIIZcvzS6HvSd/deTpqhvzxJISaFGngw=;
 b=C+h9PfiF8zVEnSzDUm7QzVnmvYJCy/ztpGu5SxPN9zOt8988UwOkpIFh1sp7gft21IaT
 Xge17fLQEphda1RmIR8KV1zE466LV2MNFdBM30eJTCNG58SIa7PLcYZVC1HDRk0cmzEA
 jBdI+G+rphQGPMFQnjZCZ4x8EalY+D9thuJ7w3qT7l8y2oHmvSoYGD+MXzG3KU7f0hpK
 xEft5PzCnXrePFCUV3gut99XdwBvIsTpkHQ67MYoQzhxGUVeRztJOqSugbsctSzieV9d
 VjYMz/DM8dmXgDRE4XPlTaMPTraY7NZ+1n6BQ9BCegmBirKqbSxjdyRTujsK26yb5PJh tA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jjxypdcs6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 15 Sep 2022 14:11:55 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 28FE0koJ037251;
        Thu, 15 Sep 2022 14:11:54 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2043.outbound.protection.outlook.com [104.47.73.43])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jjyejtwq2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 15 Sep 2022 14:11:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bn8FQe5258a0MegfSQNVXaLMwdDXdICKdlhX0jTJeyhCd5gYSXoZLCDtAE/I24YkZcr9IF+EdgpMQuCGSt57Vq5FmztETAnO4Qrp/8Nvh3RH8zkyNVyt0hld3BwzXtaUJM1RgqtKmrffWt5H4bT0ogZFfR+3cZmlOzCLIO6idlfof6OOUqvFfIV02p6pip/jjDxGw7eosCerU+1HDgkQOptyKkk7Dl7bTMEUH/ekpyVAaoL/RhUhmm+UIPDSYxrDpJ3MPSAFCxL0yY97MpS3qUtT0uV8nip7pYUOX6QadqZuvQdH3ez91NXA2Vnc9nL1IJ+rwsXZrt1KwOrLybfYmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7KX3vHdWEGLIIZcvzS6HvSd/deTpqhvzxJISaFGngw=;
 b=PBpRl5RNzQmNWvtlrklMY/g2vDJ9XIaxNte0GmQw6hcn1zTNXhoipehoClQOjE63+DQmuXMIFr21FJpqyXLIDx6fD4OoLB+v+kMz5dOy9UEP0gVdgcG/nIsGh600eVO3eXgxWCTIW/BbBMk9z1VN8u5A3ddV2eaqJJvZOvjVN8rxnut+2g1tnxXo/pURoitNGYulhSv18Pqo8FoXeHtWFi98/GNXQhnUPH0l9cw5Zi4kJ4HcaP8TPBVXpy4ubwFbwTKOU5IyGMv36aCWWHY2Y0QSL3GE+cIKYpDG2DjQ6LQhz5vMNk9/WZLpGJU22n+HxVU0wgOzxLc7HpdxSeKbjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7KX3vHdWEGLIIZcvzS6HvSd/deTpqhvzxJISaFGngw=;
 b=Jw/rSLWcW98KMdxcnVRDOFmHh+yzZGaJOdmOEcalrOjbC/7rhxptnu376H51QIiWO4Y65CvyZSvL4WZP3oM1ahU/js0aVNM7JJ5yzuHOdBsZTINqJDwc8U0iZKYE9tnpEDS0h2Uz1Cf9VGUDVRVmwm8v4VLnhKyvCkHIJmTQmrk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BLAPR10MB5156.namprd10.prod.outlook.com
 (2603:10b6:208:321::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 15 Sep
 2022 14:11:51 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 14:11:50 +0000
Date:   Thu, 15 Sep 2022 17:11:44 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: harden rproc_handle_vdev() against integer
 overflow
Message-ID: <YyMyoPoGOJUcEpZT@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0004.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|BLAPR10MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: a2fa2a95-8eff-4c74-f070-08da97243c03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ACKwagM7QzBuhKBX2L5yWU3gPVqS2AQ0H2Dw1gwZ6L9Qj3AF8DLOKqmHI2Cj23jK13u/CU0gM3+Vd/OWptpkV+M2/d/d8O6a5mI11UuGqQD5sxOorJzLeudOhRalok72BhzvfuPzTltqrrRMEnWmD5xlz8csKC9t5H5AFZ3aN7d8J585wmpEtllX8QOWlmJmuq5ZJUHe097Kk0jsh2k+j7OWDNa16sDW4I3+76eucU1RSdlR+otkm9GfZ/BGLkqd6WpG/lFw/NMAldw5hvp9y8h3ds7oSvCsXgWOf5gqxO7FSfcnSU84vFqP3KoZ6jfOl+wAI20EYV6c0c5vcyumUw6RAn9DhPjjVI5JlZMCIpAn57MScgcN4MPdvhiQ7QYeRZnTVKtbEhfmPTYCAwAamZoH38m8NPz9WFweGmOt//G2hCldrH4mnPsoaKEmxw69zJkg6OdZfKPca2T+Tph0thJOIdj6K6rI/F/vnh/JD8sjWEXc0/3SkG5TlqcrnHOwYRIlqej1+nTgYm9r+3/OxFOIKz7fzupjCkayf+p7htDhcLdYY/GmR8FRw302R4Fd8bscQ5Y7Chkr/46yNguJYdfxXde8r51gTmq0lOI28RUTiawX/dtLmKNXGOhVBxW8HRR/wTnJDt2ursL3Y82k0b3U/IqpF/YBeQsMW6Q1WZlozWPB1/QWBw5JR5kpNU12SDnpltqZFwCyR0Iv9cArYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(136003)(346002)(39860400002)(366004)(396003)(376002)(451199015)(66946007)(6916009)(316002)(8676002)(2906002)(6666004)(33716001)(9686003)(186003)(83380400001)(478600001)(26005)(38100700002)(6506007)(66556008)(86362001)(54906003)(41300700001)(6512007)(44832011)(66476007)(6486002)(5660300002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r84v7onVxMSDycwkl80U0WMeZmBP8Rc6AJ4Iv6mWm7YL/Lq5XyKenNmUyP5x?=
 =?us-ascii?Q?m4JWajGVzc1Sgcvtb7B4VrcLXg2XhTT/0/ZV24BDEI6Y4NjQ0DgvbY6WOaxu?=
 =?us-ascii?Q?Dx5AIDzYGBxsSrwxxZvvIXTxHjVDTBHTz8xqTk7KI86bYldAP8DakbNy1lbN?=
 =?us-ascii?Q?E4rXfQ1fp6+QGO1Klih692MWrYsuEbu1DxP/vVFVop12XXIaIDijWfEKlSUd?=
 =?us-ascii?Q?Sm5rliRWBU+Lx1Gh/ic1Pqnta6W8IUCSx5xaKJQzgG+ol/WpD88Sll99HDn3?=
 =?us-ascii?Q?l+qVU0PeEKKvh2/LVwyL1JDxTwh7VXHmkiVAk3ePrMv9qI//7TNEqriv8a3A?=
 =?us-ascii?Q?/MDdLtWsdfzjeAxgUxegiS8+1Qlaulr6svt4Jz7+hm52vNe+e8QDHlF5X2Zw?=
 =?us-ascii?Q?rZm42N/MZ+lr/q3gv2dH2FyVsnQ4jwGPoHi2aPGdaPyi3E2QYhqu5wKIjbIC?=
 =?us-ascii?Q?Q6//KoKtXjjb3OAfLN7jnOX2/qRodpCFYE6oFkb1LkXkDqe7+85naSlG3UeT?=
 =?us-ascii?Q?P5agSdhjMIzaygZpDfmLoBpPkhvdjlvrmpX4JEJeko68+7/A5m3duOu/pV2n?=
 =?us-ascii?Q?OdRsikeqaIOt8Qfpu/mNe8Pfkqah0N4jMAGCuIKpTvKp/NXyLye8UrsYDrpy?=
 =?us-ascii?Q?VZxjdBMV/HGzEUvx8zm+3aSyjuGyON3eMmDfYnpm5082G+AzkikeWTZkv0Df?=
 =?us-ascii?Q?I7MIofwVMsxaShGvkZA1OO2Y4uopAN5T0lz21jLPHC1gDPiao+0LDUyoe9RP?=
 =?us-ascii?Q?3I2g/H/qtWPwT5LgeKaIqNWIzBJb3sbmWCSuTtDWlWhFk7h4P6jVPUHadYBK?=
 =?us-ascii?Q?5TfRTMD/ue//v8bZb5eLgCTZ5EwT7He1smM78oMXRtH5bQI/dtteLItiwSsQ?=
 =?us-ascii?Q?5vh7Y+v3AoNv3zTkKhtqL2TAuAr5qkJU6OZXZQl5iDVh0+fC693d+qNITl9M?=
 =?us-ascii?Q?/oxzHW+am6A6sCREPMHr3Fk2p6gV315DpzU53yfgc6KsjiTzLyPaBOFdjzlk?=
 =?us-ascii?Q?hYVG3k6FiHf7YRBO9RfrVohm69fINWmNAjEjUi21VwwcrZtCCUvEkAU3GQwB?=
 =?us-ascii?Q?x22j9NhIa8KlIpItjx5X5ezdQfk8M1a6MGHGMDXNL6cG2+ODrrbAGSROP9LV?=
 =?us-ascii?Q?nXBRflEpVjJTwKIRoaGDKT8rPvCV8bqOFdaHEYKbcGgwORPhTVdbAs56BHgO?=
 =?us-ascii?Q?T5o5UXsw63djbfLKi9oreY+9rHXdS+6EUCPZtAn61VkwClEfnH0GwGtdRIc4?=
 =?us-ascii?Q?hOZ365+mcEI665iGckaeSyA4xfEYu36ATfscgUE7MJ1u5A1Stva94plyJIbO?=
 =?us-ascii?Q?epDl+6L1X9wD+A7qamIdGWFiB7wQX0oL83vXkYQd+8tuvzIw0VrcZkku8myX?=
 =?us-ascii?Q?IuFOObkPkM0cMaTau3c6yAsydVOxEgAQ2UXWIWoHME7Xjr6tdztQI7i3sEAj?=
 =?us-ascii?Q?VLhYeR9QZHV5DskP02pA1hM+YGmY6hg94gflNjcNgaYZpiVfliP0d6Eb72NR?=
 =?us-ascii?Q?7SMRsqvB6l5ATTLaMpXIA3HmkszrJUMIYYjGVmQaH+xx8k/yaHs3dWgY8kVo?=
 =?us-ascii?Q?kFMZOkunbZ7m1fLlnq6CEDVM1P4lWhSckkOER7897yM3YdtGZN7fOWOnGcwj?=
 =?us-ascii?Q?Zw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2fa2a95-8eff-4c74-f070-08da97243c03
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 14:11:50.8791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lTEqRU3/VNv6wc5bmp9yj0N2LZEQM+EXQ0gW7t5Q+m2PCvmcAUIWTZKIWdzetyn8Jqj5Qqpystk+tSQkImSSo2XXYB/BQoxFkDXwUEXj4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5156
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-15_08,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209150083
X-Proofpoint-ORIG-GUID: nhRO8eQ1Jq_Yv4Y3JItJ_X1iGRf8VbX-
X-Proofpoint-GUID: nhRO8eQ1Jq_Yv4Y3JItJ_X1iGRf8VbX-
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The struct_size() macro protects against integer overflows but adding
"+ rsc->config_len" introduces the risk of integer overflows again.
Use size_add() to be safe.

Fixes: c87846571587 ("remoteproc: use struct_size() helper")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/remoteproc/remoteproc_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index e5279ed9a8d7..4fc5ce2187ac 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -520,12 +520,13 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	struct fw_rsc_vdev *rsc = ptr;
 	struct device *dev = &rproc->dev;
 	struct rproc_vdev *rvdev;
+	size_t rsc_size;
 	int i, ret;
 	char name[16];
 
 	/* make sure resource isn't truncated */
-	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
-			avail) {
+	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
+	if (size_add(rsc_size, rsc->config_len) > avail) {
 		dev_err(dev, "vdev rsc is truncated\n");
 		return -EINVAL;
 	}
-- 
2.35.1

