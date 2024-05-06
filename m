Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206B535280;
	Mon,  6 May 2024 12:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714999829; cv=none; b=AX9p78t8WAGYRnsUuIvaGYDIvyw0LuUkvmxGsZaRXGR+SMv4ZHFa7mzMt+YnFmwYWdQYnaUM4+wn+esopkgEDLdiFLU9bNfXhHfG1AEfVhXD3k3CGAwv8Kfh25GtoC6AzefViNZdwrHzrkERZvEWPGz6VpEP/eYUgjKpQbXB7eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714999829; c=relaxed/simple;
	bh=7YmFAKYR4v2H/+//mZ++hNH0JQRI9liSvEk0JvHYCDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBAMwXahd1V9djyJZ9yPZ7YDelbU1o5FqkVv44NlMxrajfIFpYDncyJ64O0Zac8WlXuSw0g0/D6P+1HzadSC9SA643RekLhlSAabOL7NdA7G46zXRYsWbUlqRHQjyEdTM+U7RSTRbpTjBJolXvXzHUI9LwZK/WDxmr6r03FZ1LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=i8KFlH6A; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="i8KFlH6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714999826;
	bh=7YmFAKYR4v2H/+//mZ++hNH0JQRI9liSvEk0JvHYCDY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i8KFlH6AamyBlWjrQW9iREnPXwHPMfII4+McxwIl577WfJtA/6aR5l2FM7I/nqoXG
	 faMYdZFR7GLYhlJ2dOIuYwYaGKb81WK5kXPJZoIln53XaVX7pqW093ee7s3U9p3EmO
	 amG8oPfOXYLCpIHmOq1i/oUXNRp4VIBp4LGnf8ksViwv0rarxbkhg3HolFR/dShDqn
	 E0vjJw5DYeGyZVOadgE+wPjLeyGDnMCoU19r0Wz0qzgff24Q5/Z71BwDusEvGOjbtc
	 uX/k329PMkE1Q6hpRbnEAWxNDpNcI4mS6SsJ/7nTHiYv8Wb0gKdc76PZ62cpm+Q4b9
	 HG32n7WzKDhMg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DDB5837813E3;
	Mon,  6 May 2024 12:50:25 +0000 (UTC)
Message-ID: <d368c0c2-bffb-4801-a6be-c83dea738b70@collabora.com>
Date: Mon, 6 May 2024 14:50:25 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mediatek: Fix error code in scp_rproc_init()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Olivia Wen <olivia.wen@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-remoteproc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <b2114e3c-fa64-4edb-a1ff-d2009e544c3f@moroto.mountain>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b2114e3c-fa64-4edb-a1ff-d2009e544c3f@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 04/05/24 13:26, Dan Carpenter ha scritto:
> Set the error code to ERR_PTR(-ENOMEM).  Otherwise if there is an
> allocation failure it leads to a NULL dereference in the caller.
> 
> Fixes: c08a82494500 ("remoteproc: mediatek: Support setting DRAM and IPI shared buffer sizes")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


