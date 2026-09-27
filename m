Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201D1242D88;
	Sun, 27 Sep 2026 18:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532646; cv=none; b=bJWmgdPgC6wnjnqCOVNCRP6YjWw/e3o27VGGPCde4jc67+BNxIlrqSvVsseJYIffS9kcwsNFonUJfcKD9CGNeR+cj0mLRkKQC+i1puImsybycV86MlufiV4IpHG4XMc6wkmuq9V30JccUW0LY+YJ+M/54J7dPKBRsZTv7i/+fjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532646; c=relaxed/simple;
	bh=gGHi19yYOs/boU3QoO3WQPSPrFCgKFR+Khr2Fhd3NnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNVZXlN9yojihRuFkS0Wgb367PM6bssuNW4IhdVM1SIN0wHQgT7jKgXn7oyHs0x0K31doqy3FCCCFECkvQ2tpzzHc1v5/UY2AwPf6pCyBeCgv9d+8/9Y4Z+rRJUFQlLo6QKlYbLYLFidPblrn0vr7hwHXszV1ozPDyRRrjneuLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7LCLRuZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7LCLRuZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A8F1F000FF;
	Sun, 27 Sep 2026 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790532644;
	bh=W2InJ+6FsScm2xkfKARDAbycXWZRcIAo+/EttpBs3Q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e7LCLRuZhbmCGU/O9Ean7cCmSr0s411c8sDGcU6sBDKlA92cfiLwPpzIudTQQT5G6
	 Mz8PunG+dO+4imYMRNuUVy/GBwqoH5GMHWdyq5yPKcKIhGE7UVztArJXjM+X812DhF
	 GVJcBgQhdr4e9ObVCB6hYY+dW87lTwzEjonJ0Y1TYfueyS7fyvm+8tPTkroPtb4vnb
	 RW2K4r8XrvyokILq0ioZtZJKCjghhzfJBKxFoN2RyF+Ac1+wby/U+YAx53x8hLt23a
	 IcaPPPdgpgh9fjTiFmEHYPpfpzgq2HY3rv6ncKEitp9cUsVZy9qVBn5QQeOn3Wh9RN
	 OjrX2RDbWIdAg==
Date: Sun, 27 Sep 2026 20:10:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 04/11] dt-bindings: remoteproc: qcom: adsp: Add SDM670
 ADSP compatible
Message-ID: <20260927-antique-honored-quail-ddbdba@quoll>
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922015801.32373-5-mailingradian@gmail.com>

On Mon, Sep 21, 2026 at 09:57:54PM -0400, Richard Acayan wrote:
> Add the compatible for the Audio DSP on SDM670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

You need to update constraints.

Best regards,
Krzysztof

