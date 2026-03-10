Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329BA2FA0C7;
	Tue, 10 Mar 2026 14:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773153334; cv=none; b=XxyFTrzKpu+WxOPkFH+DNqjY91M4ZYtTdU/vP1hYSvBi7nOaTbvA7QptnK3HnDsdfJKTjCoPFnZjJob+LXg7jE7JyuYBV0hCrLrqTvktNyt8AWwOdKQVM5bJ41R48PQ8UqspNTJpjG9g0Kl7iVLx80fD+ajxE4qmaWwImmz4GP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773153334; c=relaxed/simple;
	bh=I3ivQi2ChJ94YeNeg1ow1Xv3TT7FwdrmIrvkpNkfC4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Me8lMk5rb7whdqaBMtcYwypaYRK7mBMTcZZyBkFbbJ/UagFnsUEJBAD+a+/r+/xoV0ynexTA+6B7qfoOYLKuJLpvM0mpfL3g+RzQGvcuLhJrBGL8H5lnW3/EGf2nylx/GT0c0tGw/eUlZquanHnyUb3btvhiZjcPV8A3SsxTcVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PVHIwtzm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PVHIwtzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773153326;
	bh=I3ivQi2ChJ94YeNeg1ow1Xv3TT7FwdrmIrvkpNkfC4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PVHIwtzmzXzCCi+0ShIUUqVRfuyZnQDUT4mlXtHUC3YwM0ciw4/ovJBRkfHug4I1V
	 RqVMdwXAJWIaSbA4lLyoW88/2N3Qd3D8bXjY9XDjXuE+p9cVXUt7rmIkVhuZK9ZqtX
	 Gf6rN/uMT7+3wCyo46YVd+8msYbtf8NYCT8JHbIKzENuq2Ft/s/SHZx1b+rBotaUXf
	 UVZZHWBZQFOufQpujrjlTaVHDBzHKUAtROfM6m/8JN5zmxUkDg3gHyHGmKKwgHUK8t
	 VfXyKOIpcZknSAn0g+eh/gXctMV3ETGdZgMzs9KdFTRNSnQ8WY0DXV2axp8cINSV4h
	 3P3dmF9XzmXMw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C0ACE17E13C1;
	Tue, 10 Mar 2026 15:35:25 +0100 (CET)
Message-ID: <6c2c9803-1210-412a-b391-660735e1d5fa@collabora.com>
Date: Tue, 10 Mar 2026 15:35:25 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] remoteproc: mtp_scp_ipi: Constify buffer passed to
 scp_ipi_send()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-media@vger.kernel.org, Mathieu Poirier <mathieuu.poirier@linaro.org>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
 <20260310-rpmsg-send-const-v2-1-0e94c5db9bf4@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260310-rpmsg-send-const-v2-1-0e94c5db9bf4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 10/03/26 12:22, Krzysztof Kozlowski ha scritto:
> scp_ipi_send() should only send the passed buffer, without modifying its
> contents, so mark pointer 'buf' as pointer to const.
> 
> Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Please fix the commit title - that should be `remoteproc: mtk_scp_ipi: .....`

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

