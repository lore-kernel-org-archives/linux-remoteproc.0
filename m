Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1088B347C7;
	Fri,  2 Jan 2026 11:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767351644; cv=none; b=Dq8a4fzeJ+Lz+AJRFmJd9dntbHePWdOrXd4nk8PNpbwGWSlQ08VGfpyAOCiQzCP+qNooD2Q5gKsqzjqG10lbXAiWZMk82O/O1BVCkHeW7ByuwQpk6Z9qDNHGtgAO8BOOnU9qEtisOdufea4B12dX//LW4jYe9pCj5VZuLalqTKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767351644; c=relaxed/simple;
	bh=ySQRVmP5atzDa4tw/bxgID25wfDNGObEZ8ydZntOI2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTNOWl/mG4DxHIdWq79B60DLCTtv72IKosSkOVikLbOGop8YUTk0vmu2nVwwLQOqV/aV1Ww8rbSaZaPzoPl0e+Ev36XH8n8QVAn4i5sBxbeMM0n1QvUuzaQ8U5zx9dlT58PdMPHDAqFxf/XVWWt6zpfC3BA5u87TKLJCPN/9fsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kt/LLlhk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kt/LLlhk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5B4C116B1;
	Fri,  2 Jan 2026 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767351643;
	bh=ySQRVmP5atzDa4tw/bxgID25wfDNGObEZ8ydZntOI2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kt/LLlhk8HCeZJE8gfA+fHnQ4fDlfLO6xvJYcCXED8Nv/tnMYIhVWWhI76+UhkAH+
	 waisOhShXwqGmpa5SLAcUAw1HcDqRKHGQLMrJRXhEK7qm9qIpJoE1+JWzOKIE85Rgj
	 zIzV//SrZsgltWsrzj+Nr8KlU+x/DXQjj/8MjFctVZqJ6MKJkQiCzdo4tH2qe9VdMW
	 yOzgyj2ZQxI57tYCxiqrrJii/jWxW3IDzMVUnh8kkfI4qS9DAdiEuU2M3tuNB6guKY
	 O1dQ4G06u+ChXDtkwRqJO3qDWxUCnOh3W9mBtcZJ8YQ8dJFQtX4lejnO1e4v5QlKgE
	 v831A7/o9WyXA==
Date: Fri, 2 Jan 2026 12:00:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 8/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Add MSM8940
Message-ID: <20260102-belligerent-prophetic-porcupine-1a18a6@quoll>
References: <20251231-mss-v3-0-f80e8fade9ec@mainlining.org>
 <20251231-mss-v3-8-f80e8fade9ec@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251231-mss-v3-8-f80e8fade9ec@mainlining.org>

On Wed, Dec 31, 2025 at 05:30:18PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add the compatible for MSS as found on the MSM8940 platform.
>=20
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml |=
 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

