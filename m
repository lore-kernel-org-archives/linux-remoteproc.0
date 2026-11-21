Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795253232;
	b=1cmYRhk5HbNV0rUoyOvpC9J0uUwVH4V3RkKHlNmd3LpR0f6UdY02aDAc4en/X/t9FOt2
	 LzWhU4A3VKatUcjJRcdK93nzteSm/zSdqQ0ONcMufd7wCYSg8VmV2qN5a7cgOpM3XcBjL
	 NlhM+rh3+4gnGlXEYnvuCP6pXxXeMJOaKPw8hriIBX7DS6DGe/PAJzJd6rA0Fcf+ZzBZn
	 AtY6zot78BaaFV3Aft1o8ALAct5XF7Dd0Svq9WDcTnIL64aS0ukaJ0luFc6rtgCtSzc4m
	 UbcHe/UheKqpt67EToHUTtTqvfSQL3aBgm6DW9KwhWSWRKODq+qzLyFWf3vpZCcdD5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795253232;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=rET3kefZAMMGm5z84Ogk5S979dN/zqnTQfW5Uun5HJ0=;
	b=qjbTNYGbUvEIT6XuLz/0aBrnWQ5TCLkpZYQbFiO9VztzdfeF0yMpsOKor9X71ygsqjap
	 KT8Sishb7z6v0LC2gb7lTgyBQM59Xg1Gqqnvozbu1nUMM0VW/SnopnqIC/8qO4zZvaUVO
	 T2KjDtu67/1RE3I1nYF7a0xgy2ntonSaJ2sL8sML7FvhvJm9FucbnCCXINDGXDe7wboZl
	 42L7Y1U0zzH8swoI86Z67C0aFSi0eVhWwJL5Pn9oE3olwpARbq8zu0hSunyUXbCG04pf1
	 II4ONJTsgGZUPtdA3Wz9xBcrlRede3zevO0Isk1/QmyngwPNs0x3xgyCda6Oz6mKqDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSEFpXo6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90861606A320;
	Sat, 21 Nov 2026 09:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kSEFpXo6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227781F000C6;
	Sat, 21 Nov 2026 09:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795253232;
	bh=rET3kefZAMMGm5z84Ogk5S979dN/zqnTQfW5Uun5HJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kSEFpXo6P+shEey8EWvZJFJ18UYQC/D1nxHXCtEQ5uJtSiAHu/N0UMT64xtAqOZmv
	 w/DKjJ/4d4+M0hTOO74jYKlO0cspFCdflFCgmfGBEI4G27CWM2oBvoogwYzGX3cG9w
	 zc2IHo83QddTHay4eD7rLY/Yukq/C4D6uQE1rqmx2a3a1KpAwbxv9DJne6Z3keWlze
	 093nS+ug3Rn3ifSFhX4ngSloHstA9Ev9RiOkehqyQn5hoN4iq1ZIhmIoa9YufnEOEp
	 ryQqxXxITGRO8FAU7+gs2BmcVT0Q3wenkLQiDaJvRF6inJFOUibQw39JaRG3fnS2ZZ
	 6usW6lXDzY+Jg==
Date: Sat, 21 Nov 2026 10:27:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 1/5] dt-bindings: remoteproc: Move iommus constraint
 to SoC-specific bindings
Message-ID: <20261121-spectral-terrier-of-whirlwind-aee5b2@quoll>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-1-9d9000eb50d4@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120-shikra-el2-v7-1-9d9000eb50d4@oss.qualcomm.com>

On Fri, Nov 20, 2026 at 06:50:49PM +0530, Komal Bajaj wrote:
> qcom,pas-common.yaml limits iommus to a single entry for every PAS
> remoteproc binding referencing it. This is too restrictive for SoCs
> whose firmware uses multiple IOMMU streams, and a schema referencing
> the common one cannot relax the inherited limit.
> 
> Drop iommus from qcom,pas-common.yaml. As this removes the property
> from every binding referencing it, define it in the top-level
> properties of each of them, with a description and the same
> maxItems: 1 limit, so that SoCs needing a different limit can override
> it in their own binding.
> 
> No functional change intended.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

