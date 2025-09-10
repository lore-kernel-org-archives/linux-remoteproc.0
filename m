Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32878265609;
	Wed, 10 Sep 2025 10:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501716; cv=none; b=dmJlMxKFc6SQTbHDlJYvPQXZuXJeYQ6rCFbF9f3hmA+LRaXHaMFU9F8mnKPaS0lh/Q93ywmBY5k70GjcEBfGkS7ehkeI0R+6I/RGCb3sqri/BulR9l72UQiI1Z8zifsuJNqcRYi2K46m56Gs6PijSCcs2O4ZFgEzHlKY930J1yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501716; c=relaxed/simple;
	bh=I7MU1fHrHACBDvmNSiiCbviy8lO8iLrTXXsUak9sToI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sP7dTsoshDX0ZsgNbj2jkLVsXYM9y2g3k1Bk6xk47wXTAAGyluLhnKfi76lhSe5gupY23Y5AeppTZ0R0YW1jZ55RzZQDWEY26AyGzIQIoqIuclGnYIaH/J/dUPmE8FyEFUnTsetwTeV+CKtTQ6D18XZ2d8LlYIoicPrUFhCbstI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cMHZm2BSvz6LDG6;
	Wed, 10 Sep 2025 18:52:32 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8EE85140373;
	Wed, 10 Sep 2025 18:55:10 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 10 Sep
 2025 12:55:10 +0200
Date: Wed, 10 Sep 2025 11:55:08 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Fei Shao <fshao@chromium.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH] remoteproc: mediatek: Use
 for_each_available_child_of_node_scoped()
Message-ID: <20250910115508.0000785e@huawei.com>
In-Reply-To: <20250908044348.2402981-1-fshao@chromium.org>
References: <20250908044348.2402981-1-fshao@chromium.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Mon,  8 Sep 2025 12:43:25 +0800
Fei Shao <fshao@chromium.org> wrote:

> Use scoped for_each_available_child_of_node_scoped() to remove manual
> of_node_put() calls from early returns.

There aren't any early returns here.

This runs into some of the stuff that cleanup.h docs suggest we shouldn't
do which is combining gotos and __free() magic. 
I think this case is actually fine despite that but in general worth
thinking about the code structure and whether that can be avoided.

One option would be to factor out the loop into another function then use
and error return from that to call the stuff under the init_free label.

Jonathan


> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>  drivers/remoteproc/mtk_scp.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 8206a1766481..b123698feb52 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1234,7 +1234,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev_of_node(dev);
>  	struct platform_device *cpdev;
> -	struct device_node *child;
>  	struct list_head *scp_list = &scp_cluster->mtk_scp_list;
>  	const struct mtk_scp_of_data **cluster_of_data;
>  	struct mtk_scp *scp, *temp;
> @@ -1243,11 +1242,10 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  
>  	cluster_of_data = (const struct mtk_scp_of_data **)of_device_get_match_data(dev);
>  
> -	for_each_available_child_of_node(np, child) {
> +	for_each_available_child_of_node_scoped(np, child) {
>  		if (!cluster_of_data[core_id]) {
>  			ret = -EINVAL;
>  			dev_err(dev, "Not support core %d\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
> @@ -1255,7 +1253,6 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  		if (!cpdev) {
>  			ret = -ENODEV;
>  			dev_err(dev, "Not found platform device for core %d\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
> @@ -1264,14 +1261,12 @@ static int scp_add_multi_core(struct platform_device *pdev,
>  		if (IS_ERR(scp)) {
>  			ret = PTR_ERR(scp);
>  			dev_err(dev, "Failed to initialize core %d rproc\n", core_id);
> -			of_node_put(child);
>  			goto init_fail;
>  		}
>  
>  		ret = rproc_add(scp->rproc);
>  		if (ret) {
>  			dev_err(dev, "Failed to add rproc of core %d\n", core_id);
> -			of_node_put(child);
>  			scp_free(scp);
>  			goto init_fail;
>  		}

