Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9510C2E36F8;
	Tue, 10 Mar 2026 14:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773153331; cv=none; b=qVFcZZzBn2i9OPEssVIeDcQXe32UZx1hfYLj9kA7cKSkkNOxCZR8VMYhQjMM3vvks0NrtGWT+6c0PxnQQsKqZkA48dljygaBBEqe8d4uJstmAXa4IoqCgsqTbZ5Pe/zyw/tgrWFw1t+UnfZS0zH6VbHs7kxj13FUSAXtdt8PRSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773153331; c=relaxed/simple;
	bh=MCaUrPZ7HH0j4tc8Pv0peQvEHxCMTJOGP8a7fiNrsJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ybxdf6vxwHPZ/KYJlqVTkbnEBWwB9Ov+gA6dgEzsuJVHqw9hri7yBkQvJTmZ2r9HP0KI+3a5hao5b15x8yMtlV4sC8mTXO20ixYD0wmEEYkly+++RYt8JLdWNs8T1N8R31bWbB3of3/hadxh5U/fLPwoxmEI/XyGW223S6jW7wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kioFQrk9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kioFQrk9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773153322;
	bh=MCaUrPZ7HH0j4tc8Pv0peQvEHxCMTJOGP8a7fiNrsJw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kioFQrk9hpQNl8vRItusxFTj3b+x03BuCXswwwB5fvv0EzbKu/tP2WQQFk2KFJQk9
	 J80TXeL8AHbz/7AUrSTZZPNAu4l+wO24Hey93re8DnweOihwLCQOPvEUlgifoFd9qd
	 Ae1bBGbOqfe+ghl8AZ3CpNpp5IhnJw0tCp72sXAurqtk6JJmbSYIoiDxE7sSJm9Qhe
	 1E2DB4mP5D4GAVKT0q/iDq6MdjUfn1tFI0o0BKUb9RQ656xSrDtHl2dQvBxBZ+7l2v
	 VFw3PepGSWsScTOha8D68l6Sivf4l61O9U+uAZ3Kw9pVNKaLXguZH9oEAHbN6W7lg+
	 LK74gVBrPhbBw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B509217E0EB0;
	Tue, 10 Mar 2026 15:35:21 +0100 (CET)
Message-ID: <8d965895-c77b-4d67-8365-3ea6a8ef5fca@collabora.com>
Date: Tue, 10 Mar 2026 15:35:20 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] remoteproc: mtp_scp: Constify buffer passed to
 scp_send_ipi()
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
 <20260310-rpmsg-send-const-v2-2-0e94c5db9bf4@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260310-rpmsg-send-const-v2-2-0e94c5db9bf4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 10/03/26 12:22, Krzysztof Kozlowski ha scritto:
> scp_send_ipi() should only send the passed buffer, without modifying its
> contents, so mark pointer 'buf' as pointer to const.
> 
> Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>



Please fix the commit title - that should be `remoteproc: mtk_scp: .....`

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

