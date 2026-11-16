Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826749;
	b=Q0xQtAOtmjGjeEJlMqzkx2NGZw6INiaYQwkVVNDApmx4ga0RQsXG2DfY3nCYmg8RdlsE
	 5wuADDB3YVxgd7OOAjPvFFjSTSh8xCRjBSjUEw0iBpE5AWjwbt50Ju5cQZDwfmsUPEdSg
	 0HO2sLSoJUDy+ZbfopPtUG3WA7dxtRYFsF1h1kqanYDH8Tk/6d9T65hw/g2gYvvrb+4MQ
	 S1GsHv2bJT5TXcxdX8J/der1+sE6tCfeGuhH4cbDCRm1nuYD/ORXablwEP6okL2WKHPNX
	 zgVfXSA/XFRtI1BM6VSHCSM3vLhLOai/fgZm+pwOl6X4BpHLRXgKXqPpv+hH0xVG9RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826749;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pje+88yqsnjPb4v7G49STbO4mSfuR97yw3dHecwwfXY=;
	b=KgUoKorJF8+tkgy7YqwPa/l+7ehyLTE9KpjPuLj6TTjFTfd0jqwava+yeQLYB5Lo0pqg
	 8YujDs/DufuXVP62bViunDOOhYd6/DYAMewtvzccbBJgmWQ94QpQ/fm7DQ+DxmTn6kjR/
	 Gganba89z2cIwwglNw08U4QJfi2LRTccpIvJ8pDU6CsNMcJegAu1lAtQFVuLnr7G6sjIX
	 82akwN4ueVCthVQqIor4hyjJEcGrDvFtEQWNpFHn65uzwjts7hYbMYNikTY/MvQzd3OZG
	 nqs05zKQcBk7D1Yi2tKF51xLS2lC0EUMq2zeOktCpiBI82DBmUv9QVvILX5TTUvpAWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AtQvQERE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67858606A31C;
	Mon, 16 Nov 2026 10:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AtQvQERE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E39F21F000C4;
	Mon, 16 Nov 2026 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826749;
	bh=pje+88yqsnjPb4v7G49STbO4mSfuR97yw3dHecwwfXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AtQvQERE+b55MeBku+xrTjmH56HN3KDTa04NkqtqUxzp1Yd8yCGDlprpwX89MfcAW
	 Vnf8GSCNu2u/MPZiua6KYUtwhW7XYVIHFn2zDxQfs8q5wmBfKnA5fs3ioXqmoDc2Mn
	 W719H6qO1gEvPjV9jzNagus8VKqTkGmr6xP068ErFkHPgNSvSfeWBPJF5vbra3Enmv
	 3SwWxVbNfB3jqFxRcOMUl8xiga/JoRtCoUDffTCzmSbe3CXaHGHXV5xuDhejwNiqBF
	 JULIBGpJQ+kGO2C5NSm6kOH5jmxpgzWthjH/csfYhJ9hKnqlJ9Y8yx5vkg4FZnXhNc
	 H9xvc7/6tH+QQ==
Date: Mon, 16 Nov 2026 11:59:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kumar Patro <bibek.patro@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: remoteproc: qcom,shikra-pas: Add
 iommus constraints
Message-ID: <20261116-thankful-educational-bullmastiff-9a9beb@quoll>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
 <20261113-shikra-el2-v5-2-8aca743de97f@oss.qualcomm.com>
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
In-Reply-To: <20261113-shikra-el2-v5-2-8aca743de97f@oss.qualcomm.com>

On Fri, Nov 13, 2026 at 08:02:21PM +0530, Komal Bajaj wrote:
> Describe the iommus streams of the Shikra PAS remoteprocs, needed when
> Linux boots at EL2 without the hypervisor: CDSP uses a single stream,
> while LPAICP firmware uses three.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/remoteproc/qcom,shikra-pas.yaml  | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>

Same problems as in review of previous version.

Best regards,
Krzysztof

