Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF3F3546D2;
	Fri, 31 Jul 2026 03:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468405; cv=none; b=az5nP817hpB6E8KKpKgFcYHekjRa1dAqNIkjdC2+0ZShwnNXPESCg5IfTpBE98ml7Rsp95ZzZ3xoCTalbt48AgJpgtsUZEb2fh2mC7SuUr8UiCvG59Ze6VDvdNVjMvMVRF6ZpFJ+pm0anG9uVLT7XwsSaxPHdvRT+NW3iokNeHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468405; c=relaxed/simple;
	bh=JTbmaq+vcWWFTeKxXs9RVIM/nXz/dFCWBlNS2S9NuJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q0hA+aviy+njjEH0rx0GV9pi+M01U+SMsHdgOw9S1s1F5EjSZ5R4VkjSsRP1fdWS30HKgwYVLPAxO1ZbbeHPrzRZJOuEq5qv5zcFts75v+t0dSiJsUP3UOTkxP/ZcIebHn3Tw0c5WjBkqMxhciEnX/od0GeEeLhMDnMzMQOTRhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByH2Yg1O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByH2Yg1O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE23F1F000E9;
	Fri, 31 Jul 2026 03:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468404;
	bh=xLI5gymk0YbG7KZ7iW2uzTdNxcvo2S/P2vvw2NQGkiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ByH2Yg1O6XLy45gbD02VdQYD2UPbcDofhAG4VMKZlLu1Y1N2WUw4EiyEEGV7CvfFd
	 c4VVyBQYZym8AGkEpj3V2Xxa7BfBc2LeyMpS5PVylhgx4HWsBf3CVVr36BulqxNuXi
	 jN8EAxuTe6PX+RaqT7ZNi3gaKYcpA0J0Iwkn2g0js1yMdVfk0B87C1uGYyQdI/n8WM
	 tQ45HxJWG3GFAvgbKNQGCtAdsi2UiuOoqhnNoAOHEACNrCGQ2/fhGnvzcl6Vp9gWbL
	 Y+Qwf46h67PSXqE0xUqFN27dJBaKsEpg4V4/n3wlfUj2nyufO8O6a8Ek5Ona/p+5dJ
	 w0X+0Yfr83oFQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/3] Add ADSP and CDSP support for Nord SoC
Date: Thu, 30 Jul 2026 22:26:36 -0500
Message-ID: <178546838835.317434.4276793731151005966.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
References: <20260729023508.879752-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 29 Jul 2026 10:35:05 +0800, Shawn Guo wrote:
> The series documents AOSS side channel, adds ADSP (HPASS DSP) and
> 4 CDSPs support for Nord SoC.
> 
> Nord SoC actually has 3 ADSPs. This series only enables ADSP0 which
> can work independently. The rest two instances have dependencies on
> ADSP0 regarding start/stop and SSR. And remoteproc framework doesn't
> seem to support such "slave" instances yet.
> 
> [...]

Applied, thanks!

[2/3] dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
      commit: f0b6c2b40f78db917e72a5d273b031e99ab2c0e7
[3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP support
      commit: 29a24fe87bc80d81fc5d3b0d7e7615985c0ac29d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
