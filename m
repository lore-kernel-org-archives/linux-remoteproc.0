Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686BA3876A4;
	Sun, 27 Sep 2026 18:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532523; cv=none; b=riQ0T/nfuqTEFDXEjTyq8gviXs2SWpfo/qdG0sxF16Vfqo24RydXQk1v1pTWPvyyVywoYrHaenxK28q0E+4kRCddAb38oFcU6rNxRzXZVRl6kT3Z9i2zfvUlln5lHUnlgQJefKwnKKnqdq69CqjwcwHZmArHjO0SH9gXPxncY88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532523; c=relaxed/simple;
	bh=u12NBst2yVkd6gao3EbV4yRWjnMNHdZ2d9doBslX6Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agw142WivmYFga904eAXJmuKChVN1YakGFvk9bq8RijE8Db+chUpyxWT9frIxhj5hTQ7cWidlRtRw/z3LKST98V44RaMh2JDsvPA4ptTYyX7L9t4Rc1JG4AIFH1qLSFVRek8OwYioM3I1U42bDLVjLbn6O5SL9YFs9qrPYVjc7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CBCBzdg7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CBCBzdg7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F901F000FF;
	Sun, 27 Sep 2026 18:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790532522;
	bh=kWH7XWQMx9EHrUltVzhx9D+qXz/F74/efins/aZaPW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CBCBzdg7pQL5JCyvRcD1zyOAoHgLgo5QPVnTjQe0PHhwTNCWIxNv1XvLTMUY+WLdR
	 ihBkilqW61LcyeJymzj2nhlKkxZI2p59wM75kQJiGzCWRdaEEdXTHzFUeAUiB3OKMd
	 VD7biXAxv7Fc1Sl2hjearQ1QC/bYekGP9QNnOTg2fEFpBygH7F777oykB3/jy0mapB
	 YmaKveOd0UpvLkHF5v8tvnsVnV5dvDoTt+RBjWL/YXmqIoRiwGzJLmDnXqs0W1ZB8f
	 nzMUtOiKyPBG4nu+9pWuMXac0qzZdBhRcz3v0Zt8fA97M0nt9u3WJ67agwvj7tycrI
	 pclm9rT8vodBA==
Date: Sun, 27 Sep 2026 20:08:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: soc: qcom,smp2p: add sleepstate
 support
Message-ID: <20260927-supportive-succinct-meerkat-553b4f@quoll>
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-2-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922015801.32373-2-mailingradian@gmail.com>

On Mon, Sep 21, 2026 at 09:57:51PM -0400, Richard Acayan wrote:
> The sleepstate entry is used by Qualcomm sensor DSPs to control
> suspend/resume operations. Even though there is no full support for
> sleep states, initialization of the entry is still necessary for some
> DSPs, notably the sensors-bearing ADSP on the Pixel 3a (SDM670 SoC).
> Allow sleepstates to be declared in the device tree so they can be
> initialized.
> 
> Link: https://android.googlesource.com/kernel/msm/+/91edfe5385f2640a338e2ad230d0fc03c73b77f8/drivers/soc/qcom/smp2p_sleepstate.c
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smp2p.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

