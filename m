Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BA8C433B4
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 May 2021 05:27:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55344613DD
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 May 2021 05:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbhEGF2E (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 May 2021 01:28:04 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:40392 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbhEGF2D (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 May 2021 01:28:03 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1475Qx1I141751;
        Fri, 7 May 2021 05:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=bZpkfLXGxZtRvQ/gObGoRXOlarwb1F5b9uEOgTU4I9o=;
 b=FuGhtglCltEYd/yz3iuuwispNUUL5X87Kc+UEDy01n/2FArYo++HnzIXQfcxbOFe8IOA
 DQQtV313MiyzD/msQCgQiMjBugCWx/HY3aNPtaM5xzGmUMcHGp0VsIgrru2bGT8OBSUd
 1KPAonA1ctvzZtBglDsDVjYEnNodXmkn/CEnlZocaAK0ZwZUEeCvQgVjacOYquA6NGs4
 R0aCb7mil/tLcEx6fKIq9UcA4JjOJTo5xLkxO/uLsZN20IMNzlsI0jAIfw9sflrTJ06d
 Fdus5iHtUKHO7Th66USzts3hbkKE8KiKBksY5l0NUpXuwgiyJdXCBetM8koazoQEWvCE 6Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 38csrd8dm2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 May 2021 05:26:59 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1475PYTT057069;
        Fri, 7 May 2021 05:26:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 38csre31sb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 May 2021 05:26:59 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1475QxOR064677;
        Fri, 7 May 2021 05:26:59 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 38csre31s2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 07 May 2021 05:26:58 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1475Quck022006;
        Fri, 7 May 2021 05:26:57 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 06 May 2021 22:26:56 -0700
Date:   Fri, 7 May 2021 08:26:47 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] remoteproc: k3-r5: Fix an error message
Message-ID: <20210507052647.GF1955@kadam>
References: <d6e29d903b48957bf59c67229d54b0fc215e31ae.1620333870.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6e29d903b48957bf59c67229d54b0fc215e31ae.1620333870.git.christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: 1Fdh73NuUvaIFOnsbuhr-OEAzHDGF50-
X-Proofpoint-GUID: 1Fdh73NuUvaIFOnsbuhr-OEAzHDGF50-
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 clxscore=1011
 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070039
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, May 06, 2021 at 10:46:01PM +0200, Christophe JAILLET wrote:
> 'ret' is known to be 0 here.
> Reorder the code so that the expected error code is printed.
> 
> Fixes: 6dedbd1d5443 ("remoteproc: k3-r5: Add a remoteproc driver for R5F subsystem")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 5cf8d030a1f0..4104e4846dbf 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -1272,9 +1272,9 @@ static int k3_r5_core_of_init(struct platform_device *pdev)
>  
>  	core->tsp = k3_r5_core_of_get_tsp(dev, core->ti_sci);
>  	if (IS_ERR(core->tsp)) {
> +		ret = PTR_ERR(core->tsp);
>  		dev_err(dev, "failed to construct ti-sci proc control, ret = %d\n",
>  			ret);

I recently learned about the %pe format specifier, which prints "-ENOMEM"
instead of -12.

		dev_err(dev, "failed to construct ti-sci proc control, ret = %pe\n",
			core->tsp);
regards,
dan carpenter


