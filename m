Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168536;
	b=oVwoGuCeX2p0+QYWAMgX4uX/Jfivx7Jy5EnmviI4fiS6ttRQ3rwhVlRnH6DZdKUHoUyD
	 6vpoYMyA/YNYADC8X0hRpnbn6RPLerCZO3rz70r9y29Gn7LVIisigYTuxouDf73D+jmIq
	 fltDgov7+lKr07axXGCoT1co8etxYhvDMBoO0comaiLt5sRmyS8m0QCSHqJWfRlb0vFOW
	 tqPu6SQ2WtDIZI4nXC+fMUfE+hhy0AD6TAR0NlMRTlu2htnfhWSAv6s1EEe4bJ7RSMJrn
	 Q76thzak+36eAfiNqw3qP9f58v7kLlQhmTJjVi+vw+tED/JFK0yrEo+ilKqLWC5zytg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168536;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LzYrNTyVysj4No8EOA4CxkFmJ7j+XdvH4uDhJMwjKg8=;
	b=mysWIjxFPUpqcIC2p3AAwprNdTeVoo2r5rtll5diOnUy+ZoLnbGHAzNewrrNv6uqr2DO
	 FcJas5lzkkPtKM2mGBK50hPVdOM0VNMwucWt8eWUbOatEHlCq0BZf8XGctSiYDsnWSgvI
	 8uoUpdjPLzL7n60Cmh43hFAJjX689TRXG+SPc6rn35ll421SysDZs0p3IMhPD6pCUovkr
	 IEJ5YmwDnpjsz1F3uZIkIZ42vQ4WDQCxWR2dvjlDpc1mkWcV8CDA2p/ql7efuIOYd+1kC
	 cNhrzogBFtdQj/y3b8FH6n6pLhtkt4ZBkgwZjAZ7/jLD2Obyt+k4EO3OSbklTg74QSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kOHDFY1o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8CF606D833;
	Sun,  8 Nov 2026 20:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kOHDFY1o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2407F1F00921;
	Sun,  8 Nov 2026 20:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794168536;
	bh=LzYrNTyVysj4No8EOA4CxkFmJ7j+XdvH4uDhJMwjKg8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=kOHDFY1o8ZNZlLBjx0INTl2/Y74Cm3seHWujoBIZSm86XhNQ/9YMIxb0VjmQYomB8
	 n43cQNbccJrSRxOtS35keiq3mVLRD58SGCX7u5YIOCYMjIORr4/Bx6DCWdsgasc9Xp
	 CFiNXHUGzldbImQ5w2kABspn9BR04SDWpeuQ3ENhj7/jyBHSDjmgIDd+zMqc5Ki5zS
	 sHSH2vrBhTOr6PpdDkSh8cH503ft53NQUz7eEB5wpUp6aRJpBAHFc4AFaZG4bp9H6W
	 mSU7MtqBGPnxyK/Au4FoVcxWAMVGBj7hhnzcLFZKRe69wBhifrnQeO+Hr3qOJ6aOkd
	 Vx8VOG0V8PCXw==
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
Date: Sun,  8 Nov 2026 14:08:42 -0600
Message-ID: <179416851781.24425.10775520009932499914.b4-ty@kernel.org>
X-Mailer: git-send-email 2.56.0
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

[3/9] dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
      commit: cf7fc0d6b1f3bc6564b1c75a3e22047b94234635
[4/9] remoteproc: qcom: pas: Add SDM670 ADSP support
      commit: 772724ad88a2ebd3826a0dd33dbfbbb11f0d4ca0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
