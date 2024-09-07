Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144F24C79
	for <linux-remoteproc@vger.kernel.org>; Sat,  7 Sep 2024 03:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725678052; cv=none; b=URIZRuSeIkpnn+gTjoOrqFPu8mGo6QIMak18s0NlpXwpIbMh5mSNm1wpo0ePydqSNtamhLMuRfBzRk844VndAvM6+sXq/EnmXDvCWqreKP4mTYvU2gtGyIB1BQjxMh7EwIqKLeOW+gEYgNkuXZ2XpTelfNqYiTpGslo/x1C+Bbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725678052; c=relaxed/simple;
	bh=ysYcaWnm3vnDUW6zbZAAbjZzesDVOv/2OXP/jpWE+XM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rBIWVQ+U0fGBD+UAPO8PxDCvDBOZlz11UzlTi9P8hYgI0v3Cg20Xq9SXf6c+KWCqVXhOsdOTnXDMLyJBMc5O6ksM6jELTPMjXCO+8Eak9dU9KhPiUs5yp8hq62C2Tz/Gcd5fvnhZPpGkJMsT4CGG4dyHURFeN2k9GtoH2zQjc6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4X0yX65yrDz69LM;
	Sat,  7 Sep 2024 11:00:38 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 4921F1402C8;
	Sat,  7 Sep 2024 11:00:40 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 7 Sep 2024 11:00:39 +0800
Message-ID: <819d4d8b-d72f-42c4-95c1-f10a1e87c8b6@huawei.com>
Date: Sat, 7 Sep 2024 11:00:34 +0800
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] remoteporc: ingenic: Simplify with
 devm_platform_ioremap_resource_byname()
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <patrice.chotard@foss.st.com>, <andersson@kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <chenjun102@huawei.com>
References: <20240906113405.92782-1-zhangzekun11@huawei.com>
 <20240906113405.92782-4-zhangzekun11@huawei.com> <ZtsnMHHYA9zlFdDH@p14s>
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
In-Reply-To: <ZtsnMHHYA9zlFdDH@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)



在 2024/9/7 0:00, Mathieu Poirier 写道:
> 
> You still have missed several instances.  I am dropping this set.
> 
Hi, Mathieu,

I have checked the subsystem again and does not find the missing 
instances that can make such conversion.

Instance like this would require storing the resource size or the 
res->start, so we can not conversion likt that:

------------------------code start---------------------------------
da8xx_remoteproc.c:

res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
                                    mem_names[i]);
drproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
if (IS_ERR(drproc->mem[i].cpu_addr)) {
         dev_err(dev, "failed to parse and map %s memory\n",
                 mem_names[i]);
         return PTR_ERR(drproc->mem[i].cpu_addr);
}
drproc->mem[i].bus_addr = res->start;
drproc->mem[i].dev_addr =
                 res->start & DA8XX_RPROC_LOCAL_ADDRESS_MASK;
drproc->mem[i].size = resource_size(res);

------------------------------------------------------------------

I have thought about adding a 
devm_platform_get_and_ioremap_resource_byname() to make conversion for 
these instances, but the function name seems to be too long...


For other instance like below, we will have code logic broken, because 
devm_platform_ioremap_resource_byname() will return error if res is NULL:

---------------------------code start------------------------------
mtk_scp.c:

  /* l1tcm is an optional memory region */
  res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
  if (res) {
          scp_cluster->l1tcm_base = devm_ioremap_resource(dev, res);
          if (IS_ERR(scp_cluster->l1tcm_base))
                  return dev_err_probe(dev, 
PTR_ERR(scp_cluster->l1tcm_base),
                                       "Failed to map l1tcm memory\n");

          scp_cluster->l1tcm_size = resource_size(res);
          scp_cluster->l1tcm_phys = res->start;
  }
-------------------------------------------------------------------

Best Regards,
Zekun


