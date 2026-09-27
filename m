Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C743BB9E1;
	Sun, 27 Sep 2026 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532594; cv=none; b=ON0cgcPZVcQuxJeSIc6iJq4rZOKps6k3OtU68W+VtxeQLzGEnSeKD2bR4VRzQKHRsecFMD6sJjD/IYeIhIthmmUpp7gYEHtvleDYv9IBVDQa/lLlsC7YdCQatnwl4pIkbyR8+tPnZlGD/kzPk6BFKMuGgoiEHmh3UauSvs0DDp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532594; c=relaxed/simple;
	bh=gJwWQ8bFMCRUxEk6GeTCDY490yRYUHU3TUusJbMBeAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9rqr31llyuAS8S4W8Jh4NEjqcZuEu9jEiZxi+rgW0ohRuv8rJapyToGCZAwD6JAxqWuO0tUmWYJZh980ThbUiYHl7HqyYkWEDGaaEi3H8P6sMqUiKem+b+YzeNbfMlsEV1UCHat9EIWHMpzu2Ut2tepT6M6A2r3XZeAqp2ti2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPdtoYYQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPdtoYYQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23341F000FF;
	Sun, 27 Sep 2026 18:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790532592;
	bh=+RSQRG0OSHVw9axJJ3ToBLmfuv4EYGQn8uKwSIcvbOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CPdtoYYQ4yF4Hgg86Ae9RrW8j1u8nCRC7XJD3l2/1I1pTDHL/+9nCQa1d0jVFxSdt
	 3X5y3yqtaNQ89r0N1Eu/vYcy28nGm/YG0NejyAdc0W1Ycb0L9JiLT8d0JYJxhOVohj
	 8S4ThIxIOE9nHkOGl+tUgEXhGiT+9+FYKQHCdNl1fNJQoiy68NuyaznDBlHPupTeNF
	 krmes3WOiFvrdHJEBnpG5EFruSEmmJYEN13klo4Ai2bkGdUvPebGg1giUNTceIDBQ3
	 mF39l0Ft7N6aQ0l5/hCQL0AFS6sBawvkYd42EUGK8Gbzbn9BO02+s+ppfWhkbRUBov
	 LBUu00vyxKQOQ==
Date: Sun, 27 Sep 2026 20:09:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 02/11] dt-bindings: mailbox: qcom: Add SDM670 APCS
 compatible
Message-ID: <20260927-majestic-fine-pronghorn-3cecfd@quoll>
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-3-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922015801.32373-3-mailingradian@gmail.com>

On Mon, Sep 21, 2026 at 09:57:52PM -0400, Richard Acayan wrote:
> Add the compatible for the APCS in the SDM670 SoC.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

