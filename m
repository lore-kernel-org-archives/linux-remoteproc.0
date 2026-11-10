Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285311;
	b=A350YPq7r5+v7IJ4CpJyYvbNjKrORjV/oIBQABt7h+y64fK5/ueA29zGVNx/zeEel/r4
	 tk/drQCOOEr19oS5S2zkZFDIZFPYrMNNFXIHsek4LCnKfae+wZ+JIZWWmFHSAWoXBXv7G
	 JpSaIQl6h2BCX/qhdx9hJAZCohUdDJc0XUxljozwm4/4dXKMdK+riScW2AADmjZ0Hb96o
	 PUb8+LiGujtB3KNVAKwWpSy2eL11rxz63yHygacHo5Vk91isamEUe9ZRZu0Xni2CC630o
	 0irkAZaOTcMUGZPBzFaz7JRlWggbYToIToqzYyqIju8Zv2iJIctsXqPBONfYgSg2DGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285311;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=osSCQ6MRhgcPLXLd03zAi9lqyiYKKtOmetBa0dOdet8=;
	b=15F6vVTZla5tprK+i0l7uxg9oqbf34+HmcpKga3r88iqT6Ts8804AHoIbCLZr0XLDTQK
	 SBGFhSNbefx8bHhzTtOvrUfcKVSjj31iqYbxLsU/bqytTb0AeVcjTvvb2RDtxCfpEMXtl
	 HjACqtUV/gFj5rF+yceCJLNy02tEhRQChlTi/dpHXl2V6JtpVgzz4wMHrucCUzzR932sD
	 Y0dXuBNCRgJhGhVTjWdMxn9sHnyBpN0qa0dwu7jUZrpgn4U4F4QolvrpfjrVg0G6fAP7R
	 k7aFmjadNAaxd9tUcBxOf0t1WLsVZl2jDjURBa63Y2vIPhp/wn9T0d30YGDxvWbe42A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fMmpBTgQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAC6606A8BF;
	Tue, 10 Nov 2026 04:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fMmpBTgQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89DB1F00901;
	Tue, 10 Nov 2026 04:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285310;
	bh=osSCQ6MRhgcPLXLd03zAi9lqyiYKKtOmetBa0dOdet8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=fMmpBTgQv3AdZeIYXSg3466SIkU/2abOI1WX4DM7eWVC4MK64PuxpCLKdLAPMKi1u
	 CIdO9l2PuMqnaYDR9jhFlnUYeJCZnsd7aalw3D1mrB96zD/zwyCOI9eqpw9troBfUC
	 /bm2evMsgGgkI5uoBsRivMuVzdvbe+6xawMNi3uB/94J9DFr9rS+282zvPiFP9owA5
	 5HlKSLiFtNx1dRIgD5TyeddIK/6K0gEmvfQgOmQRHiwhXT8ZvbwHZdjn0IkYPTVFll
	 5QC16IUUbmcD2igtwYVHS3zrK/9GI5iiX/ichiCdKqhlBGc5w1e3qbfDUVr8o1TNoK
	 dTAbqiPOsFiIA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: Re: (subset) [PATCH v3 0/9] ADSP for SDM670 and sound on Google Pixel 3a
Date: Mon,  9 Nov 2026 22:34:51 -0600
Message-ID: <179428529329.1061455.1012375831394550332.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107022453.159341-1-mailingradian@gmail.com>
References: <20261107022453.159341-1-mailingradian@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 06 Nov 2026 21:24:44 -0500, Richard Acayan wrote:
> This series adds a user for the SDM660 sound support code [1]. It also
> adds the ADSP remoteproc for SDM670.
> 
> [1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com
> 
> Changes since v2 (https://lore.kernel.org/r/20261003175659.23536-1-mailingradian@gmail.com):
> - stop using fallback compatible and add lcx power domain (3-5/9)
> - move lpass codec bclk from sdm670-google-common.dtsi to sdm670.dtsi
>   (5/9, 9/9)
> - reformat q6dsp dts (5/9)
> - set flags for codec interrupts (7/9)
> - move "qcom,..." properties to board dtsi (7/9, 9/9)
> - add review tags (6/9)
> 
> [...]

Applied, thanks!

[2/9] dt-bindings: soc: qcom: aoss: Add compatible for SDM670
      commit: 9d1c507083783fa16a0f510b8ed7bac1e151f856

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
