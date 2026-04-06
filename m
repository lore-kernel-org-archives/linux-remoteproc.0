Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B14386C04;
	Mon,  6 Apr 2026 15:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488211; cv=none; b=cZfIeuBl2LqPVHb/ZR2cDKN+4pDwXDMdwSum6DNSIdeoP5Bzm/7yswzQRJ5LATa0cukeJW5UKmKkooYPFH0WsOw2WQEykr0YtAFShqsqmgk7GOqp+XIpv0TsKFx5yUUH3WoKiumAD/XdsKWuE5hDVt/Bu8G8Y/KqHgm9H9iteEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488211; c=relaxed/simple;
	bh=7qkIHfQVLcoQezNsVQifK9LFrH/5VNd34wwBfkCPenI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mZOaOXIkwS+FqnYWVy8qLdu3XNsOQhWEIjk1ditz117D3wk2EcfL06FWuHT2z9ryFfYOFtxk3sRE6kfCs5YBvVYuNIBoxBsAQnz0SV1V037tZmLJMLl7LU3ttvDFexB8jVDvBCLKRH2w6c3DMk+0AeHuakFqjVNQutRyLdWpGZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WIFrzrJv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIFrzrJv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A6F1C2BCAF;
	Mon,  6 Apr 2026 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775488211;
	bh=7qkIHfQVLcoQezNsVQifK9LFrH/5VNd34wwBfkCPenI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WIFrzrJv5Bp7FEpK5WpiBeY5ctfo9JX8NhEbxV7nd3R2ZEFiygOhv28TItIy0twSN
	 eIEwIxURWFdOeo2o7RSZ4PcKTp2bQwLC6D0Ai5q9fwyAsLjbb/JLU6gynq8uBlSSQk
	 zvHcIkOc3VaoWfvDkGWYdHUqgPhXgVEm3M3Quvx2P/ofQLuwu4iFmA760djGd0c55k
	 IQc7BW/ScFTlvfxYTnE++1G4yHFB1/KjYp54isX3lwj7zw0I9Krgnv+edaKkxECMv9
	 MFCS/Nalby2hCsp5DtsQeHZyhBA/vxZY2lQY1zsMlUlz6hTj6kaX7dXo0V7nK3NN7j
	 /v2dcS4MX2DKA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify buffer passed to send functions
Date: Mon,  6 Apr 2026 10:10:00 -0500
Message-ID: <177548820150.2290739.14526256413084425131.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 17 Mar 2026 13:36:49 +0100, Krzysztof Kozlowski wrote:
> This got acks from Mathieu (remoteproc) and Mark (audio), so can we
> funnel everything via Qualcomm remoteproc tree?
> 
> Dependencies / merging
> ======================
> Entire patchset is one logical chain, all further patches depend on
> previous ones, thus everything should be taken via same tree or shared
> between trees with tags.  Probably everything should go via ASoC with
> necessary acks.
> 
> [...]

Applied, thanks!

[1/5] remoteproc: mtk_scp_ipi: Constify buffer passed to scp_ipi_send()
      commit: 4251dab9d176212afdf4ced263b59bc0d5292c7f
[2/5] remoteproc: mtk_scp: Constify buffer passed to scp_send_ipi()
      commit: 90dacbf4bf13410c727ffaca8fe3ce3276ae58c2
[3/5] rpmsg: Constify buffer passed to send API
      commit: b8077b4da2e89917ec4c632b66e60d49089bbda3
[4/5] ASoC: qcom:: Constify GPR packet being send over GPR interface
      commit: 66ec83627902d2585e14911692b317496731767a
[5/5] media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
      commit: 3e2fa997d1e2b651993ae7e81646aadd55470bce

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
