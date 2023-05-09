Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75CEC7EE22
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 May 2023 06:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbjEIG2o (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 May 2023 02:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233784AbjEIG2n (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 May 2023 02:28:43 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5BF5FC9
        for <linux-remoteproc@vger.kernel.org>; Mon,  8 May 2023 23:28:42 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3495mClX029692;
        Tue, 9 May 2023 08:28:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9N6fYPnUUvTEGjaaLDX5DUJAdquys4ahCIrcHURD4gU=;
 b=XWxK8FFnSev0bGvo3LzH4QIg9Ed1Vo7PpGzCS7cZItp3KKdtOPg/0SCv6+3yMayPLDSE
 u125+4oIdmwqS6DUBxqmaG/nsQb+GNOF8n9geT5G0BXrpCBpDwZCwz7frFzWWk/NlbDN
 vebAjbiOhZFjLnTti91Tv3KKffElC1BlOY+rnpXHbz3k1r4Z19CZPszfmmY1jQVIYEZI
 YD6+RhDu6OYg/+rQIDprprK6as9qYoULtxfy8cmMERejpqOQ3c824nBnyVvGsfjmRac+
 ayZ2Dou9w4swjkyzPVs8X3NI85iKly2kJhVbQefLY+dCkAtuYFub3/rDvMARadsLpOX7 Rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qf790jfcp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 May 2023 08:28:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B3B010002A;
        Tue,  9 May 2023 08:28:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43B52210F8E;
        Tue,  9 May 2023 08:28:25 +0200 (CEST)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 9 May
 2023 08:28:24 +0200
Message-ID: <6594eb6a-b111-7d0c-3d06-b91a83e02d9c@foss.st.com>
Date:   Tue, 9 May 2023 08:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 16/18] remoteproc: st: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <kernel@pengutronix.de>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
 <20230504194453.1150368-17-u.kleine-koenig@pengutronix.de>
From:   Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230504194453.1150368-17-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_03,2023-05-05_01,2023-02-09_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Uwe

On 5/4/23 21:44, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/remoteproc/st_remoteproc.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index 3f1b8963639f..e3ce01d98b4c 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -448,7 +448,7 @@ static int st_rproc_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int st_rproc_remove(struct platform_device *pdev)
> +static void st_rproc_remove(struct platform_device *pdev)
>  {
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct st_rproc *ddata = rproc->priv;
> @@ -462,13 +462,11 @@ static int st_rproc_remove(struct platform_device *pdev)
>  		mbox_free_channel(ddata->mbox_chan[i]);
>  
>  	rproc_free(rproc);
> -
> -	return 0;
>  }
>  
>  static struct platform_driver st_rproc_driver = {
>  	.probe = st_rproc_probe,
> -	.remove = st_rproc_remove,
> +	.remove_new = st_rproc_remove,
>  	.driver = {
>  		.name = "st-rproc",
>  		.of_match_table = of_match_ptr(st_rproc_match),

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
