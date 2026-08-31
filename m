Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E0937F8C6;
	Mon, 31 Aug 2026 16:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194941; cv=none; b=Tx8Kphb2wDXhrphnG+cZZMo6L/KStqPCZXX0larEGKab9SQPiTL0Lq2vp4bpVWJL1WVknO7LylVP9RP+MfwsMy+l8eD+m2aOwt4gAyHoTNfEYR6car9eNBxOm4yyipEGXS8n2NG2lx4o9R0DmFbs+YbjMrXpYike/7vLo2LvAHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194941; c=relaxed/simple;
	bh=VZG3uUFhIPgFmzl/+YW9UcNyfkvQR3HbVdRDyFsWZX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BXOcf1cLnvC9ynbQVYm8v77J4Wv0bhazn9kovl0RUaxie43BLCvDCauPaOL0IFjyekUyUCmTgKi6M5v5oHgttM7Qmr1JHCNi90+TSsYJsiPA2CuNlapuJ2vpP6agH76jvLywWlikXjS8XbQ08lbIeF/psM5YPdO3Z4M/fgvq42w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icq89GsA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icq89GsA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254E01F00A3F;
	Mon, 31 Aug 2026 16:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788194939;
	bh=DrijZiHp1MSMmPFn9jwJHrO6WTjvq2apKpiKao66RNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=icq89GsAU1ga6ZC0TRbu7aJvRRaRHXyPQ3MthHppNxeR45ofWUeXZorPD9t87kRTV
	 agegYRKR2Tz2fa1h+Y6UdlY+gZQAJRVVSC3j2iG82tpSGaEM7OfxtUaTIveSGW76Wa
	 zlwIte7qlzIz4rDRLINJPguRArT4KhR577uZU1j4uueLB7nRSpOMfY8re757mfZhzU
	 PTHOSQuqxYcHLvlZWVNRGXCpWTVc5Ah5vRh6YJzjBRusKyDRb4wXZv0cUBzBw85zDZ
	 umcpaWK0qRrt0kzOEH2sbGn4Sk6ZnFsz0vEw458EMAtfuCjN8T2HUsTVK3m0pSYuDy
	 SUL/1n4WPRoTA==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom: q6v5_pas: Don't enable handover IRQ on attach
Date: Mon, 31 Aug 2026 11:48:50 -0500
Message-ID: <178819492780.1319417.12142205913064250494.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801011731.1084591-1-shengchao.guo@oss.qualcomm.com>
References: <20260801011731.1084591-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 09:17:31 +0800, Shawn Guo wrote:
> qcom_pas_attach() unmasks the handover IRQ and marks handover_issued
> even though this driver instance never runs qcom_q6v5_prepare() for
> the boot it is attaching to. This was believed necessary to flush a
> stale interrupt latched at the interrupt controller while masked, but
> the handover IRQ is a Qualcomm SMP2P soft IRQ, not a real edge-latched
> hardware interrupt. The Linux SMP2P driver updates its cached value
> unconditionally on every notification and only delivers the nested IRQ
> for bits currently enabled in its own software bitmap, so a transition
> that happens while masked is simply dropped, never replayed on a later
> unmask.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom: q6v5_pas: Don't enable handover IRQ on attach
      commit: 34b8b2d78b6276dc2dc4ebc06625a39956f266e4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
