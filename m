Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A35142254A;
	Sun, 27 Sep 2026 18:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532607; cv=none; b=qqO0oQP1FaaQaUnORQwC8GapU+yRmRlJnLxMDAxf7Rkr8Q6e4sIMothGevQ+dcmTBpd3NjP0/fqxDoQ5QNCdx2PaZExwxYdTnxTWk2zIS7ve+qo/dtLQUJ0XAPSha5XS7sacgxEvFlzPCLzdNn4GZR2WPCjHUDt8LITaCu3zyUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532607; c=relaxed/simple;
	bh=EvtVRlpSDUPysbdXVjwUCnDYj/iEx99J2iRN+JvNyTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cY5fM4R1ArMtlqf6yQZcluned53BTtlS+WmnSCT9nvOBvNIKNidk9uuQdDR4jAgXAZqPjXb1rrRVrejjw4hypu1PtUtjzAhb83vNeV0rgMQcLrrdJw06fJQXIJq/u2WbWphr+PdXEsU8fJXetXTwzIL/ZLyghHjbDlV589ZsWCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0Zc1boB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0Zc1boB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D201E1F000FF;
	Sun, 27 Sep 2026 18:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790532606;
	bh=6lMaYelfxql8GUfEgKJBta9gJPamzR7w7JWi+8Hcn9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g0Zc1boB/a1P6BGWkNGuxNVBumegFy4LDYw5BKwSAaH3Cvgupazp6o7FnIJH/NMKD
	 eiGhWJBgEueOkxGPnBlaBLBt52nqOEyYupyV8WK41tukkbkYtq9mq2e+PsQMF8Ca1v
	 Nyuk2qQjp2ojttCBqiYr6ZVsweuwkzr+hzqyljr8bZBwpEqNWz2zHNL6Ipunf/1KGj
	 vUB+kJwHBWZleHIzYKTReBfhP2t/aBO/iyVkDSAjdoeIR4EJaeiLjdw/xaUKXfqndK
	 Y/lLHsjJ5YpSbH7ZxGeL6jxxOndjC1fFNXVOwqtjGCSdDQxI1LwunAVhTDS42XZUYv
	 8MPUgJQd5ZDZw==
Date: Sun, 27 Sep 2026 20:10:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 03/11] dt-bindings: soc: qcom: aoss: Add compatible for
 SDM670
Message-ID: <20260927-unselfish-maize-swift-c22963@quoll>
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-4-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922015801.32373-4-mailingradian@gmail.com>

On Mon, Sep 21, 2026 at 09:57:53PM -0400, Richard Acayan wrote:
> Document the compatible for SDM670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

