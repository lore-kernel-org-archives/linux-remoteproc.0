Return-Path: <SRS0=iWym=CZ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E08C43461
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Sep 2020 21:09:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 657EE206DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Sep 2020 21:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Tz+RF53j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgIPVJM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Sep 2020 17:09:12 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:37318 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgIPPz5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Sep 2020 11:55:57 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08GEiT4k096134;
        Wed, 16 Sep 2020 14:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=kUI4IZFEXU8LhjHvtTI+xYA0MLMlnnK6G8kE4rYNmwU=;
 b=Tz+RF53jDGMnY2u9YzVEXE2Zs6Xv42GunbmPEWJPdPJ/2BxL6/0G0ff7ZtCpw2rbCsS7
 nBFXXBc2VT5go8OEbM75Ac6vkoptuxry0QdEdfqqgR0J3i/mpVNaciGFQK4w93wMsqOX
 +VKkwan9tzxVkvMOlX+ZwMHLs0OVxEsuop9nrlAzUAP99mmDWoVMKKkhjLRIdv1WRYpR
 m2qAHFXJ+vSBIDymHd/5icUjPxIW0MpmbSRypOHWPHF86VzxG1BvHr5VW4Kid81nNvYx
 2K+7YklmgOrWUBhHXT+CvZ1EyZkxScC2XRTX7Ekml3SfyDaV2GVLHyErKaI+xaVsraxW Ww== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 33gnrr3mjs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 16 Sep 2020 14:54:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08GEilRZ148543;
        Wed, 16 Sep 2020 14:54:32 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 33h891sfph-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Sep 2020 14:54:32 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08GEsVpw017360;
        Wed, 16 Sep 2020 14:54:32 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 16 Sep 2020 14:54:31 +0000
Date:   Wed, 16 Sep 2020 17:54:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     erin.lo@mediatek.com
Cc:     linux-remoteproc@vger.kernel.org
Subject: [bug report] remoteproc/mediatek: add SCP support for mt8183
Message-ID: <20200916145425.GA768671@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=3 mlxscore=0 bulkscore=0 mlxlogscore=962 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009160112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 bulkscore=0 suspectscore=3
 clxscore=1011 mlxlogscore=977 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160112
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Erin Lo,

The patch 63c13d61eafe: "remoteproc/mediatek: add SCP support for
mt8183" from Nov 12, 2019, leads to the following static checker
warning:

	drivers/remoteproc/mtk_scp_ipi.c:34 scp_ipi_register()
	error: we previously assumed 'scp' could be null (see line 33)

drivers/remoteproc/mtk_scp_ipi.c
    28  int scp_ipi_register(struct mtk_scp *scp,
    29                       u32 id,
    30                       scp_ipi_handler_t handler,
    31                       void *priv)
    32  {
    33          if (!scp) {
                    ^^^^
Check

    34                  dev_err(scp->dev, "scp device is not ready\n");
                                ^^^^^^^^
NULL dereference

    35                  return -EPROBE_DEFER;
    36          }
    37  
    38          if (WARN_ON(id >= SCP_IPI_MAX) || WARN_ON(handler == NULL))
    39                  return -EINVAL;
    40  
    41          scp_ipi_lock(scp, id);
    42          scp->ipi_desc[id].handler = handler;

regards,
dan carpenter
