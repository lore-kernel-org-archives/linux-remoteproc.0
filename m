Return-Path: <SRS0=BznH=7C=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 085FFC433E0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 20 May 2020 12:09:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C88BF207D4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 20 May 2020 12:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="tUwGok/e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgETMJ0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 May 2020 08:09:26 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:38266 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726857AbgETMJZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 May 2020 08:09:25 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KC7cvO192422;
        Wed, 20 May 2020 12:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=o7T4F3P2WqySm0CYgUXnMJepL9DfNg/WBzj9WeyK7eA=;
 b=tUwGok/esi+XX3kwrrrNBUziMOQ9m9hUlscdz45Cnch+HjVfCoiliWMrmDFSqr/1WMg6
 zZxHEXQJRmbMqC9bqU92FRO/JjA6jJWBnTTwkrs64pXIry//bu2bKN5viEST6/m5py6r
 ZN71LsGb//NT161yshc+ONfCbaKMOXRRkMAMz6z57hkx9P19w68HPIqPeoaUkucJos2G
 jU8W3tJrIW9lYUR+2B9x7C9inaWMW12f1UIjbUuh+RySxUSt3UMfKsmF/xjk4sBiJ1nh
 jyQrDjmE597U9xR7FxqDplug//yCONsYxyByEtDnEdsdl1KKSsiHCyMGXNFcHInRzCku NQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 31501r9850-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 May 2020 12:09:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KC37rx085443;
        Wed, 20 May 2020 12:07:18 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3020.oracle.com with ESMTP id 312t37f11g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 May 2020 12:07:18 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04KC7BgQ006170;
        Wed, 20 May 2020 12:07:11 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 20 May 2020 05:07:11 -0700
Date:   Wed, 20 May 2020 15:07:05 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Paul Cercueil <paul@crapouillou.net>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: Fix an error code in devm_rproc_alloc()
Message-ID: <20200520120705.GH172354@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=2 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005200105
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 cotscore=-2147483648
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxscore=0 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005200106
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The comments say that this function should return NULL on error and the
caller expects NULL returns as well so I have modified the code to match.
Returning an ERR_PTR(-ENOMEM) would lead to an OOps.

Fixes: 305ac5a766b1 ("remoteproc: Add device-managed variants of rproc_alloc/rproc_add")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 0cc015fabf78..9f04c30c4aaf 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2297,7 +2297,7 @@ struct rproc *devm_rproc_alloc(struct device *dev, const char *name,
 
 	ptr = devres_alloc(devm_rproc_free, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	rproc = rproc_alloc(dev, name, ops, firmware, len);
 	if (rproc) {
-- 
2.26.2

