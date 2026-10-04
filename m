Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AC43B585F;
	Sun,  4 Oct 2026 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791100521; cv=none; b=LDDoErfDdUJVNfd2M15+rQ4n/wKzo1cDZxtjvq3bwHJzgHNLWYQBLMmGGvZUG/+syqIBMneFwTXZUZ9zFywsxGTq3VPsg2EAhkHXqktlmj7P/Rkp8m6aSRQOHZLXGqTRDkx38crp8M8Co32mSMKjijnKLMHGshSc1Ks1SOKu64c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791100521; c=relaxed/simple;
	bh=/AF00udnct4mKfcS0fWB3073WEf1h7l70Gjl/O3tvFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTqOF5qbgTEw+LYO6fU/5vO31R/cu6mr4qT5UTEJKeHwP0U+tItDhRX+8CUhOeTN73OCoSJbKGsgyuevT2BZzsGLaBWS9MqZYDojF5xZ+wqllItCr9BheiGumyVMBP9Zz/Tmw1+d+5u7oy/13l9uGGoCZS5+QwkPMfkzIbn8NhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWz0lagh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWz0lagh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894E91F000FF;
	Sun,  4 Oct 2026 07:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791100520;
	bh=fvBhmkW+dQQhror0YAOLkiadb2YkxXR2X4R8sYA7pkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EWz0lagh9jedC/Xicmla8z+MgFM8+PhnvDodvpDTdxex/qPp1QgNdRw76WwoR+RrM
	 7EjKfOXAkIh2CPh+mUNOfNnJGshIWFj7OhmGLwZj6EUNxfwkh7B4Zd3yYxSnQ3aepM
	 BdWJxJGjNIuKFmjgnjLF/U/Xvc2BnPp/qrbfHVZKnGMUrmw39BfqY+3wn2fnz9kip8
	 u82dMLzwEor3h5xlOSlFJ5+END4LFD2sqyp14yT60UY6c24fJBU51Q4n9i9vHInHzT
	 OyulB6aMXDqXkGU6YiHX5U+/C+i1QN9H6zQtUhMopVGKMGDSZJap4CYJHwCta08N6l
	 rGHr5M9Gl2hxw==
Date: Sun, 4 Oct 2026 09:55:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 05/11] ASoC: dt-bindings: msm8916-digital-codec: Add
 SDM670 compatible
Message-ID: <20261004-malkoha-of-satisfying-democracy-cfef3b@quoll>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-6-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261003175659.23536-6-mailingradian@gmail.com>

On Sat, Oct 03, 2026 at 01:56:53PM -0400, Richard Acayan wrote:
> The MSM8916 digital codec is also found on SDM670, typically connected
> to the sound card. Add the compatible for SDM670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml           | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

