Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974632E5B09;
	Tue, 10 Mar 2026 14:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773153331; cv=none; b=CBx4UoehnGfTWZJqdEA3a1mfhivjl3QeX08Gh+EpBBwoGk7xg8DJNzwin31GiIxioGGw1GlYrHpPAdIa8cdS7xaATbsV+ObyvivVZXydC37kJr/KoXToM546WsHiUuTdB6gB5bm1IsB9RDK8r7vBSG06hGfKpd2hQfqYZbetCjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773153331; c=relaxed/simple;
	bh=i9yJ9pRi2fspdy5B+ragvbbhvuj4nCBlo3PLYcUWQkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sscSMWTXGAHEMR5Yp7dx1UlprSvvGHLmeB3BYyc+vozxumF77blpa5l1aRI3/EI07lMLg76hvtaaAOOw7n5a7xu7T2sWLUVY6GWaCwkwE7aYQLhoF4caSHwU8m9fXLCor4KCgj6hxLlIQFXbos1QNMHNlXx0d31lVi2tFCbk6pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FNfhRcLn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="FNfhRcLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773153323;
	bh=i9yJ9pRi2fspdy5B+ragvbbhvuj4nCBlo3PLYcUWQkA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FNfhRcLn65GaYJlZv0bP0T8USQp50RpWKPufbPN6GWQ7+TYwx4CC69TkLlJwJ+mcZ
	 if0WY/RdseFKXn11K/XhqkskOIqygKdSPbFb9H2UUug590Leo4sUMsSdYR1cGZEINS
	 X0QX6L6GqyJIkQ+YL63HuILaEUnUxrPtAWPUMh2Hq1zV6QhcGcLsSqcc/l6PKBC4Uh
	 TOptS2UM1LREFSGTnlz0jUyeaSyAfc7fvFOvVgHvlH5JeBvtbLwkR9XRpRz+0CkslQ
	 VWx/1H5eisK/YjffDnc3eLFfUTkFwROAtymsz/aAs0gQgUsrYQF14VcZmBO8rEzAQ9
	 R3o+fWwozmoTQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C860217E13A8;
	Tue, 10 Mar 2026 15:35:22 +0100 (CET)
Message-ID: <213cdf5b-eb48-4fac-8023-5d1d80d6f1ae@collabora.com>
Date: Tue, 10 Mar 2026 15:35:22 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] rpmsg: Constify buffer passed to send API
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
 <20260310-rpmsg-send-const-v2-3-0e94c5db9bf4@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260310-rpmsg-send-const-v2-3-0e94c5db9bf4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 10/03/26 12:22, Krzysztof Kozlowski ha scritto:
> The rpmsg_send(), rpmsg_sendto() and other variants of sending
> interfaces should only send the passed data, without modifying its
> contents, so mark pointer 'data' as pointer to const.  All users of this
> interface already follow this approach, so only the function
> declarations have to be updated.
> 
> Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


