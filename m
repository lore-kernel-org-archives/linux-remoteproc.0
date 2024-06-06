Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2642B3A8C0;
	Thu,  6 Jun 2024 11:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717671616; cv=none; b=XXBWCd50JVVxABMIyTwPqnXZmpxjuhr08vTKhPK5hUVX0JU2ply2xsODEYZ5aLnz9rJfAeG/n+QFYH6zr/D0U3NNvzb0vFmBHcrQpVg6vo9ToAg76p6fdajNGfQvehSxDI+MXZTm/RAD3/VPsLiauSp7bWNxhDlshJoBymRDPfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717671616; c=relaxed/simple;
	bh=JzIE2Q/8PA+vyQON4VFwI2P8T+iJyPY9/E/Fb2Kzq1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9/2tqkVwsKCbUeCFJtN0Ud+CWMVwuHwY/rAc71x5Qmmy4uDhx1q3Ad1iYzsPSetICbkqdmLsy3Kpb6HWVK/0Jc/IDLw/h6AnuMdqirqobe8N5qsKZGCLr45TkFPPqo83/W3C/3fiGFZmcyDFiUiCod1ZekJNITByWyf5H/J7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=0ZmMNiJf; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="0ZmMNiJf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717671613;
	bh=JzIE2Q/8PA+vyQON4VFwI2P8T+iJyPY9/E/Fb2Kzq1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0ZmMNiJfCXQNZ6B1t1p8nN0KJbN3Y0lJhaKaOnM2yopq9SmacDqCwiU8+zV7oxQ/G
	 LKkFhKvRkS/2g63MVpQl9pOg7mvmm7QzilHpD0emoMusur0ee4XPB5RuH3peLHPA2+
	 sDAkdrPgB6XjEfnqOEFBZjdEYOLGD0SmlLImdnZPIAytjjtbDpyWSsSKZqfCe+zEJV
	 MZpdwPL5ylCgJHhPnVRbGEw5XdH8+OhCF13Srg8PN7C9JDaDC2dF8JZE8r+GjWtPG9
	 Zi0qA0Sq9DDXUOhV5d23SAa0G1lFYv/0jjYywDb0csSEZgKMe8bPDzgBeqp1ApdJxR
	 /g+6RaZExrYHQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9813C3780627;
	Thu,  6 Jun 2024 11:00:12 +0000 (UTC)
Message-ID: <bc12b046-d2fb-48ae-bd5b-a6ef6cc78c07@collabora.com>
Date: Thu, 6 Jun 2024 13:00:11 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mediatek: Increase MT8188 SCP core0 DRAM size
To: jason-ch chen <jason-ch.chen@mediatek.corp-partner.google.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Jason Chen <Jason-ch.Chen@mediatek.com>
References: <20240606090609.3199-1-jason-ch.chen@mediatek.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240606090609.3199-1-jason-ch.chen@mediatek.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/06/24 11:06, jason-ch chen ha scritto:
> From: Jason Chen <Jason-ch.Chen@mediatek.com>
> 
> Increase MT8188 SCP core0 DRAM size for HEVC driver.
> 

....so the second core only gets a maximum of 0x200000 of SRAM?
I'm not sure how useful is the secondary SCP core, at this point, with so little
available SRAM but... okay, as you wish.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> Signed-off-by: Jason Chen <Jason-ch.Chen@mediatek.com>
> ---
>   drivers/remoteproc/mtk_scp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index b885a9a041e4..2119fc62c3f2 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1390,7 +1390,7 @@ static const struct mtk_scp_sizes_data default_scp_sizes = {
>   };
>   
>   static const struct mtk_scp_sizes_data mt8188_scp_sizes = {
> -	.max_dram_size = 0x500000,
> +	.max_dram_size = 0x800000,
>   	.ipi_share_buffer_size = 600,
>   };
>   


